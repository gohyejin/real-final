package com.example.mapper;

import java.util.List;

import com.example.domain.Costume_CartVO;
import com.example.domain.Package_CartVO;

public interface CartMapper {
	public List<Package_CartVO> plist(String package_cart_id);
	public List<Costume_CartVO> clist(String costume_cart_id);
	public void pdelete(int package_cart_no);
	public void cdelete(int costume_cart_no);
	public void pUpdate(Package_CartVO package_cartVO);
	public void cUpdate(Costume_CartVO costume_cartVO);
	public int psum(String package_cart_id);
	public int csum(String costume_cart_id);
}