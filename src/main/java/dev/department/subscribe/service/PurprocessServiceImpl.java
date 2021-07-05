package dev.department.subscribe.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import dev.department.subscribe.dao.*;
import dev.department.subscribe.dto.*;
import lombok.extern.slf4j.*;

@Slf4j
@Service
public class PurprocessServiceImpl implements PurprocessService{
	@Autowired
	private PurprocessDAO purprocessDAO;

	@Override
	public List<CartListDTO> selectCartList(CartListDTO cartlistDTO) throws Exception {
		try {
			return purprocessDAO.selectCartList(cartlistDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updatedecQty(CartListDTO cartlistDTO) throws Exception {
		try {
			purprocessDAO.updatedecQty(cartlistDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updatePrice(CartListDTO cartlistDTO) throws Exception {
		try {
			purprocessDAO.updatePrice(cartlistDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateincQty(CartListDTO cartlistDTO) throws Exception {
		try {
			purprocessDAO.updateincQty(cartlistDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void deleteCartPro(CartListDTO cartlistDTO) throws Exception {
		try {
			purprocessDAO.deleteCartPro(cartlistDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public CartListDTO selectCartTotal(CartListDTO cartlistDTO) throws Exception {
		try {
			return purprocessDAO.selectCartTotal(cartlistDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MemberDTO> checkoutUserInfo(MemberDTO memberDTO) throws Exception {
		try {
			return purprocessDAO.checkoutUserInfo(memberDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public CartListDTO checkoutTotalInfo(CartListDTO cartlistDTO) throws Exception {
		try {
			return purprocessDAO.checkoutTotalInfo(cartlistDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
}
