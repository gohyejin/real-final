package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Costume_CartVO;
import com.example.domain.Package_CartVO;
import com.example.mapper.CartMapper;

@Controller
public class CartController {
	@Autowired
	CartMapper mapper;
	
	@RequestMapping("/cart/totsum")
	@ResponseBody
	public int totsum(@RequestParam("psum") int psum, @RequestParam("csum") int csum){
		int totsum=psum+csum;
		return totsum;
	}
	
	@RequestMapping("/cart/plist")
	@ResponseBody
	public HashMap<String, Object> plist(String package_cart_id){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("plist", mapper.plist(package_cart_id));
		map.put("psum", mapper.psum(package_cart_id));
		return map;
	}
	
	@RequestMapping("/cart/clist")
	@ResponseBody
	public HashMap<String, Object> clist(String costume_cart_id){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("clist", mapper.clist(costume_cart_id));
		map.put("csum", mapper.csum(costume_cart_id));
		return map;
	}
	
	@RequestMapping("/cart/pdelete")
	@ResponseBody
	public void pdelete(int package_cart_no){
		mapper.pdelete(package_cart_no);
	}
	
	@RequestMapping("/cart/cdelete")
	@ResponseBody
	public void cdelete(int costume_cart_no){
		mapper.cdelete(costume_cart_no);
	}
	
	@RequestMapping("/cart/pupdate")
	@ResponseBody
	public void pupdate(Package_CartVO package_cartVO){
		mapper.pUpdate(package_cartVO);
	}
	
	@RequestMapping("/cart/cupdate")
	@ResponseBody
	public void cupdate(Costume_CartVO costume_cartVO){
		mapper.cUpdate(costume_cartVO);
	}
}