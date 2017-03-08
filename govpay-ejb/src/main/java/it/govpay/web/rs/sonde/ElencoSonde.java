/**
 * 
 */
package it.govpay.web.rs.sonde;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Bussu Giovanni (bussu@link.it)
 * @author  $Author: bussu $
 * @version $ Rev: 12563 $, $Date: 07/mar/2017 $
 * 
 */
public class ElencoSonde {

	private List<SommarioSonda> items;

	public List<SommarioSonda> getItems() {
		if(this.items == null)
			this.items = new ArrayList<SommarioSonda>();
		return items;
	}
}
