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
package it.govpay.core.business;

import it.govpay.bd.BasicBD;
import it.govpay.bd.anagrafica.AnagraficaManager;
import it.govpay.bd.model.Notifica;
import it.govpay.bd.pagamento.NotificheBD;
import it.govpay.core.utils.GovpayConfig;
import it.govpay.core.utils.GpContext;
import it.govpay.core.utils.GpThreadLocal;
import it.govpay.core.utils.thread.InviaNotificaThread;
import it.govpay.core.utils.thread.ThreadExecutorManager;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.ThreadContext;
import org.openspcoop2.generic_project.exception.ServiceException;
import org.openspcoop2.utils.logger.beans.proxy.Operation;
import org.openspcoop2.utils.logger.beans.proxy.Service;
import org.openspcoop2.utils.sonde.Sonda;
import org.openspcoop2.utils.sonde.SondaException;
import org.openspcoop2.utils.sonde.SondaFactory;
import org.openspcoop2.utils.sonde.impl.SondaBatch;

public class Operazioni{

	private static Logger log = LogManager.getLogger();

	public static String acquisizioneRendicontazioni(String serviceName){

		BasicBD bd = null;
		GpContext ctx = null;
		try {
			ctx = new GpContext();
			ThreadContext.put("cmd", "AcquisizioneRendicontazioni");
			ThreadContext.put("op", ctx.getTransactionId());
			Service service = new Service();
			service.setName(serviceName);
			service.setType(GpContext.TIPO_SERVIZIO_GOVPAY_OPT);
			ctx.getTransaction().setService(service);
			Operation opt = new Operation();
			opt.setName("AcquisizioneRendicontazioni");
			ctx.getTransaction().setOperation(opt);
			GpThreadLocal.set(ctx);
			bd = BasicBD.newInstance(GpThreadLocal.get().getTransactionId());
			String response = new Rendicontazioni(bd).downloadRendicontazioni(false);
			aggiornaSondaOK("update-rnd", bd);
			return response;
		} catch (Exception e) {
			log.error("Acquisizione rendicontazioni fallita", e);
			try {aggiornaSondaKO("update-rnd", e.getMessage(), bd);} catch(Exception ex) {log.error("Errore durante l'aggiornamento della sonda", ex);}
			return "Acquisizione fallita#" + e;
		} finally {
			if(bd != null) bd.closeConnection();
			if(ctx != null) ctx.log();
		}
	}

	private static void aggiornaSondaOK(String nome, BasicBD bd) throws SondaException, ServiceException {
		BasicBD bd1 = null;
		try {
			bd1 = BasicBD.newInstance(bd.getIdTransaction());
			Connection con = bd1.getConnection();

			Sonda sonda = SondaFactory.get(nome, con, bd.getJdbcProperties().getDatabase());
			if(sonda == null) throw new SondaException("Sonda ["+nome+"] non trovata");
			((SondaBatch)sonda).aggiornaStatoSonda(true, new Date(), null, con, bd.getJdbcProperties().getDatabase());
		} finally {
			if(bd1 != null) bd1.closeConnection();
		}
	}

	private static void aggiornaSondaKO(String nome, String descrizioneErrore, BasicBD bd) throws SondaException, ServiceException {
		BasicBD bd1 = null;
		try {
			bd1 = BasicBD.newInstance(bd.getIdTransaction());
			Connection con = bd1.getConnection();

			Sonda sonda = SondaFactory.get(nome, con, bd.getJdbcProperties().getDatabase());
			if(sonda == null) throw new SondaException("Sonda ["+nome+"] non trovata");
			((SondaBatch)sonda).aggiornaStatoSonda(false, new Date(), descrizioneErrore, con, bd.getJdbcProperties().getDatabase());
		} finally {
			if(bd1 != null) bd1.closeConnection();
		}
	}

	public static String aggiornamentoRegistroPsp(String serviceName){
		BasicBD bd = null;
		GpContext ctx = null;
		try {
			ctx = new GpContext();
			ThreadContext.put("cmd", "AggiornamentoRegistroPsp");
			ThreadContext.put("op", ctx.getTransactionId());
			Service service = new Service();
			service.setName(serviceName);
			service.setType(GpContext.TIPO_SERVIZIO_GOVPAY_OPT);
			ctx.getTransaction().setService(service);
			Operation opt = new Operation();
			opt.setName("AggiornamentoRegistroPsp");
			ctx.getTransaction().setOperation(opt);
			GpThreadLocal.set(ctx);
			bd = BasicBD.newInstance(GpThreadLocal.get().getTransactionId());
			String response = new Psp(bd).aggiornaRegistro();

			aggiornaSondaOK("update-psp", bd);
			return response;
		} catch (Exception e) {
			log.error("Aggiornamento della lista dei PSP fallito", e);
			try {aggiornaSondaKO("update-psp", e.getMessage(), bd);} catch(Exception ex) {log.error("Errore durante l'aggiornamento della sonda", ex);}
			return "Acquisizione fallita#" + e;
		} finally {
			if(bd != null) bd.closeConnection();
			if(ctx != null) ctx.log();
		}
	}

