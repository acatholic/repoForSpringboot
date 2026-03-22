package com.test.ggh.controller ;

import java.util.HashMap ;
import java.util.ArrayList ;
import java.util.List ;
import jakarta.servlet.http.HttpServletRequest ;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.test.ggh.service.SaleMngService ;
import com.test.ggh.util.PaginationInfo;

/**
 * @Class Name : SaleMngController.class
 * @Description : SaleMng Controller Class
 * @author ggh
 * @company ggh
 * @since 2026. 03. 22.
 * @version 1.0
 *
 * Copyright (C) by ggh All right reserved.
 */

@SuppressWarnings("unlikely-arg-type")
@CrossOrigin("*")
@Controller
public class SaleMngController
{
  

  private static final Logger logger = LoggerFactory.getLogger("SaleMngServiceImpl.class");

  
  /** saleMngService */
  @Autowired
  private SaleMngService saleMngService ;
  
  
  @CrossOrigin("*")
  @PostMapping(value = "/saleMng/selectSaleMng")
  public ModelAndView selectSaleMng(
       @RequestParam HashMap<String, Object> param ,
       HttpServletRequest request, HttpServletResponse response)
	      throws Exception { 
	  ModelAndView  mv = new ModelAndView() ; 
	  HashMap<String, Object>  result = new HashMap<String, Object>() ; 

      logger.info("/saleMng/selectSaleMng start");
      result = saleMngService.selectSaleMng(param);
      if(result == null || "".equals(result))
      {
        mv.addObject("result", "none");
      }
      else
      {
        mv.addObject("result", result);
      }
    
      mv.setViewName("saleMng/content")  ;
      logger.info("/saleMng/selectSaleMng end");
   
    return mv;
    
  }

  
  @CrossOrigin("*")
  @PostMapping(value = "/saleMng/selectSaleMngList")
  public @ResponseBody HashMap<String, Object> selectSaleMngList(
  	@RequestParam HashMap<String, Object> param ,
  	ModelAndView  mv,
     HttpServletRequest request, HttpServletResponse response)
	  	throws Exception { 

      logger.info("/saleMng/selectSaleMngList start");
      param = paramProcess(param);
      
	  
      PaginationInfo pInfo = new PaginationInfo();
      String sCurrPage = String.valueOf(param.get("currPage"));
      if("null".equals(sCurrPage) || "".equals(sCurrPage) || sCurrPage == null)
      {
           sCurrPage = "1";
           pInfo.currentPageNo = Integer.parseInt("1");
      }
      else
      {
           pInfo.currentPageNo = Integer.parseInt(sCurrPage);
      }	
      param.put("currPage", pInfo.currentPageNo);

      
      
      String sTotCntPerPage = String.valueOf(param.get("totCntPerPage"));
      if("null".equals(sTotCntPerPage) || "".equals(sTotCntPerPage) || sTotCntPerPage == null || "[object HTMLInputElement]".equals(sTotCntPerPage))
      {
        sTotCntPerPage = "10";
        pInfo.recordCountPerPage = Integer.parseInt(sTotCntPerPage);
      }
      else
      {
        pInfo.recordCountPerPage = Integer.parseInt(sTotCntPerPage);
      }
	  
	  
      param.put("totCntPerPage", pInfo.recordCountPerPage);
      String pageSize = String.valueOf(param.get("linkPageSize"));
      if("null".equals(pageSize) || "".equals(pageSize) || pageSize == null || "[object HTMLInputElement]".equals(pageSize))
      {
      	  pInfo.pageSize = 10;
      }
      else
      {
      	 pInfo.pageSize = Integer.parseInt(pageSize);   
      }			
  
      int totalCnt = saleMngService.selectSaleMngListTotcnt(param);
	  pInfo.totalPage = pInfo.getTotalPageCount(totalCnt, pInfo.recordCountPerPage);
      
	  
      
      String pagingStr = pInfo.pagingInfoStr(pInfo.totalPage, pInfo.currentPageNo , pInfo.recordCountPerPage , "list" , param);
	  HashMap<String,Object> hMap = new HashMap<String,Object>();
	  hMap.put("pagingStr", pagingStr);
	  hMap.put("totalCnt", totalCnt);
	  hMap.put("currPage", param.get("currPage"));
	  hMap.put("srchField", param.get("srchField"));
	  hMap.put("srchValue", param.get("srchValue"));
	  hMap.put("paramStr", param);
      List<HashMap<String, Object>>  result = new ArrayList<HashMap<String, Object>>() ;
   
	  result = saleMngService.selectSaleMngList(param);
	  
	  
	  hMap.put("result" , result);
      logger.info("/saleMng/selectSaleMngList end");
	 
      return hMap;
	 
  }
	 
 
  
