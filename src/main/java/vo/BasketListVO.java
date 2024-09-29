package vo;

import java.util.List;

public class BasketListVO {
	private List<BasketVO> bs_list;

	private int total_price, delivery_price;


	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getDelivery_price() {
		return delivery_price;
	}

	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
	}


}
