package com.example.mapper;

import java.util.List;

import com.example.domain.OrdersVO;

public interface OrdersMapper {
   public List<OrdersVO> list(String orders_id);
   public int point(String users_id);
   public void packageInsert(OrdersVO ordersVO);
   public void costumeInsert(OrdersVO ordersVO);
}