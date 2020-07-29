package com.example.domain;

public class Costume_CartVO {
	private int costume_cart_no;
	private String costume_cart_id;
	private String costume_cart_costume_code;
	private int costume_cart_quantity;
	private int costume_cart_price;
	
	public int getCostume_cart_no() {
		return costume_cart_no;
	}
	public void setCostume_cart_no(int costume_cart_no) {
		this.costume_cart_no = costume_cart_no;
	}
	public String getCostume_cart_id() {
		return costume_cart_id;
	}
	public void setCostume_cart_id(String costume_cart_id) {
		this.costume_cart_id = costume_cart_id;
	}
	public String getCostume_cart_costume_code() {
		return costume_cart_costume_code;
	}
	public void setCostume_cart_costume_code(String costume_cart_costume_code) {
		this.costume_cart_costume_code = costume_cart_costume_code;
	}
	public int getCostume_cart_quantity() {
		return costume_cart_quantity;
	}
	public void setCostume_cart_quantity(int costume_cart_quantity) {
		this.costume_cart_quantity = costume_cart_quantity;
	}
	public int getCostume_cart_price() {
		return costume_cart_price;
	}
	public void setCostume_cart_price(int costume_cart_price) {
		this.costume_cart_price = costume_cart_price;
	}
	
	@Override
	public String toString() {
		return "Costume_CartVO [costume_cart_no=" + costume_cart_no + ", costume_cart_id=" + costume_cart_id
				+ ", costume_cart_costume_code=" + costume_cart_costume_code + ", costume_cart_quantity="
				+ costume_cart_quantity + ", costume_cart_price=" + costume_cart_price + "]";
	}
} // class