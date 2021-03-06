/*
 * GovPay - Porta di Accesso al Nodo dei Pagamenti SPC 
 * http://www.gov4j.it/govpay
 * 
 * Copyright (c) 2014-2017 Link.it srl (http://www.link.it).
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3, as published by
 * the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
package it.govpay.web.rs.dars.anagrafica.tributi;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipOutputStream;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.UriInfo;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;
import org.openspcoop2.generic_project.exception.NotFoundException;
import org.openspcoop2.generic_project.expression.SortOrder;

import it.govpay.bd.BasicBD;
import it.govpay.bd.FilterSortWrapper;
import it.govpay.bd.anagrafica.DominiBD;
import it.govpay.bd.anagrafica.IbanAccreditoBD;
import it.govpay.bd.anagrafica.TipiTributoBD;
import it.govpay.bd.anagrafica.TributiBD;
import it.govpay.bd.anagrafica.filters.IbanAccreditoFilter;
import it.govpay.bd.anagrafica.filters.TipoTributoFilter;
import it.govpay.bd.anagrafica.filters.TributoFilter;
import it.govpay.bd.model.Tributo;
import it.govpay.model.IbanAccredito;
import it.govpay.model.TipoTributo;
import it.govpay.model.Tributo.TipoContabilta;
import it.govpay.web.rs.dars.BaseDarsHandler;
import it.govpay.web.rs.dars.BaseDarsService;
import it.govpay.web.rs.dars.IDarsHandler;
import it.govpay.web.rs.dars.anagrafica.tributi.input.CodContabilita;
import it.govpay.web.rs.dars.anagrafica.tributi.input.CodificaTributoInIuv;
import it.govpay.web.rs.dars.anagrafica.tributi.input.TipoContabilita;
import it.govpay.web.rs.dars.exception.ConsoleException;
import it.govpay.web.rs.dars.exception.DuplicatedEntryException;
import it.govpay.web.rs.dars.exception.ValidationException;
import it.govpay.web.rs.dars.model.Dettaglio;
import it.govpay.web.rs.dars.model.Elenco;
import it.govpay.web.rs.dars.model.InfoForm;
import it.govpay.web.rs.dars.model.InfoForm.Sezione;
import it.govpay.web.rs.dars.model.RawParamValue;
import it.govpay.web.rs.dars.model.Voce;
import it.govpay.web.rs.dars.model.input.ParamField;
import it.govpay.web.rs.dars.model.input.RefreshableParamField;
import it.govpay.web.rs.dars.model.input.base.CheckButton;
import it.govpay.web.rs.dars.model.input.base.InputNumber;
import it.govpay.web.rs.dars.model.input.base.InputText;
import it.govpay.web.rs.dars.model.input.base.SelectList;
import it.govpay.web.utils.Utils;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class TributiHandler extends BaseDarsHandler<Tributo> implements IDarsHandler<Tributo>{

	private Map<String, ParamField<?>> infoCreazioneMap = null;
	private Map<String, ParamField<?>> infoRicercaMap = null;
	public static final String ANAGRAFICA_UO = "anagrafica";
	private Long idDominio = null;

	public TributiHandler(Logger log, BaseDarsService darsService) {
		super(log,darsService);
	}

	@Override
	public Elenco getElenco(UriInfo uriInfo,BasicBD bd) throws WebApplicationException,ConsoleException {
		String methodName = "getElenco " + this.titoloServizio;
		try{	
			// Operazione consentita solo all'amministratore
			this.darsService.checkOperatoreAdmin(bd);

			Integer offset = this.getOffset(uriInfo);
			Integer limit = this.getLimit(uriInfo);
			URI esportazione = null;
			URI cancellazione = null;

			boolean visualizzaRicerca = true;
			this.log.info("Esecuzione " + methodName + " in corso..."); 

			TributiBD tributiBD = new TributiBD(bd);
			TributoFilter filter = tributiBD.newFilter();
			filter.setOffset(offset);
			filter.setLimit(limit);
			FilterSortWrapper fsw = new FilterSortWrapper();
			fsw.setField(it.govpay.orm.Tributo.model().TIPO_TRIBUTO.COD_TRIBUTO);
			fsw.setSortOrder(SortOrder.ASC);
			filter.getFilterSortList().add(fsw);

			String idDominioId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio+ ".idDominio.id");
			this.idDominio = this.getParameter(uriInfo, idDominioId, Long.class);

			filter.setIdDominio(this.idDominio);

			String codTributoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codTributo.id");
			String codTributo = this.getParameter(uriInfo, codTributoId, String.class);
			filter.setCodTributo(codTributo); 

			long count = tributiBD.count(filter);

			Map<String, String> params = new HashMap<String, String>();
			params.put(idDominioId, this.idDominio + "");
			// visualizza la ricerca solo se i risultati sono > del limit
			visualizzaRicerca = visualizzaRicerca && this.visualizzaRicerca(count, limit);
			InfoForm infoRicerca = this.getInfoRicerca(uriInfo, bd, visualizzaRicerca,params);

			Elenco elenco = new Elenco(this.titoloServizio, infoRicerca, this.getInfoCreazione(uriInfo, bd), count, esportazione, cancellazione); 

			List<Tributo> findAll = tributiBD.findAll(filter);

			if(findAll != null && findAll.size() > 0){
				for (Tributo entry : findAll) {
					elenco.getElenco().add(this.getElemento(entry, entry.getId(), this.pathServizio,bd));
				}
			}

			this.log.info("Esecuzione " + methodName + " completata.");

			return elenco;
		}catch(WebApplicationException e){
			throw e;
		}catch(Exception e){
			throw new ConsoleException(e);
		}
	}

	@Override
	public InfoForm getInfoRicerca(UriInfo uriInfo, BasicBD bd, boolean visualizzaRicerca, Map<String, String> parameters) throws ConsoleException {
		URI ricerca =  this.getUriRicerca(uriInfo, bd, parameters);
		InfoForm infoRicerca = new InfoForm(ricerca);

		if(visualizzaRicerca) {
			String codTributoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codTributo.id");

			if(this.infoRicercaMap == null){
				this.initInfoRicerca(uriInfo, bd);
			}

			Sezione sezioneRoot = infoRicerca.getSezioneRoot();

			InputText codTributo = (InputText) this.infoRicercaMap.get(codTributoId);
			codTributo.setDefaultValue(null);
			sezioneRoot.addField(codTributo);

		}
		return infoRicerca;
	}

	private void initInfoRicerca(UriInfo uriInfo, BasicBD bd) throws ConsoleException{
		if(this.infoRicercaMap == null){
			this.infoRicercaMap = new HashMap<String, ParamField<?>>();

			String codTributoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codTributo.id");

			// codTributo
			String codTributoLabel = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codTributo.label");
			InputText codTributo = new InputText(codTributoId, codTributoLabel, null, false, false, true, 1, 255);
			this.infoRicercaMap.put(codTributoId, codTributo);

		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public InfoForm getInfoCreazione(UriInfo uriInfo, BasicBD bd) throws ConsoleException {
		URI creazione = this.getUriCreazione(uriInfo, bd);
		InfoForm infoCreazione = new InfoForm(creazione,Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".creazione.titolo"));

		String idDominioId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idDominio.id");
		String idIbanAccreditoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idIbanAccredito.id");
		String abilitatoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".abilitato.id");
		String tributoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".id.id");
		String tipoContabilitaId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.id");
		String codContabilitaId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.id");
		String idTipoTributoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idTipoTributo.id");
		String codificaTributoInIuvId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.id");

		if(this.infoCreazioneMap == null){
			this.initInfoCreazione(uriInfo, bd);

		}

		Sezione sezioneRoot = infoCreazione.getSezioneRoot();

		InputNumber idITributo = (InputNumber) this.infoCreazioneMap.get(tributoId);
		idITributo.setDefaultValue(null);
		sezioneRoot.addField(idITributo);

		SelectList<Long> idTipoTributo  = (SelectList<Long>) this.infoCreazioneMap.get(idTipoTributoId);
		List<Voce<Long>> idTipoTributoValues = new ArrayList<Voce<Long>>();

		try{
			// 1. prelevo i tipi tributi gia' definiti per il dominio

			TributiBD tributiBD = new TributiBD(bd);
			List<Long> listaIdTipiTributoDaEscludere = tributiBD.getIdTipiTributiDefinitiPerDominio(this.idDominio);

			TipiTributoBD tipiTributoBD = new TipiTributoBD(bd);
			TipoTributoFilter filterTipiTributi = tipiTributoBD.newFilter();
			filterTipiTributi.setListaIdTributiDaEscludere(listaIdTipiTributoDaEscludere );
			FilterSortWrapper fsw = new FilterSortWrapper();
			fsw.setField(it.govpay.orm.TipoTributo.model().DESCRIZIONE);
			fsw.setSortOrder(SortOrder.ASC);
			filterTipiTributi.getFilterSortList().add(fsw);
			List<it.govpay.model.TipoTributo> findAll = tipiTributoBD.findAll(filterTipiTributi);
			if(findAll != null && findAll.size() > 0){
				for (it.govpay.model.TipoTributo tipoTributo : findAll) {
					String label = Utils.getInstance(this.getLanguage()).getMessageWithParamsFromResourceBundle(this.nomeServizio + ".idTipoTributo.label.form", tipoTributo.getDescrizione(),tipoTributo.getCodTributo());
					idTipoTributoValues.add(new Voce<Long>(label, tipoTributo.getId()));
				}
			}
		}catch(Exception e){
			throw new ConsoleException(e);
		}
		idTipoTributo.setEditable(true);
		idTipoTributo.setHidden(false);
		idTipoTributo.setValues(idTipoTributoValues);
		idTipoTributo.setDefaultValue(null);
		sezioneRoot.addField(idTipoTributo);

		InputNumber idDominio = (InputNumber) this.infoCreazioneMap.get(idDominioId);
		idDominio.setDefaultValue(this.idDominio);
		sezioneRoot.addField(idDominio);

		SelectList<Long> idIbanAccredito  = (SelectList<Long>) this.infoCreazioneMap.get(idIbanAccreditoId);
		List<Voce<Long>> listaIban = new ArrayList<Voce<Long>>();

		try{
			DominiBD dominiBD = new DominiBD(bd);
			IbanAccreditoBD ibanAccreditoBD = new IbanAccreditoBD(bd);
			IbanAccreditoFilter filterIban = ibanAccreditoBD.newFilter();
			FilterSortWrapper fsw = new FilterSortWrapper();
			fsw.setField(it.govpay.orm.IbanAccredito.model().COD_IBAN);
			fsw.setSortOrder(SortOrder.ASC);
			filterIban.getFilterSortList().add(fsw);
			filterIban.setCodDominio(dominiBD.getDominio(this.idDominio).getCodDominio());   
			List<it.govpay.model.IbanAccredito> findAll = ibanAccreditoBD.findAll(filterIban);

			if(findAll != null && findAll.size() > 0){
				for (it.govpay.model.IbanAccredito ib : findAll) {
					listaIban.add(new Voce<Long>(ib.getCodIban(), ib.getId()));  
				}
			}

		}catch(Exception e){
			throw new ConsoleException(e);
		}
		idIbanAccredito.setEditable(true);
		idIbanAccredito.setHidden(false);
		idIbanAccredito.setRequired(true);
		idIbanAccredito.setValues(listaIban);
		idIbanAccredito.setDefaultValue(null);
		sezioneRoot.addField(idIbanAccredito);

		List<RawParamValue> idTipoTributoDependencyValues = new ArrayList<RawParamValue>();
		idTipoTributoDependencyValues.add(new RawParamValue(idTipoTributoId, null));


		TipoContabilita tipoContabilita = (TipoContabilita) this.infoCreazioneMap.get(tipoContabilitaId);
		tipoContabilita.init(idTipoTributoDependencyValues, bd,this.getLanguage());
		sezioneRoot.addField(tipoContabilita);

		CodContabilita codContabilita = (CodContabilita) this.infoCreazioneMap.get(codContabilitaId);
		codContabilita.init(idTipoTributoDependencyValues, bd,this.getLanguage());
		sezioneRoot.addField(codContabilita);

		CodificaTributoInIuv codificaTributoInIuv = (CodificaTributoInIuv) this.infoCreazioneMap.get(codificaTributoInIuvId);
		codificaTributoInIuv.init(idTipoTributoDependencyValues, bd,this.getLanguage());
		sezioneRoot.addField(codificaTributoInIuv);

		CheckButton abilitato = (CheckButton) this.infoCreazioneMap.get(abilitatoId);
		abilitato.setDefaultValue(true); 
		sezioneRoot.addField(abilitato);


		return infoCreazione;
	}

	private void initInfoCreazione(UriInfo uriInfo, BasicBD bd) throws ConsoleException{
		if(this.infoCreazioneMap == null){
			this.infoCreazioneMap = new HashMap<String, ParamField<?>>();

			String idDominioId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idDominio.id");
			String idIbanAccreditoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idIbanAccredito.id");
			String abilitatoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".abilitato.id");
			String tributoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".id.id");
			String idTipoTributoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idTipoTributo.id");
			String tipoContabilitaId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.id");
			String codContabilitaId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.id");
			String codificaTributoInIuvId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.id");

			// id 
			InputNumber id = new InputNumber(tributoId, null, null, true, true, false, 1, 20);
			this.infoCreazioneMap.put(tributoId, id);

			// tipoTributo
			String idTipoTributoLabel = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idTipoTributo.label");
			List<Voce<Long>> idTipoTributoValues = new ArrayList<Voce<Long>>();
			SelectList<Long> idTipoTributo = new SelectList<Long>(idTipoTributoId, idTipoTributoLabel, null, true, false, true, idTipoTributoValues );
			idTipoTributo.setSuggestion(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idTipoTributo.suggestion"));
			this.infoCreazioneMap.put(idTipoTributoId, idTipoTributo);

			// idDominio
			InputNumber idDominio = new InputNumber(idDominioId, null, null, true, true, false, 1, 255);
			this.infoCreazioneMap.put(idDominioId, idDominio);

			String idIbanAccreditoLabel = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idIbanAccredito.label");
			List<Voce<Long>> ibanValues = new ArrayList<Voce<Long>>();
			SelectList<Long> idIbanAccredito = new SelectList<Long>(idIbanAccreditoId, idIbanAccreditoLabel, null, true, false, true, ibanValues );
			this.infoCreazioneMap.put(idIbanAccreditoId, idIbanAccredito);

			List<RawParamValue> idTipoTributoDependencyValues = new ArrayList<RawParamValue>();
			idTipoTributoDependencyValues.add(new RawParamValue(idTipoTributoId, null));

			// tipoContabilita
			String tipoContabilitaLabel = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.label");

			URI tipoContabilitaRefreshUri = this.getUriField(uriInfo, bd, tipoContabilitaId); 
			TipoContabilita tipoContabilita = new TipoContabilita(this.nomeServizio, tipoContabilitaId, tipoContabilitaLabel, tipoContabilitaRefreshUri, idTipoTributoDependencyValues, bd,this.getLanguage());
			tipoContabilita.addDependencyField(idTipoTributo);
			tipoContabilita.init(idTipoTributoDependencyValues, bd,this.getLanguage());

			List<Voce<String>> tipoContabilitaValues = new ArrayList<Voce<String>>();
			//			tipoContabilitaValues.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.capitolo"), TipoContabilta.CAPITOLO.getCodifica()));
			//			tipoContabilitaValues.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.speciale"), TipoContabilta.SPECIALE.getCodifica()));
			//			tipoContabilitaValues.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.siope"), TipoContabilta.SIOPE.getCodifica()));
			//			tipoContabilitaValues.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.altro"), TipoContabilta.ALTRO.getCodifica()));
			SelectList<String> tipoContabilitaMod = new SelectList<String>(tipoContabilitaId, tipoContabilitaLabel, null, false, false, true, tipoContabilitaValues );
			//			tipoContabilita.setSuggestion(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.suggestion")); 
			this.infoCreazioneMap.put(tipoContabilitaId, tipoContabilita);
			this.infoCreazioneMap.put(tipoContabilitaId+"_update", tipoContabilitaMod);

			// codContabilita
			String codContabilitaLabel = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.label");
			URI codContabilitaRefreshUri = this.getUriField(uriInfo, bd, codContabilitaId); 
			CodContabilita codContabilita = new CodContabilita(this.nomeServizio, codContabilitaId, codContabilitaLabel, 1, 255, codContabilitaRefreshUri, idTipoTributoDependencyValues, bd,this.getLanguage());
			codContabilita.setValidation("^\\S+$", Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.errorMessage"));
			codContabilita.addDependencyField(idTipoTributo);
			codContabilita.init(idTipoTributoDependencyValues, bd,this.getLanguage());

			InputText codContabilitaMod = new InputText(codContabilitaId, codContabilitaLabel, null, false, false, true, 1, 255);
			codContabilitaMod.setValidation("^\\S+$", Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.errorMessage"));


			this.infoCreazioneMap.put(codContabilitaId, codContabilita);
			this.infoCreazioneMap.put(codContabilitaId+"_update", codContabilitaMod);

			// codificaTributoInIuv
			String codificaTributoInIuvLabel = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.label");
			URI codificaTributoInIuvRefreshUri = this.getUriField(uriInfo, bd, codificaTributoInIuvId); 
			CodificaTributoInIuv codificaTributoInIuv =
					new CodificaTributoInIuv(this.nomeServizio, codificaTributoInIuvId, codificaTributoInIuvLabel, 1, 4, codificaTributoInIuvRefreshUri, idTipoTributoDependencyValues, bd,this.getLanguage());
			codificaTributoInIuv.setValidation("[0-9]{4}", Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.errorMessage"));
			codificaTributoInIuv.setAvanzata(true); 
			codificaTributoInIuv.addDependencyField(idTipoTributo);
			codificaTributoInIuv.init(idTipoTributoDependencyValues, bd,this.getLanguage());

			InputText codificaTributoInIuvMod = new InputText(codificaTributoInIuvId, codificaTributoInIuvLabel, null, false, false, true, 1,4);
			codificaTributoInIuvMod.setValidation("[0-9]{4}", Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.errorMessage"));
			codificaTributoInIuvMod.setAvanzata(true); 

			this.infoCreazioneMap.put(codificaTributoInIuvId, codificaTributoInIuv);
			this.infoCreazioneMap.put(codificaTributoInIuvId+"_update", codificaTributoInIuvMod);

			// abilitato
			String abilitatoLabel = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".abilitato.label");
			CheckButton abiliato = new CheckButton(abilitatoId, abilitatoLabel, true, false, false, true);
			this.infoCreazioneMap.put(abilitatoId, abiliato);

		}


	}

	@SuppressWarnings("unchecked")
	@Override
	public InfoForm getInfoModifica(UriInfo uriInfo, BasicBD bd, Tributo entry) throws ConsoleException {
		URI modifica = this.getUriModifica(uriInfo, bd);
		InfoForm infoModifica = new InfoForm(modifica,Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".modifica.titolo"));

		String idDominioId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idDominio.id");
		String idIbanAccreditoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idIbanAccredito.id");
		String abilitatoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".abilitato.id");
		String tributoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".id.id");
		String tipoContabilitaId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.id");
		String codContabilitaId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.id");
		String idTipoTributoId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idTipoTributo.id");
		String codificaTributoInIuvId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.id");

		if(this.infoCreazioneMap == null){
			this.initInfoCreazione(uriInfo, bd);
		}

		Sezione sezioneRoot = infoModifica.getSezioneRoot();
		InputNumber idTributo = (InputNumber) this.infoCreazioneMap.get(tributoId);
		idTributo.setDefaultValue(entry.getId());
		sezioneRoot.addField(idTributo);

		InputNumber idTipoTributo = new InputNumber(idTipoTributoId, null, null, true, true, false, 1, 255);
		idTipoTributo.setDefaultValue(entry.getIdTipoTributo());
		sezioneRoot.addField(idTipoTributo);

		InputNumber idDominio = (InputNumber) this.infoCreazioneMap.get(idDominioId);
		idDominio.setDefaultValue(entry.getIdDominio());
		sezioneRoot.addField(idDominio);

		SelectList<Long> idIbanAccredito  = (SelectList<Long>) this.infoCreazioneMap.get(idIbanAccreditoId);
		List<Voce<Long>> listaIban = new ArrayList<Voce<Long>>();

		if(!entry.getCodTributo().equals(it.govpay.model.Tributo.BOLLOT)){
			try{
				DominiBD dominiBD = new DominiBD(bd);
				IbanAccreditoBD ibanAccreditoBD = new IbanAccreditoBD(bd);
				IbanAccreditoFilter filterIban = ibanAccreditoBD.newFilter();
				FilterSortWrapper fsw = new FilterSortWrapper();
				fsw.setField(it.govpay.orm.IbanAccredito.model().COD_IBAN);
				fsw.setSortOrder(SortOrder.ASC);
				filterIban.getFilterSortList().add(fsw);
				filterIban.setCodDominio(dominiBD.getDominio(entry.getIdDominio()).getCodDominio());   
				List<it.govpay.model.IbanAccredito> findAll = ibanAccreditoBD.findAll(filterIban);

				if(findAll != null && findAll.size() > 0){
					for (it.govpay.model.IbanAccredito ib : findAll) {
						listaIban.add(new Voce<Long>(ib.getCodIban(), ib.getId()));  
					}
				}

			}catch(Exception e){
				throw new ConsoleException(e);
			}
			idIbanAccredito.setEditable(true);
			idIbanAccredito.setHidden(false);
			idIbanAccredito.setRequired(true);
		} else {
			idIbanAccredito.setEditable(false);
			idIbanAccredito.setHidden(true);
			idIbanAccredito.setRequired(false);
		}

		idIbanAccredito.setValues(listaIban);
		idIbanAccredito.setDefaultValue(entry.getIdIbanAccredito());
		sezioneRoot.addField(idIbanAccredito);

		// prelevo le versioni statiche per l'update
		SelectList<String> tipoContabilita = (SelectList<String>) this.infoCreazioneMap.get(tipoContabilitaId+"_update");

		TipoContabilta tipoContabilitaCustom = entry.getTipoContabilitaCustom();
		TipoContabilta tipoContabilitaDefault = entry.getTipoContabilitaDefault();

		List<Voce<String>> lst = new ArrayList<Voce<String>>();
		if(tipoContabilitaDefault != null){
			switch(tipoContabilitaDefault){
			case ALTRO:
				lst.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.altro.default"), TipoContabilta.ALTRO.getCodifica() + "_p"));
				break;
			case SIOPE:
				lst.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.siope.default"), TipoContabilta.SIOPE.getCodifica() + "_p"));
				break;
			case SPECIALE:
				lst.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.speciale.default"), TipoContabilta.SPECIALE.getCodifica() + "_p"));
				break;
			case CAPITOLO:
			default:
				lst.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.capitolo.default"), TipoContabilta.CAPITOLO.getCodifica() + "_p"));
				break;
			}
		}

		lst.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.capitolo"), TipoContabilta.CAPITOLO.getCodifica()));
		lst.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.speciale"), TipoContabilta.SPECIALE.getCodifica()));
		lst.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.siope"), TipoContabilta.SIOPE.getCodifica()));
		lst.add(new Voce<String>(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.altro"), TipoContabilta.ALTRO.getCodifica()));


		if(tipoContabilitaCustom == null) {
			tipoContabilita.setDefaultValue(tipoContabilitaDefault.getCodifica() + "_p");
		} else {
			tipoContabilita.setDefaultValue(tipoContabilitaCustom.getCodifica());
		}

		tipoContabilita.setValues(lst); 
		sezioneRoot.addField(tipoContabilita);

		InputText codContabilita = (InputText) this.infoCreazioneMap.get(codContabilitaId+"_update");
		String codContabilitaLabel = StringUtils.isNotEmpty(entry.getCodContabilitaDefault()) ?	Utils.getInstance(this.getLanguage()).getMessageWithParamsFromResourceBundle(this.nomeServizio + ".codContabilita.label.default.form",entry.getCodContabilitaDefault()) :	Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.label");
		codContabilita.setLabel(codContabilitaLabel);
		codContabilita.setDefaultValue(entry.getCodContabilitaCustom());
		sezioneRoot.addField(codContabilita);

		InputText codificaTributoInIuv = (InputText) this.infoCreazioneMap.get(codificaTributoInIuvId+"_update");
		String codificaTributoInIuvLabel = StringUtils.isNotEmpty(entry.getCodTributoIuvDefault()) ? Utils.getInstance(this.getLanguage()).getMessageWithParamsFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.label.default.form",entry.getCodTributoIuvDefault()) : Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.label");

		codificaTributoInIuv.setLabel(codificaTributoInIuvLabel);
		codificaTributoInIuv.setDefaultValue(entry.getCodTributoIuvCustom());
		sezioneRoot.addField(codificaTributoInIuv);

		CheckButton abilitato = (CheckButton) this.infoCreazioneMap.get(abilitatoId);
		abilitato.setDefaultValue(entry.isAbilitato()); 
		sezioneRoot.addField(abilitato);

		return infoModifica;
	}

	@Override
	public Object getField(UriInfo uriInfo,List<RawParamValue>values, String fieldId,BasicBD bd) throws WebApplicationException,ConsoleException {
		this.log.debug("Richiesto field ["+fieldId+"]");
		try{
			// Operazione consentita solo all'amministratore
			this.darsService.checkOperatoreAdmin(bd);

			if(this.infoCreazioneMap == null){
				this.initInfoCreazione(uriInfo, bd);
			}

			if(this.infoCreazioneMap.containsKey(fieldId)){
				RefreshableParamField<?> paramField = (RefreshableParamField<?>) this.infoCreazioneMap.get(fieldId);
				paramField.aggiornaParametro(values,bd,this.getLanguage());
				return paramField;
			}

			this.log.debug("Field ["+fieldId+"] non presente.");

		}catch(Exception e){
			throw new ConsoleException(e);
		}
		return null;
	}

	@Override
	public Dettaglio getDettaglio(long id, UriInfo uriInfo, BasicBD bd) throws WebApplicationException,ConsoleException {
		String methodName = "dettaglio " + this.titoloServizio + "."+ id;

		try{
			this.log.info("Esecuzione " + methodName + " in corso...");
			// Operazione consentita solo all'amministratore
			this.darsService.checkOperatoreAdmin(bd);

			// recupero oggetto
			TributiBD tributiBD = new TributiBD(bd);
			Tributo tributo = tributiBD.getTributo(id);

			InfoForm infoModifica = this.getInfoModifica(uriInfo, bd,tributo);
			URI cancellazione = null;
			URI esportazione = null;

			Dettaglio dettaglio = new Dettaglio(this.getTitolo(tributo,bd), esportazione, cancellazione, infoModifica);

			it.govpay.web.rs.dars.model.Sezione root = dettaglio.getSezioneRoot(); 

			// dati del tributo
			root.addVoce(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codTributo.label"), tributo.getCodTributo());
			root.addVoce(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".descrizione.label"), tributo.getDescrizione());

			if(tributo.getIdIbanAccredito() != null){
				IbanAccredito ibanAccredito = tributo.getIbanAccredito(bd); 
				root.addVoce(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".idIbanAccredito.label"), ibanAccredito.getCodIban());
			}

			TipoContabilta tipoContabilita = tributo.getTipoContabilita() != null ? tributo.getTipoContabilita() : TipoContabilta.CAPITOLO;
			String tipoContabilitaValue = null;
			switch (tipoContabilita) {
			case ALTRO:
				tipoContabilitaValue = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.altro");
				break;
			case SPECIALE:
				tipoContabilitaValue = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.speciale");
				break;
			case SIOPE:
				tipoContabilitaValue = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.siope");
				break;
			case CAPITOLO:
			default:
				tipoContabilitaValue = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.capitolo");				
				break;
			}

			String tipoContabilitaLabel = !tributo.isTipoContabilitaCustom() ? Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.label.default") : Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.label.custom");
			root.addVoce(tipoContabilitaLabel, tipoContabilitaValue);

			String codContabilitaLabel = !tributo.isCodContabilitaCustom() ? Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.label.default") : Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.label.custom");
			root.addVoce(codContabilitaLabel, tributo.getCodContabilita());

			if(StringUtils.isNotEmpty(tributo.getCodTributoIuv())){
				String codificaTributoInIuvLabel = !tributo.isCodTributoIuvCustom() ? Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.label.default") : Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.label.custom");
				root.addVoce(codificaTributoInIuvLabel, tributo.getCodTributoIuv(),true);
			}

			root.addVoce(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".abilitato.label"), Utils.getSiNoAsLabel(tributo.isAbilitato()));

			this.log.info("Esecuzione " + methodName + " completata.");

			return dettaglio;
		}catch(WebApplicationException e){
			throw e;
		}catch(Exception e){
			throw new ConsoleException(e);
		}
	}

	@Override
	public Dettaglio insert(InputStream is, UriInfo uriInfo, BasicBD bd)
			throws WebApplicationException, ConsoleException,ValidationException,DuplicatedEntryException {
		String methodName = "Insert " + this.titoloServizio;

		try{
			this.log.info("Esecuzione " + methodName + " in corso...");
			// Operazione consentita solo all'amministratore
			this.darsService.checkOperatoreAdmin(bd);

			Tributo entry = this.creaEntry(is, uriInfo, bd);

			this.checkEntry(entry, null);

			TributiBD tributiBD = new TributiBD(bd);

			try{
				tributiBD.getTributo(entry.getIdDominio(),entry.getCodTributo());
				String msg = Utils.getInstance(this.getLanguage()).getMessageWithParamsFromResourceBundle(this.nomeServizio + ".oggettoEsistente", entry.getCodTributo());
				throw new DuplicatedEntryException(msg);
			}catch(NotFoundException e){}

			tributiBD.insertTributo(entry); 

			this.log.info("Esecuzione " + methodName + " completata.");

			return this.getDettaglio(entry.getId(), uriInfo, bd);
		}catch(DuplicatedEntryException e){
			throw e;
		}catch(ValidationException e){
			throw e;
		}catch(WebApplicationException e){
			throw e;
		}catch(Exception e){
			throw new ConsoleException(e);
		}
	}

	@Override
	public Tributo creaEntry(InputStream is, UriInfo uriInfo, BasicBD bd)
			throws WebApplicationException, ConsoleException {
		String methodName = "creaEntry " + this.titoloServizio;
		Tributo entry = null;
		try{
			this.log.info("Esecuzione " + methodName + " in corso...");
			// Operazione consentita solo all'amministratore
			this.darsService.checkOperatoreAdmin(bd);

			JsonConfig jsonConfig = new JsonConfig();

			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			Utils.copy(is, baos);

			baos.flush();
			baos.close();

			JSONObject jsonObject = JSONObject.fromObject( baos.toString() ); 

			String tipoContabilitaId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.id");
			String codContabilitaId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codContabilita.id");
			String codificaTributoInIuvId = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".codificaTributoInIuv.id");

			String tipocontabilitaS = jsonObject.getString(tipoContabilitaId);
			jsonObject.remove(tipoContabilitaId);

			String codContabilitaS =  jsonObject.getString(codContabilitaId);
			jsonObject.remove(codContabilitaId);

			String codificaTributoInIuvS =  jsonObject.getString(codificaTributoInIuvId);
			jsonObject.remove(codificaTributoInIuvId);

			jsonConfig.setRootClass(Tributo.class);
			entry = (Tributo) JSONObject.toBean( jsonObject, jsonConfig );

			TipiTributoBD tributiBD = new TipiTributoBD(bd);
			TipoTributo t = tributiBD.getTipoTributo(entry.getIdTipoTributo());
			entry.setCodTributo(t.getCodTributo());
			entry.setDescrizione(t.getDescrizione());

			// imposto i valori custom solo se sono valorizzati correttamente. 
			if(StringUtils.isNotEmpty(tipocontabilitaS) && !tipocontabilitaS.endsWith("_p")){
				TipoContabilta tipoContabilita =  TipoContabilta.toEnum(tipocontabilitaS);
				entry.setTipoContabilitaCustom(tipoContabilita);
			} 

			if(StringUtils.isNotBlank(codContabilitaS)) {
				entry.setCodContabilitaCustom(codContabilitaS);
			}

			if(StringUtils.isNotBlank(codificaTributoInIuvS)) {
				entry.setCodTributoIuvCustom(codificaTributoInIuvS);
			} 

			this.log.info("Esecuzione " + methodName + " completata.");
			return entry;
		}catch(WebApplicationException e){
			throw e;
		}catch(Exception e){
			throw new ConsoleException(e);
		}
	}

	@Override
	public void checkEntry(Tributo entry, Tributo oldEntry) throws ValidationException {
		if(entry == null || entry.getIdTipoTributo() == 0 ) {
			throw new ValidationException(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".creazione.erroreTipoObbligatorio"));
		}
		if(entry == null || entry.getIdDominio() == 0) {
			throw new ValidationException(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".creazione.erroreDominioObbligatorio"));
		}
		if(!entry.getCodTributo().equals(it.govpay.model.Tributo.BOLLOT) && entry.getIdIbanAccredito() == null ) {
			throw new ValidationException(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".creazione.erroreIbanAccreditoObbligatorio"));
		}
		//		if(entry == null || entry.getTipoContabilita() == null) throw new ValidationException(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".creazione.erroreTipoContabilitaObbligatorio"));
		//		if(entry == null || entry.getCodContabilita() == null || entry.getCodContabilita().isEmpty()) throw new ValidationException(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".creazione.erroreCodContabilitaObbligatorio"));
		if(entry.getCodContabilitaCustom() != null && StringUtils.contains(entry.getCodContabilitaCustom()," ")) {
			throw new ValidationException(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".creazione.erroreCodContabilitaNoSpazi"));
		}

		if(oldEntry != null) {
			if(entry.getIdTipoTributo() != oldEntry.getIdTipoTributo()) {
				throw new ValidationException(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".aggiornamento.erroreTipoModificato"));
			}
			if(entry.getIdDominio() != oldEntry.getIdDominio()) {
				throw new ValidationException(Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".aggiornamento.erroreDominioModificato"));
			}
		}
	}

	@Override
	public Dettaglio update(InputStream is, UriInfo uriInfo, BasicBD bd) throws WebApplicationException, ConsoleException, ValidationException {
		String methodName = "Update " + this.titoloServizio;

		try{
			this.log.info("Esecuzione " + methodName + " in corso...");
			// Operazione consentita solo all'amministratore
			this.darsService.checkOperatoreAdmin(bd);

			Tributo entry = this.creaEntry(is, uriInfo, bd);

			TributiBD tributiBD = new TributiBD(bd);
			Tributo oldEntry = tributiBD.getTributo(entry.getIdDominio(),entry.getCodTributo());

			this.checkEntry(entry, oldEntry);

			tributiBD.updateTributo(entry); 

			this.log.info("Esecuzione " + methodName + " completata.");
			return this.getDettaglio(entry.getId(), uriInfo, bd);
		}catch(ValidationException e){
			throw e;
		}catch(WebApplicationException e){
			throw e;
		}catch(Exception e){
			throw new ConsoleException(e);
		}
	}

	@Override
	public void delete(List<Long> idsToDelete, UriInfo uriInfo, BasicBD bd) throws ConsoleException {
		// operazione non prevista
	}

	@Override
	public String getTitolo(Tributo entry, BasicBD bd) {
		StringBuilder sb = new StringBuilder();
		sb.append(Utils.getInstance(this.getLanguage()).getMessageWithParamsFromResourceBundle(this.nomeServizio + ".label.titolo", entry.getDescrizione()));
		return sb.toString();
	}

	@Override
	public String getSottotitolo(Tributo entry, BasicBD bd) throws ConsoleException {
		StringBuilder sb = new StringBuilder();

		TipoContabilta tipoContabilita = entry.getTipoContabilitaDefault() != null ? entry.getTipoContabilitaDefault() : TipoContabilta.CAPITOLO;
		String tipoContabilitaValue = null;
		switch (tipoContabilita) {
		case ALTRO:
			tipoContabilitaValue = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.altro");
			break;
		case SPECIALE:
			tipoContabilitaValue = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.speciale");
			break;
		case SIOPE:
			tipoContabilitaValue = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.siope");
			break;
		case CAPITOLO:
		default:
			tipoContabilitaValue = Utils.getInstance(this.getLanguage()).getMessageFromResourceBundle(this.nomeServizio + ".tipoContabilita.capitolo");				
			break;
		}

		String codContabilitaValue = StringUtils.isNotEmpty(entry.getCodContabilitaDefault()) ? entry.getCodContabilitaDefault() : "--";

		sb.append(Utils.getInstance(this.getLanguage()).getMessageWithParamsFromResourceBundle(this.nomeServizio + ".label.sottotitolo",entry.getCodTributo(), tipoContabilitaValue,codContabilitaValue,Utils.getAbilitatoAsLabel(entry.isAbilitato())));

		return sb.toString();
	}

	@Override
	public List<String> getValori(Tributo entry, BasicBD bd) throws ConsoleException {
		return null;
	}
	
	@Override
	public Map<String, Voce<String>> getVoci(Tributo entry, BasicBD bd) throws ConsoleException { return null; }

	@Override
	public String esporta(List<Long> idsToExport, UriInfo uriInfo, BasicBD bd, ZipOutputStream zout)
			throws WebApplicationException, ConsoleException {
		return null;
	}

	@Override
	public String esporta(Long idToExport, UriInfo uriInfo, BasicBD bd, ZipOutputStream zout)	throws WebApplicationException, ConsoleException {
		return null;
	}

	@Override
	public Object uplaod(MultipartFormDataInput input, UriInfo uriInfo, BasicBD bd)	throws WebApplicationException, ConsoleException, ValidationException { return null;}
}
