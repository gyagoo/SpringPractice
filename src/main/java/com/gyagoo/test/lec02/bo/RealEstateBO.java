package com.gyagoo.test.lec02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyagoo.test.lec02.dao.RealEstateDAO;
import com.gyagoo.test.lec02.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	public List<RealEstate> getRentPrice(int rentPrice) {
		return realEstateDAO.selectRentPrice(rentPrice);
	}
	
	// HaspMap<String, Object> map = new HashMap<String, Object>();
}