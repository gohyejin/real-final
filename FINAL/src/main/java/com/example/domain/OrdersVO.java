package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OrdersVO {
	private int orders_no;
	private String orders_id;
	private String orders_package_code;
	private String orders_costume_code;

	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss", timezone = "Asia/Seoul")
	private Date orders_day;
	private int orders_paytype;
	private int orders_package_quantity;
	private int orders_costume_quantity;
	private int package_cart_no;
	private int costume_cart_no;

	public int getPackage_cart_no() {
		return package_cart_no;
	}

	public void setPackage_cart_no(int package_cart_no) {
		this.package_cart_no = package_cart_no;
	}

	public int getCostume_cart_no() {
		return costume_cart_no;
	}

	public void setCostume_cart_no(int costume_cart_no) {
		this.costume_cart_no = costume_cart_no;
	}

	public int getOrders_package_quantity() {
		return orders_package_quantity;
	}

	public void setOrders_package_quantity(int orders_package_quantity) {
		this.orders_package_quantity = orders_package_quantity;
	}


	public int getOrders_costume_quantity() {
		return orders_costume_quantity;
	}

	public void setOrders_costume_quantity(int orders_costume_quantity) {
		this.orders_costume_quantity = orders_costume_quantity;
	}

	public int getOrders_no() {
		return orders_no;
	}

	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}

	public String getOrders_id() {
		return orders_id;
	}

	public void setOrders_id(String orders_id) {
		this.orders_id = orders_id;
	}

	public String getOrders_package_code() {
		return orders_package_code;
	}

	public void setOrders_package_code(String orders_package_code) {
		this.orders_package_code = orders_package_code;
	}

	public String getOrders_costume_code() {
		return orders_costume_code;
	}

	public void setOrders_costume_code(String orders_costume_code) {
		this.orders_costume_code = orders_costume_code;
	}

	public Date getOrders_day() {
		return orders_day;
	}

	public void setOrders_day(Date orders_day) {
		this.orders_day = orders_day;
	}

	public int getOrders_paytype() {
		return orders_paytype;
	}

	public void setOrders_paytype(int orders_paytype) {
		this.orders_paytype = orders_paytype;
	}
	
	@Override
	public String toString() {
		return "OrdersVO [orders_no=" + orders_no + ", orders_id=" + orders_id + ", orders_package_code="
				+ orders_package_code + ", orders_costume_code=" + orders_costume_code + ", orders_day=" + orders_day
				+ ", orders_paytype=" + orders_paytype + ", orders_package_quantity=" + orders_package_quantity
				+ ", orders_costume_quantity=" + orders_costume_quantity + ", package_cart_no=" + package_cart_no
				+ ", costume_cart_no=" + costume_cart_no + "]";
	}
} // class