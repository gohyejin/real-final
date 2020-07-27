package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OrdersVO {
   private int orders_no;
   private String orders_id;
   private String orders_package_code;
   private String orders_costume_code;
   private int orders_quantity;
   private int orders_price;
   
   @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss",timezone ="Asia/Seoul")
   private Date orders_day;
   private int orders_paytype;
   
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
   public int getOrders_quantity() {
      return orders_quantity;
   }
   public void setOrders_quantity(int orders_quantity) {
      this.orders_quantity = orders_quantity;
   }
   public int getOrders_price() {
      return orders_price;
   }
   public void setOrders_price(int orders_price) {
      this.orders_price = orders_price;
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
            + orders_package_code + ", orders_costume_code=" + orders_costume_code + ", orders_quantity="
            + orders_quantity + ", orders_price=" + orders_price + ", orders_day=" + orders_day
            + ", orders_paytype=" + orders_paytype + "]";
   }
} // class