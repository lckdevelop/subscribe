package dev.department.subscribe.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import dev.department.subscribe.dao.*;
import dev.department.subscribe.dto.*;
import lombok.extern.slf4j.*;

@Slf4j
@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public List<CouponDTO> getCouponList(MemberDTO memberDTO) throws Exception {
		try {
			return mypageDAO.getCouponList(memberDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<CartListDTO> getLikeList(MemberDTO memberDTO) throws Exception {
		try {
			return mypageDAO.getLikeList(memberDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void insertReservation(ReservationDTO reservation) throws Exception {
		try {
			mypageDAO.insertReservation(reservation);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public MypagecardDTO getCouponcnt(MemberDTO memberDTO) throws Exception {
		try {
			return mypageDAO.getCouponcnt(memberDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public MypagecardDTO getPointcnt(MemberDTO memberDTO) throws Exception {
		try {
			return mypageDAO.getPointcnt(memberDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public MypagecardDTO getProductcnt(MemberDTO memberDTO) throws Exception {
		try {
			return mypageDAO.getProductcnt(memberDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<CartListDTO> getOrderedList(MemberDTO memberDTO) throws Exception {
		try {
			return mypageDAO.getOrderedList(memberDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<PointDTO> getPointlist(MemberDTO memberDTO) throws Exception {
		try {
			return mypageDAO.getPointlist(memberDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
}
