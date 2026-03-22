package com.test.ggh.dao;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Repository;


@Repository
public interface SaleMngDAO {



     /**
      * select one
      * @param map
      * @return
      * @throws Exception
      */
     HashMap<String, Object> selectSaleMng(HashMap<String, Object> map) throws Exception;


     /**
      * select list
      * @param map
      * @return
      * @throws Exception
      */
     List<HashMap<String, Object>> selectSaleMngList(HashMap<String, Object> map) throws Exception;



     /**
      * select total cnt
      * @param map
      * @return
      * @throws Exception
      */
     int selectSaleMngListTotcnt(HashMap<String, Object> map) throws Exception;


     /**
      * insert 
      * @param map
      * @throws Exception
      */
     void insertSaleMng(HashMap<String, Object> map) throws Exception;


     /**
      * update
      * @param map
      * @throws Exception
      */
     void updateSaleMng(HashMap<String, Object> map) throws Exception;


     /**
      * delete
      * @param map
      * @throws Exception
      */
     void deleteSaleMng(HashMap<String, Object> map) throws Exception;


}

