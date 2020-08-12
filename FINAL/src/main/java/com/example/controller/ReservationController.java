package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.ReservationVO;
import com.example.mapper.ReservationMapper;

@Controller
public class ReservationController {
   
   @Autowired
   ReservationMapper mapper;
   
   @RequestMapping("/reservation/calendar")
   public void calmain() {
	   
   }
   
   @RequestMapping("/reservation/admincalendar")
   public void admincalmain() {

   }
   
   
   
   @RequestMapping("/reservationlist")
   @ResponseBody
   public HashMap<String , Object> reservationlist() {
      HashMap<String , Object> map=new HashMap<String , Object>();
      
      map.put("list", mapper.list());
      return map;
   }
   
   @RequestMapping("/ReservationPrivateList")
   @ResponseBody
   public HashMap<String , Object> ReservationPrivateList(String users_id) {
      HashMap<String , Object> map=new HashMap<String , Object>();
      map.put("plist", mapper.privatelist(users_id));
      return map;
   }
   
   
   
   @RequestMapping(value="/redelete", method=RequestMethod.POST)
   @ResponseBody
   public void redelete(int reservation_reno) {
      mapper.redelete(reservation_reno);
   }
   
   @RequestMapping(value="/reinsert", method=RequestMethod.POST)
   @ResponseBody
   public int reinsert(ReservationVO vo) {
      int b=0;
      ReservationVO a=mapper.read(vo.getReservation_redate());
      if(a==null){
      mapper.reinsert(vo);
      b=1;
      } else {
         b=2;
      }
      return b;
   }
   
}