package com.test.ggh.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.ggh.dao.SaleMngDAO ;
import com.test.ggh.service.SaleMngService ;

/**
 * @Class Name : SaleMngServiceImpl.class
 * @Description : SaleMng Business Implement Class
 * @author ggh
 * @company ggh
 * @since 2026. 03. 22.
 * @version 1.0
 *
 * Copyright (C) by ggh All right reserved.
 */

@Service
@Transactional
public class SaleMngServiceImpl implements SaleMngService {

    @SuppressWarnings("unused")
    private static final Logger logger = LoggerFactory.getLogger(SaleMngServiceImpl.class);



	@Autowired(required=true)
	private SaleMngDAO saleMngDAO;

	/**
	 * selectSaleMngList
	 * @param HashMap<String, Object> map
	 * @return List<HashMap<String, Object>>
	 * @throws Exception
	 */
	@Override 
	public List<HashMap<String, Object>> selectSaleMngList(HashMap<String, Object> map) throws Exception {
	   return saleMngDAO.selectSaleMngList(map);
	}

	/**
	 * selectsaleMngListTotcnt
	 * @param HashMap<String, Object> map
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int selectSaleMngListTotcnt(HashMap<String, Object> map) throws Exception {
		return saleMngDAO.selectSaleMngListTotcnt(map);
	}
	 
	
	

	/**
	 * select one
	 * @param HashMap<String, Object> map
	 * @throws Exception
	 */
	@Override
	public HashMap<String, Object> selectSaleMng(HashMap<String, Object> map) throws Exception
	{
		return saleMngDAO.selectSaleMng(map);
	}


	/**
	 * insert 
	 * @param HashMap<String, Object> map
	 * @throws Exception
	 */
	@Override
	public void insertSaleMng(HashMap<String, Object> map) throws Exception
	{
		saleMngDAO.insertSaleMng(map);		
	}
	
	
	/**
	 * update
	 * @param HashMap<String, Object> map
	 * @throws Exception
	 */
	@Override
	public void updateSaleMng(HashMap<String, Object> map) throws Exception
	{
		saleMngDAO.updateSaleMng(map);	
	}
	
	
	
	/**
	 * delete
	 * @param HashMap<String, Object> map
	 * @throws Exception
	 */
	@Override
	public void deleteSaleMng(HashMap<String, Object> map) throws Exception
	{
		saleMngDAO.deleteSaleMng(map);		
	}

}


