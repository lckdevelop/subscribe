package dev.department.subscribe.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.CouponDAO;
import dev.department.subscribe.dao.MailDAO;
import dev.department.subscribe.dto.CouponDTO;
import dev.department.subscribe.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	CouponDAO couponDAO;

	@Autowired
	MailDAO mailDAO;

	@Override
	public void insertCoupon(CouponDTO couponDTO, int brandNo) throws Exception {
		List<MemberDTO> receivers = mailDAO.getReceiverInfo(brandNo);
		couponDTO.setBrandNo(brandNo);
		receivers.stream().forEach(receiver -> {
			couponDTO.setMemberNo(receiver.getNo());
			
			try {
				couponDAO.insertCoupon(couponDTO);
			} catch (SQLException e) {
				log.warn(e.getMessage());
				throw new RuntimeException("쿠폰 발급 에러");
			}
		});

	}

}
