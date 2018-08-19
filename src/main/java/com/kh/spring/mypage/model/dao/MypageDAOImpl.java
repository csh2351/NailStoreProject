package com.kh.spring.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.reserve.model.vo.Reserve;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Override
	public List<Qna> selectList(SqlSessionTemplate sqlSession,int member_pk,int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
	      
		return sqlSession.selectList("qna.selectList", member_pk,rb);
	}

	@Override
	public int selectCount(SqlSessionTemplate sqlSession, int member_pk) {
		return sqlSession.selectOne("qna.selectCount",member_pk);
	}

	@Override
	public List<Reserve> mypageReserveList(SqlSessionTemplate sqlSession, int memberPk,int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("storeReserve.mypageReserveList", memberPk,rb);
	}

	@Override
	public int reserveCount(SqlSessionTemplate sqlSession, int memberPk) {
		
		return sqlSession.selectOne("storeReserve.reserveCount", memberPk);
	}

}
