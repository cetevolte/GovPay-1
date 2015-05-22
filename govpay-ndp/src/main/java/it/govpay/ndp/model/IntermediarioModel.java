/*
 * GovPay - Porta di Accesso al Nodo dei Pagamenti SPC 
 * http://www.gov4j.it/govpay
 * 
 * Copyright (c) 2014-2015 Link.it srl (http://www.link.it).
 * Copyright (c) 2014-2015 TAS S.p.A. (http://www.tasgroup.it).
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
package it.govpay.ndp.model;

import it.govpay.ejb.model.ConnettorePddModel;

public class IntermediarioModel {
	
	private String nomeSoggettoSPC;
	private String idIntermediarioPA;
	private ConnettorePddModel connettoreServizioRPT;
	
	public String getIdIntermediarioPA() {
		return idIntermediarioPA;
	}
	
	public void setIdIntermediarioPA(String idIntermediarioPA) {
		this.idIntermediarioPA = idIntermediarioPA;
	}
	
	public String getNomeSoggettoSPC() {
		return nomeSoggettoSPC;
	}
	
	public void setNomeSoggettoSPC(String nomeSoggettoSPC) {
		this.nomeSoggettoSPC = nomeSoggettoSPC;
	}
	
	public ConnettorePddModel getConnettoreServizioRPT() {
		return connettoreServizioRPT;
	}
	
	public void setConnettoreServizioRPT(ConnettorePddModel servizioRPT) {
		this.connettoreServizioRPT = servizioRPT;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof IntermediarioModel) {
			return (this.idIntermediarioPA.equals(((IntermediarioModel) obj).getIdIntermediarioPA()));
		}
		return false;
	}
}
