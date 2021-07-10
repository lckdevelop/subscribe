package dev.department.subscribe.service;

import java.util.*;

import dev.department.subscribe.dto.*;

public interface MypageService {

	List<CouponDTO> getCouponList(MemberDTO memberDTO) throws Exception;

	List<CartListDTO> getLikeList(MemberDTO memberDTO) throws Exception;

	void insertReservation(ReservationDTO reservation) throws Exception;

}
