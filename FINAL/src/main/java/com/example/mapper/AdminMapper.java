package com.example.mapper;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.UsersVO;

public interface AdminMapper {
	
	public List<UsersVO> userList(Criteria cri);
	public void userinfoUpdate(UsersVO vo);
	public UsersVO userRead(String users_id);
	public List<UsersVO> blackList(Criteria cri);
	public void blackUpdate(UsersVO vo);
	public UsersVO blackRead(String users_id);
	public int totalCount(Criteria cri);
	public int totalCountBlack(Criteria cri);
	
}
