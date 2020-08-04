package com.example.mapper;

import org.apache.ibatis.annotations.Param;

import com.example.domain.UsersVO;

public interface UsersMapper {
	public void insert(UsersVO vo);
	public int readcnt(String users_id);
	public UsersVO read(String users_id);
	public void update(UsersVO vo);
	public void pointUpdate(@Param("users_id") String orders_id, @Param("point") int point);
}
