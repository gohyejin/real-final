package com.example.mapper;

import java.util.List;

import com.example.domain.Costume_CartVO;
import com.example.domain.Package_CartVO;

public interface CartMapper {
	public List<Package_CartVO> plist(String package_cart_id); // ��Ű�� ���
	public List<Costume_CartVO> clist(String costume_cart_id); // �ǻ�뿩 ���
	public void pdelete(int package_cart_no); // ��Ű�� ����
	public void cdelete(int costume_cart_no); // �ǻ� ����
	public void pUpdate(Package_CartVO package_cartVO); // ��Ű�� ��������
	public void cUpdate(Costume_CartVO costume_cartVO); // �ǻ� ��������
	public int psum(String package_cart_id); // ��Ű�� �Ѿ�
	public int csum(String costume_cart_id); // �ǻ� �Ѿ�
	public void pinsert(Package_CartVO vo); // ��Ű�� ��ٱ��� ���
}