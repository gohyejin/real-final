package com.example.mapper;

import java.util.Date;
import java.util.List;

import com.example.domain.ReservationVO;

public interface ReservationMapper {
   
   public List<ReservationVO> list();
   public List<ReservationVO> privatelist(String users_id);
   public void redelete(int reservation_reno);
   public void reinsert(ReservationVO vo);
   public ReservationVO read(Date reservation_redate);
}