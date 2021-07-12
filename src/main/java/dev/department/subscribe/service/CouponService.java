package dev.department.subscribe.service;

import org.springframework.stereotype.Service;

import dev.department.subscribe.dto.CouponDTO;

public interface CouponService {

	void insertCoupon(CouponDTO couponDTO, int brandNo) throws Exception;

}
