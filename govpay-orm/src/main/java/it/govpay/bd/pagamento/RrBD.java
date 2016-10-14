/*
 * GovPay - Porta di Accesso al Nodo dei Pagamenti SPC 
 * http://www.gov4j.it/govpay
 * 
 * Copyright (c) 2014-2016 Link.it srl (http://www.link.it).
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
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
package it.govpay.bd.pagamento;

import java.util.ArrayList;
import java.util.List;

import org.openspcoop2.generic_project.beans.UpdateField;
import org.openspcoop2.generic_project.exception.ExpressionException;
import org.openspcoop2.generic_project.exception.ExpressionNotImplementedException;
import org.openspcoop2.generic_project.exception.MultipleResultException;
import org.openspcoop2.generic_project.exception.NotFoundException;
import org.openspcoop2.generic_project.exception.NotImplementedException;
import org.openspcoop2.generic_project.exception.ServiceException;
import org.openspcoop2.generic_project.expression.IPaginatedExpression;

import it.govpay.bd.BasicBD;
import it.govpay.bd.model.converter.RrConverter;
import it.govpay.bd.pagamento.filters.RrFilter;
import it.govpay.bd.model.Rr;
import it.govpay.orm.IdRr;
import it.govpay.orm.RR;
import it.govpay.orm.dao.jdbc.JDBCRRServiceSearch;

public class RrBD extends BasicBD {

	public RrBD(BasicBD basicBD) {
		super(basicBD);
	}

	/**
	 * Recupera l'RR identificato dalla chiave fisica
	 * 
	 * @param idRr
	 * @return
	 * @throws NotFoundException
	 * @throws MultipleResultException
	 * @throws ServiceException
	 */
	public Rr getRr(long idRr) throws ServiceException {
		try {
			RR rptVO = ((JDBCRRServiceSearch)this.getRrService()).get(idRr);
			return RrConverter.toDTO(rptVO);
		} catch (NotImplementedException e) {
			throw new ServiceException(e);
		} catch (MultipleResultException e) {
			throw new ServiceException(e);
		} catch (NotFoundException e) {
			throw new ServiceException(e);
		}
	}

	/**
	 * Recupera l'RR identificato dal msg id
	 * 
	 * @param codMsgRevoca
	 * @return
	 * @throws NotFoundException
	 * @throws MultipleResultException
	 * @throws ServiceException
	 */
	public Rr getRr(String codMsgRevoca) throws NotFoundException, ServiceException {
		try {
			IdRr id = new IdRr();
			id.setCodMsgRevoca(codMsgRevoca);
			RR rptVO = this.getRrService().get(id);
			return RrConverter.toDTO(rptVO);
		} catch (NotImplementedException e) {
			throw new ServiceException(e);
		} catch (MultipleResultException e) {
			throw new ServiceException(e);
		}
	}
	
	/**
	 * Inserisce l'RR.
	 * 
	 * @param rr
	 * @param documentoXml
	 * @throws NotFoundException
	 * @throws ServiceException
	 */
	public void insertRr(Rr rr) throws ServiceException {
		try {
			RR rrVo = RrConverter.toVO(rr);
			this.getRrService().create(rrVo);
			rr.setId(rrVo.getId());
		} catch (NotImplementedException e) {
			throw new ServiceException(e);
		}
	}
	
	public void updateRr(long id, Rr.StatoRr stato, String descrizione) throws ServiceException{
		try {
			IdRr idRr = new IdRr();
			idRr.setId(id);
			List<UpdateField> lstUpdateFields = new ArrayList<UpdateField>();
			lstUpdateFields.add(new UpdateField(RR.model().STATO, stato.toString()));
			lstUpdateFields.add(new UpdateField(RR.model().DESCRIZIONE_STATO, descrizione));
			this.getRrService().updateFields(idRr, lstUpdateFields.toArray(new UpdateField[]{}));
		} catch (NotImplementedException e) {
			throw new ServiceException(e);
		} catch (NotFoundException e) {
			throw new ServiceException(e);
		}
	}

	public void updateRr(Long id, Rr rpt) throws ServiceException {
		try {
			it.govpay.orm.RR vo = RrConverter.toVO(rpt);
			IdRr idRr = this.getRrService().convertToId(vo);
			this.getRrService().update(idRr, vo);
		} catch (NotFoundException e) {
			throw new ServiceException(e);
		} catch (NotImplementedException e) {
			throw new ServiceException(e);
		}
	}

	public List<Rr> getRrPendenti(String codDominio) throws ServiceException {
		try {
			IPaginatedExpression exp = this.getRrService().newPaginatedExpression();
			
			exp.equals(RR.model().COD_DOMINIO, codDominio);
			exp.notEquals(RR.model().STATO, Rr.StatoRr.RR_ERRORE_INVIO_A_NODO.toString());
			exp.notEquals(RR.model().STATO, Rr.StatoRr.RR_RIFIUTATA_NODO.toString());
			exp.notEquals(RR.model().STATO, Rr.StatoRr.ER_ACCETTATA_PA.toString());
			
			List<RR> findAll = this.getRrService().findAll(exp);
			return RrConverter.toDTOList(findAll);
		} catch(NotImplementedException e) {
			throw new ServiceException(e);
		} catch (ExpressionNotImplementedException e) {
			throw new ServiceException(e);
		} catch (ExpressionException e) {
			throw new ServiceException(e);
		}
	}

	public RrFilter newFilter() throws ServiceException {
		return new RrFilter(this.getRrService());
	}
	
	public long count(RrFilter filter) throws ServiceException {
		try {
			return this.getRrService().count(filter.toExpression()).longValue();
		} catch (NotImplementedException e) {
			throw new ServiceException(e);
		}
	}

	public List<Rr> findAll(RrFilter filter) throws ServiceException {
		try {
			List<Rr> rrLst = new ArrayList<Rr>();
			List<it.govpay.orm.RR> rrVOLst = this.getRrService().findAll(filter.toPaginatedExpression()); 
			for(it.govpay.orm.RR rrVO: rrVOLst) {
				rrLst.add(RrConverter.toDTO(rrVO));
			}
			return rrLst;
		} catch (NotImplementedException e) {
			throw new ServiceException(e);
		}
	}
}
