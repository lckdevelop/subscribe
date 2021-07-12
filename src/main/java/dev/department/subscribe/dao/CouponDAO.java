package dev.department.subscribe.dao;

import java.sql.SQLException;

import dev.department.subscribe.dto.CouponDTO;

public interface CouponDAO {

	void insertCoupon(CouponDTO couponDTO) throws SQLException;

}
