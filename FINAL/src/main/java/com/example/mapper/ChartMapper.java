package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import com.example.domain.ChartReadVO;
import com.example.domain.ChartsVO;
import com.example.domain.Criteria;

public interface ChartMapper {
	
	public List<HashMap<String, Object>> packageOrdersList(Criteria cri);
	public int packageorderCount(Criteria cri);
	public List<HashMap<String, Object>> costumeOrdersList(Criteria cri);
	public int costumeorderCount(Criteria cri);
	public List<ChartsVO> packagechart(int month);
	public List<ChartsVO> packagechart2(int month);
	public List<ChartsVO> costumechart(int month);
	public List<ChartsVO> costumechart2(int month);
	public ChartReadVO orderread(int orders_no);
}
