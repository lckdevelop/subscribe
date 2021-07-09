package dev.department.subscribe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.department.subscribe.dao.IndexDAO;
import dev.department.subscribe.dto.BrandDTO;
import dev.department.subscribe.dto.BrandNewsDTO;
import dev.department.subscribe.dto.ProductDTO;
import dev.department.subscribe.dto.SubsDTO;
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
}
