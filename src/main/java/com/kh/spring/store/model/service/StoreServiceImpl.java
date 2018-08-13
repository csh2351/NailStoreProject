package com.kh.spring.store.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.store.model.dao.StoreDAO;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDAO dao;
	
	private Logger logger=LoggerFactory.getLogger(StoreServiceImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Store selectOne(int store_pk) {
		
		Store store = dao.selectOne(sqlSession,store_pk);
		return store;
	}

	@Override
	public List<Menu> selectMenu(int i) {
		
		return dao.selectMenus(sqlSession,i);
	}

	@Override
	public int deleteMenu(String menu_pk) {
		
		return dao.deleteMenu(sqlSession,menu_pk);
	}
	@Override

	public List<Store> storeList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Store> mainStoreList() {
		List<Store> naillist=dao.mainStoreList(sqlSession);
		return naillist;
	}

	@Override
	public int insertMenu(Menu menu, String store_pk) {
		
		return dao.menuInsert(sqlSession,menu,store_pk);
	}


}
