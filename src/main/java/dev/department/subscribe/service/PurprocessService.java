package dev.department.subscribe.service;

import java.util.*;

import dev.department.subscribe.dto.*;

public interface PurprocessService {

	List<CartListDTO> selectCartList(CartListDTO cartlistDTO) throws Exception;

	void updatedecQty(CartListDTO cartlistDTO) throws Exception;

	void updatePrice(CartListDTO cartlistDTO) throws Exception;

	void updateincQty(CartListDTO cartlistDTO) throws Exception;

	void deleteCartPro(CartListDTO cartlistDTO) throws Exception;

	CartListDTO selectCartTotal(CartListDTO cartlistDTO) throws Exception;

	List<MemberDTO> checkoutUserInfo(MemberDTO memberDTO) throws Exception;

	CartListDTO checkoutTotalInfo(CartListDTO cartlistDTO) throws Exception;

}
