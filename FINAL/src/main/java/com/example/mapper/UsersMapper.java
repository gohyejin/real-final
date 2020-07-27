package com.example.mapper;

import com.example.domain.UsersVO;

public interface UsersMapper {
	public void insert(UsersVO vo);
	public int readcnt(String users_id);
	public UsersVO read(String users_id);
}
