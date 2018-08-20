package com.kh.spring.store.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
/*import com.kh.spring.storeReview.model.vo.StoreReview;*/
import com.kh.spring.store.model.vo.Store_time;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Override
	public Store selectOne(SqlSessionTemplate sqlSession, int store_pk) {
			
		return sqlSession.selectOne("store.selectOne",store_pk);
	}

	@Override
	public List<Menu> selectMenus(SqlSessionTemplate sqlSession, int store_pk) {
		
		return sqlSession.selectList("store.selectMenus",store_pk);
	}

	@Override
	public int deleteMenu(SqlSessionTemplate sqlSession, String menu_pk) {
	
		return sqlSession.delete("store.deleteMenu",menu_pk);
	}
	@Override
	public List<Store> mainStoreList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("store.mainStoreList");
	}

	@Override
	public int menuInsert(SqlSessionTemplate sqlSession, Menu menu) {
		return sqlSession.insert("store.menuInsert", menu);
	}

	@Override
	public int menuUpdate(SqlSessionTemplate sqlSession, Menu menu) {
		
		return sqlSession.update("store.menuUpdate", menu);
	}

	@Override

	public int updateStore(SqlSessionTemplate sqlSession, Store store) {
		// TODO Auto-generated method stub
		return sqlSession.update("store.storeUpdate", store);
	}

	@Override
	public int updateStore_time(SqlSessionTemplate sqlSession, Store_time store_time) {
		// TODO Auto-generated method stub
		return sqlSession.update("store.store_timeUpdate", store_time);
	}

	@Override
	public Store_time selectTime(SqlSessionTemplate sqlSession, int store_pk) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("store.store_timeSelect", store_pk);
	}

	public List<Menu> menuList(SqlSessionTemplate sqlSession, int store_pk) {
		return sqlSession.selectList("store.selectMenus", store_pk);
	}







}
