package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.ChartsVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.ChartMapper;

@Controller
public class ChartController {
	
	@Autowired
	ChartMapper mapper;
	
	@RequestMapping("/admin/chart")
	public void ordersList(Model model, Criteria cri) {
		
		cri.setPerPageNum(5);
    	PageMaker pm=new PageMaker();
    	pm.setCri(cri);
    	pm.setTotalCount(mapper.orderCount(cri));
    	
    	model.addAttribute("cri", cri);
    	model.addAttribute("pm", pm);
		model.addAttribute("ordersList", mapper.ordersList(cri));
		
		
	}
	/*
	@RequestMapping("/admin/chart2")
	public void ordersList() {
		
	}

	@RequestMapping(value="/chart.json")
	@ResponseBody
	public HashMap<String , Object> ordersListjson(Criteria cri) {
		HashMap<String , Object> map=new HashMap<String , Object>();
		
		cri.setPerPageNum(5);
    	PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.orderCount(cri));
		map.put("pm", pm);
		
		map.put("cri", cri);
    	map.put("ordersList", mapper.ordersListjson(cri));
    	map.put("count", mapper.orderCount(cri));
		
		return map;
	}
	*/
	
	@RequestMapping("/admin/packagechart")
	public void packagechart() {
		
	}
	
	@RequestMapping("/packagechartt")
	@ResponseBody
	public List<ChartsVO> packagechartt(int month){
		ArrayList arrList=new ArrayList();
		ArrayList arr=new ArrayList();
		arr.add("패키지명");
		arr.add("패키지별 매출총합");
		arrList.add(arr);
		List<ChartsVO> list=mapper.packagechart(month);
		for(ChartsVO vo:list) {
			arr=new ArrayList();
			arr.add(vo.getName());
			arr.add(vo.getValue());
			arrList.add(arr);
		}
		return arrList;
	}
	
	@RequestMapping("/packagechartt2")
	@ResponseBody
	public List<ChartsVO> packagechartt2(int month){
		ArrayList arrList=new ArrayList();
		ArrayList arr=new ArrayList();
		arr.add("패키지명");
		arr.add("패키지별 판매수");
		arrList.add(arr);
		List<ChartsVO> list=mapper.packagechart2(month);
		for(ChartsVO vo:list) {
			arr=new ArrayList();
			arr.add(vo.getName());
			arr.add(vo.getValue());
			arrList.add(arr);
		}
		return arrList;
	}
	
	
	@RequestMapping("/admin/costumechart")
	public void costumechart() {
		
	}
	
	@RequestMapping("/costumechartt")
	@ResponseBody
	public List<ChartsVO> costumechartt(int month){
		ArrayList arrList=new ArrayList();
		ArrayList arr=new ArrayList();
		arr.add("코스튬명");
		arr.add("코스튬별 매출총합");
		arrList.add(arr);
		List<ChartsVO> list=mapper.costumechart(month);
		for(ChartsVO vo:list) {
			arr=new ArrayList();
			arr.add(vo.getName());
			arr.add(vo.getValue());
			arrList.add(arr);
		}
		return arrList;
	}
	
	@RequestMapping("/costumechartt2")
	@ResponseBody
	public List<ChartsVO> costumechartt2(int month){
		ArrayList arrList=new ArrayList();
		ArrayList arr=new ArrayList();
		arr.add("코스튬명");
		arr.add("코스튬별 판매수");
		arrList.add(arr);
		List<ChartsVO> list=mapper.costumechart2(month);
		for(ChartsVO vo:list) {
			arr=new ArrayList();
			arr.add(vo.getName());
			arr.add(vo.getValue());
			arrList.add(arr);
		}
		return arrList;
	}
}