  @CrossOrigin("*")
  @PostMapping(value = "/saleMng/insertSaleMng")
  public void insertSaleMng(
     @RequestParam HashMap<String, Object> param ,
     HttpServletRequest request, HttpServletResponse response)
	  	throws Exception { 
	 
        logger.info("/saleMng/insertSaleMng start");
	    saleMngService.insertSaleMng(param);
        logger.info("/saleMng/insertSaleMng end");
  }
	 
  
  @CrossOrigin("*")
  @PostMapping(value = "/saleMng/updateSaleMng")
  public void updateSaleMng(
  	@RequestParam HashMap<String, Object> param ,
     HttpServletRequest request, HttpServletResponse response)
	  	throws Exception { 

        logger.info("/saleMng/updateSaleMng start");
	    saleMngService.updateSaleMng(param);
        logger.info("/saleMng/updateSaleMng end");
	  
  }
	 
  
  @CrossOrigin("*")
  @PostMapping(value = "/saleMng/deleteSaleMng")
  public void deleteSaleMng(
  	@RequestParam HashMap<String, Object> param ,
     HttpServletRequest request, HttpServletResponse response)
	    throws Exception { 
        logger.info("/saleMng/deleteSaleMng start");
	    saleMngService.deleteSaleMng(param);
        logger.info("/saleMng/deleteSaleMng end");
  }
	 
  
  @CrossOrigin("*")
  @GetMapping(value = "/saleMng/list")
  public String list(HttpServletRequest request, HttpServletResponse response)
	  	throws Exception { 
	
	  return "/saleMng/list";
  }
		
		
  @CrossOrigin("*")
  @PostMapping(value = "/saleMng/list")
  public String listPost(HttpServletRequest request, HttpServletResponse response)
	  	throws Exception { 
	
	  return "/saleMng/list";
	  
	  
  }
  @CrossOrigin("*")
  @GetMapping(value = "/saleMng/create")
  public String create(HttpServletRequest request, HttpServletResponse response)
  		throws Exception { 
	
	  return "/saleMng/create";
  }
		
		
  @CrossOrigin("*")
  @GetMapping(value = "/saleMng/content")
  public String content(HttpServletRequest request, HttpServletResponse response)
	  	throws Exception { 
	
	  return "/saleMng/content";
  }
		
		
  @CrossOrigin("*")
  @PostMapping(value = "/saleMng/modify")
  public String modify(HttpServletRequest request, HttpServletResponse response)
	  	throws Exception { 
			
	  return "/saleMng/modify";
  }
		
		
  public HashMap<String, Object> paramProcess(HashMap<String, Object> param) throws Exception {
	  HashMap<String, Object> returnParam = new HashMap<String, Object>();
	  String srchField = String.valueOf(param.get("srchField"));
	  String srchValue = String.valueOf(param.get("srchValue"));
	  String totCntPerPage = String.valueOf(param.get("totCntPerPage"));
	  String currPage = String.valueOf(param.get("currPage"));

      returnParam = param;
	  if (!"".equals(srchField) && !"null".equals(srchField) && srchField != null) {
		returnParam.put("srchField", srchField);
	  } else {
		 returnParam.put("srchField", "");
	  }
		
	  if (!"".equals(srchValue) && !"null".equals(srchValue) && srchValue != null) {
		returnParam.put("srchValue", srchValue);
	  } else {
		returnParam.put("srchValue", "");
	  }
		
	  if (!"".equals(srchField) && !"null".equals(srchField) && srchField != null
				&& !"".equals(srchValue) && !"null".equals(srchValue) && srchValue != null) {
		returnParam.put(srchField, srchValue);
	  } else {
		returnParam.put(srchField, "");
	  }
		
	  if (!"".equals(totCntPerPage) && !"null".equals(totCntPerPage) && !"null".equals(totCntPerPage)) {
		returnParam.put("totCntPerPage", totCntPerPage);
	  } else {
		returnParam.put("totCntPerPage", "");
	  }
		
	  if (!"".equals(currPage) && !"null".equals(currPage) && !"null".equals(currPage)) {
		returnParam.put("currPage", currPage);
	  } else {
		returnParam.put("currPage", "");
	  }

	  return returnParam;
	}
} 

