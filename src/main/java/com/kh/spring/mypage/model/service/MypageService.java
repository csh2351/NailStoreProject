package com.kh.spring.mypage.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.reserve.model.vo.Reserve;


public interface MypageService {

	List<Qna> selectList(int member_pk,int cPage, int numPerPage);
	
	int selectCount(int member_pk);
	
	Qna selectOne(int qna_pk);
	
	List<Reserve> mypageReserveList(int memberPk,int cPage, int numPerPage);
	
	int reserveCount(int memberPk);
	
	Member loginCheck(String memberId);
	
	int delete(int memberPk);

	String findCheck(int memberPk);

	String duplicatePwCheck(int parseInt);

	int mypagePwUpdate(Member member);

	int mypageUpdate(Member m);
}