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
	public void updateDCPrice(CartListDTO cartlistDTO) throws Exception {
		try {
			purprocessDAO.updateDCPrice(cartlistDTO);
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

	@Override
	public List<CouponDTO> getCouponList(CouponDTO couponDTO) throws Exception {
		try {
			return purprocessDAO.getCouponList(couponDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public CouponDTO getCouponCard(CouponDTO couponDTO) throws Exception {
		try {
			return purprocessDAO.getCouponCard(couponDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public CartListDTO selectDcproduct(CartListDTO cartlistDTO) throws Exception {
		try {
			return purprocessDAO.selectDcproduct(cartlistDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public CartListDTO selectDcproductPrice(CartListDTO dcproduct) throws Exception {
		try {
			return purprocessDAO.selectDcproductPrice(dcproduct);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void applyDiscount(CartListDTO cartlistDTO) throws Exception {
		try {
			purprocessDAO.applyDiscount(cartlistDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public PointDTO getPointAmount(CouponDTO couponDTO) throws Exception {
		try {
			return purprocessDAO.getPointAmount(couponDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public CartListDTO applyPoint(PointDTO pointDTO) throws Exception {
		try {
			return purprocessDAO.applyPoint(pointDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void usePoint(PointDTO pointDTO) throws Exception {
		try {
			purprocessDAO.usePoint(pointDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public StoreDTO getStoreInfo(StoreDTO storeDTO) throws Exception {
		try {
			return purprocessDAO.getStoreInfo(storeDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void insertInitialCheck(OrderedDTO orderedDTO) throws Exception {
		try {
			purprocessDAO.insertInitialCheck(orderedDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public OrderedDTO getOrderno(OrderedDTO orderedDTO) throws Exception {
		try {
			return purprocessDAO.getOrderno(orderedDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void insertOrderedProduct(OrderedDTO savecheck) throws Exception {
		try {
			purprocessDAO.insertOrderedProduct(savecheck);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateDelivery(OrderedDTO savecheck) throws Exception {
		try {
			purprocessDAO.updateDelivery(savecheck);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateDirect(OrderedDTO savecheck) throws Exception {
		try {
			purprocessDAO.updateDirect(savecheck);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateDeliveradd(OrderedDTO savecheck) throws Exception {
		try {
			purprocessDAO.updateDeliveradd(savecheck);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateDirectStore(OrderedDTO savecheck) throws Exception {
		try {
			purprocessDAO.updateDirectStore(savecheck);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateReserveDate(OrderedDTO savecheck) throws Exception {
		try {
			purprocessDAO.updateReserveDate(savecheck);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void saveorderedPoint(OrderedDTO savecheck) throws Exception {
		try {
			purprocessDAO.saveorderedPoint(savecheck);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updatepointPrice(OrderedDTO savecheck) throws Exception {
		try {
			purprocessDAO.updatepointPrice(savecheck);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updatestatus(OrderedDTO savecheck) throws Exception {
		try {
			purprocessDAO.updatestatus(savecheck);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void deleteMemberCart(OrderedDTO orderedDTO) throws Exception {
		try {
			purprocessDAO.deleteMemberCart(orderedDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public OrderedDTO selectOrderedList(CartListDTO cartlistDTO) throws Exception {
		try {
			return purprocessDAO.selectOrderedList(cartlistDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void addToCart(CartDTO cartDTO) throws Exception {
		try {
			purprocessDAO.addToCart(cartDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void addToZzim(CartDTO zzimDTO) throws Exception {
		try {
			purprocessDAO.addToZzim(zzimDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateCouponused(CartListDTO cartlistDTO) throws Exception {
		try {
			purprocessDAO.updateCouponused(cartlistDTO);
		} catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	
}
