package dev.department.subscribe.dao;

import java.util.*;

import dev.department.subscribe.dto.*;

public interface MypageDAO {

	List<CouponDTO> getCouponList(MemberDTO memberDTO) throws Exception;

	List<CartListDTO> getLikeList(MemberDTO memberDTO) throws Exception;

	void insertReservation(ReservationDTO reservation) throws Exception;

	MypagecardDTO getCouponcnt(MemberDTO memberDTO) throws Exception;

	MypagecardDTO getPointcnt(MemberDTO memberDTO) throws Exception;

	MypagecardDTO getProductcnt(MemberDTO memberDTO) throws Exception;

	List<CartListDTO> getOrderedList(MemberDTO memberDTO) throws Exception;

	List<PointDTO> getPointlist(MemberDTO memberDTO) throws Exception;

}
