package dev.department.subscribe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.IndexDAO;
import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.BrandNewsDTO;
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.dto.SubsDTO;
import dev.department.subscribe.dto.ZzimDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexDAO indexDAO;
	
	@Override
	public ArrayList<BrandDTO> getBranSubsList(int memNo) throws Exception {
		return indexDAO.getBranSubsList(memNo);
	}
	
	@Override
	public String brandSubsAction(int brandNo, int subsed, int memberNo) throws Exception {
		int subsResult = 0;
		int updResult = 0;
		String result = "실패";
		
		if (subsed == 1) {
			subsResult = indexDAO.brandSubsCancel(new SubsDTO(brandNo, memberNo));
			updResult = indexDAO.subsCntMinUpdate(brandNo);
			
			if (subsResult == 1 && updResult == 1) {
				result = "취소완료";
			}
		} else {
			subsResult = indexDAO.brandSubsEnroll(new SubsDTO(brandNo, memberNo));
			updResult = indexDAO.subsCntPlusUpdate(brandNo);
			
			if (subsResult == 1 && updResult == 1) {
				result = "구독완료";
			}
		}
		
		return result;
	}
	
	@Override
	public ArrayList<BrandNewsDTO> brandNewsList() throws Exception {
		return indexDAO.brandNewsList();
	}

	@Override
	public ArrayList<ProductDTO> getBestSellers() throws Exception {
		return indexDAO.getBestSellers();
	}

	@Override
	public ArrayList<ProductDTO> getNewProducts() throws Exception {
		return indexDAO.getNewProducts();
	}

	@Override
	public ArrayList<ProductDTO> selectByKeyword(String keyWord) throws Exception {
		return indexDAO.selectByKeyword(keyWord);
	}

	@Override
	public ArrayList<ProductDTO> getBestSellersFromSubs(int memNo) throws Exception {
		return indexDAO.getBestSellersFromSubs(memNo);
	}

	@Override
	public ArrayList<ProductDTO> getNewProductsFromSubs(int memNo) throws Exception {
		return indexDAO.getNewProductsFromSubs(memNo);
	}

	@Override
	public String ZzimAction(int productNo, int memberNo) throws Exception {
		String result = "실패";
		ZzimDTO zzimDTO = new ZzimDTO(productNo, memberNo);
		
		int zzimCheck = indexDAO.zzimCheck(zzimDTO);
		
		if (zzimCheck != 1) {
			int updateCnt = indexDAO.updateZzimCnt(productNo);
			int insertAction = indexDAO.insertZzim(zzimDTO);

			if (updateCnt == 1 && insertAction == 1) {
				result = "성공";
			}
		} else {
			result = "이미 존재";
		}
		
		return result;
	}

}
