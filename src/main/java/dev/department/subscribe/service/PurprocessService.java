package dev.department.subscribe.service;

import java.util.*;

import dev.department.subscribe.dto.*;

public interface PurprocessService {

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

	CartListDTO applyPoint(PointDTO pointDTO) throws Exception;

	void usePoint(PointDTO pointDTO) throws Exception;

	StoreDTO getStoreInfo(StoreDTO storeDTO) throws Exception;

	void insertInitialCheck(OrderedDTO orderedDTO) throws Exception;

	OrderedDTO getOrderno(OrderedDTO orderedDTO) throws Exception;

	void insertOrderedProduct(OrderedDTO savecheck) throws Exception;

	void updateDelivery(OrderedDTO savecheck) throws Exception;

	void updateDirect(OrderedDTO savecheck) throws Exception;

	void updateDeliveradd(OrderedDTO savecheck) throws Exception;

	void updateDirectStore(OrderedDTO savecheck) throws Exception;

	void updateReserveDate(OrderedDTO savecheck) throws Exception;

	void saveorderedPoint(OrderedDTO savecheck) throws Exception;

	void updatepointPrice(OrderedDTO savecheck) throws Exception;

	void updatestatus(OrderedDTO savecheck) throws Exception;

	void deleteMemberCart(OrderedDTO orderedDTO) throws Exception;

	OrderedDTO selectOrderedList(CartListDTO cartlistDTO) throws Exception;

}