	public static String recuperoRptPendenti(String serviceName){
		BasicBD bd = null;
		GpContext ctx = null;
		try {
			ctx = new GpContext();
			ThreadContext.put("cmd", "RecuperoRptPendenti");
			ThreadContext.put("op", ctx.getTransactionId());
			Service service = new Service();
			service.setName(serviceName);
			service.setType(GpContext.TIPO_SERVIZIO_GOVPAY_OPT);
			ctx.getTransaction().setService(service);
			Operation opt = new Operation();
			opt.setName("RecuperoRptPendenti");
			ctx.getTransaction().setOperation(opt);
			GpThreadLocal.set(ctx);
			bd = BasicBD.newInstance(GpThreadLocal.get().getTransactionId());
			String verificaTransazioniPendenti = new Pagamento(bd).verificaTransazioniPendenti();
			aggiornaSondaOK("update-pnd", bd);
			return verificaTransazioniPendenti;
		} catch (Exception e) {
			log.error("Acquisizione Rpt pendenti fallita", e);
			try {aggiornaSondaKO("update-pnd", e.getMessage(), bd);} catch(Exception ex) {log.error("Errore durante l'aggiornamento della sonda", ex);}
			return "Acquisizione fallita#" + e;
		} finally {
			if(bd != null) bd.closeConnection();
			if(ctx != null) ctx.log();
		}
	}

	public static String spedizioneNotifiche(String serviceName){
		BasicBD bd = null;
		List<InviaNotificaThread> threads = new ArrayList<InviaNotificaThread>();
		GpContext ctx = null;
		try {
			ctx = new GpContext();
			ThreadContext.put("cmd", "SpedizioneNotifiche");
			ThreadContext.put("op", ctx.getTransactionId());
			Service service = new Service();
			service.setName(serviceName);
			service.setType(GpContext.TIPO_SERVIZIO_GOVPAY_OPT);
			ctx.getTransaction().setService(service);
			Operation opt = new Operation();
			opt.setName("SpedizioneNotifiche");
			ctx.getTransaction().setOperation(opt);
			GpThreadLocal.set(ctx);
			bd = BasicBD.newInstance(GpThreadLocal.get().getTransactionId());
			log.trace("Spedizione notifiche non consegnate");

			NotificheBD notificheBD = new NotificheBD(bd);

			List<Notifica> notifiche  = notificheBD.findNotificheDaSpedire();

			if(notifiche.size() == 0) return "Nessuna notifica da inviare.";

			log.info("Trovate ["+notifiche.size()+"] notifiche da spedire");

			for(Notifica notifica: notifiche) {
				InviaNotificaThread sender = new InviaNotificaThread(notifica, bd);
				ThreadExecutorManager.getClientPoolExecutor().execute(sender);
			}

			log.info("Processi di spedizione avviati.");

			aggiornaSondaOK("update-ntfy", bd);
		} catch (Exception e) {
			log.error("Non è stato possibile avviare la spedizione delle notifiche", e);
			try {aggiornaSondaKO("update-ntfy", e.getMessage(), bd);} catch(Exception ex) {log.error("Errore durante l'aggiornamento della sonda", ex);}
			return "Non è stato possibile avviare la spedizione delle notifiche: " + e;
		} finally {
			if(bd != null) bd.closeConnection();
		}

		// Aspetto che abbiano finito tutti
		while(true){
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {

			}
			boolean completed = true;
			for(InviaNotificaThread sender : threads) {
				if(!sender.isCompleted()) 
					completed = false;
			}

			if(completed) {
				return "Spedizione notifiche completata.";
			}
		}
	}

	public static String resetCacheAnagrafica(){
		ThreadContext.put("cmd", "ResetCacheAnagrafica");
		ThreadContext.put("op", UUID.randomUUID().toString() );
		try {
			AnagraficaManager.cleanCache();
			return "Reset Cache Anagrafica#eseguita con successo.";
		} catch (Exception e) {
			log.error("Reset cache anagrafica fallita", e);
			return "Reset Cache Anagrafica#fallita.";
		} 
	}

	public static String estrattoConto(String serviceName){
		if(!GovpayConfig.getInstance().isBatchEstrattoConto())
			return "Servizio estratto conto non configurato";

		BasicBD bd = null;
		GpContext ctx = null;
		try {
			ctx = new GpContext();
			ThreadContext.put("cmd", "EstrattoConto");
			ThreadContext.put("op", ctx.getTransactionId());
			Service service = new Service();
			service.setName(serviceName);
			service.setType(GpContext.TIPO_SERVIZIO_GOVPAY_OPT);
			ctx.getTransaction().setService(service);
			Operation opt = new Operation();
			opt.setName("EstrattoConto");
			ctx.getTransaction().setOperation(opt);
			GpThreadLocal.set(ctx);
			bd = BasicBD.newInstance(GpThreadLocal.get().getTransactionId());
			String creaEstrattiContoSuFileSystem = new EstrattoConto(bd).creaEstrattiContoSuFileSystem();
			aggiornaSondaOK("update-conto", bd);
			return creaEstrattiContoSuFileSystem;
		} catch (Exception e) {
			log.error("Estratto Conto fallito", e);
			try {aggiornaSondaKO("update-conto", e.getMessage(), bd);} catch(Exception ex) {log.error("Errore durante l'aggiornamento della sonda", ex);}
			return "Estratto Conto#" + e.getMessage();
		} finally {
			if(bd != null) bd.closeConnection();
			if(ctx != null) ctx.log();
		}
	}
}