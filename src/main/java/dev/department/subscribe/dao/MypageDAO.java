package dev.department.subscribe.dao;

import java.util.*;

import dev.department.subscribe.dto.*;

public interface MypageDAO {

	List<CouponDTO> getCouponList(MemberDTO memberDTO) throws Exception;

	List<CartListDTO> getLikeList(MemberDTO memberDTO) throws Exception;

}
