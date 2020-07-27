package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.OrdersMapper;

@Controller
public class OrdersController {
   @Autowired
   OrdersMapper mapper;
   
   @RequestMapping("/order/list")
   @ResponseBody
   public HashMap<String,Object> list(String orders_id){
      HashMap<String, Object> map=new HashMap<String, Object>();
      map.put("list", mapper.list(orders_id));
      return map;
   }
   
   @RequestMapping("/user/point")
   @ResponseBody
   public int point(String users_id){
      int point=mapper.point(users_id);
      return point;
   }
}