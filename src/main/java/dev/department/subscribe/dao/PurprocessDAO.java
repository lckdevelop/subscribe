package dev.department.subscribe.dao;

import java.util.*;

import dev.department.subscribe.dto.*;

public interface PurprocessDAO {

	List<CartListDTO> selectCartList(CartListDTO cartlistDTO) throws Exception;

	void updatedecQty(CartListDTO cartlistDTO) throws Exception;

	void updatePrice(CartListDTO cartlistDTO) throws Exception;
	
	void updateDCPrice(CartListDTO cartlistDTO) throws Exception;

	void updateincQty(CartListDTO cartlistDTO) throws Exception;

	void deleteCartPro(CartListDTO cartlistDTO) throws Exception;

	CartListDTO selectCartTotal(CartListDTO cartlistDTO) throws Exception;

	List<MemberDTO> checkoutUserInfo(MemberDTO memberDTO) throws Exception;

	CartListDTO checkoutTotalInfo(CartListDTO cartlistDTO) throws Exception;

	List<CouponDTO> getCouponList(CouponDTO couponDTO) throws Exception;

	CouponDTO getCouponCard(CouponDTO couponDTO) throws Exception;

	CartListDTO selectDcproduct(CartListDTO cartlistDTO) throws Exception;

	CartListDTO selectDcproductPrice(CartListDTO dcproduct) throws Exception;

	void applyDiscount(CartListDTO cartlistDTO) throws Exception;

	PointDTO getPointAmount(CouponDTO couponDTO) throws Exception;

}
