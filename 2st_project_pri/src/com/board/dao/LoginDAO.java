package com.board.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.board.mybatis.DBService;
import com.board.vo.LoginVO;
import com.board.vo.MemberVO;

public class LoginDAO {

	//로그인 화면 확인
	public static HashMap<String, String> loginCheck(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		HashMap<String, String> result = ss.selectOne("loginCheck", map);
		System.out.println("id pwd 카운트 : " + result);
		ss.close();
		return result;
	}
	
	//로그인 UserDB
	public static int login(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.selectOne("userID", map);
		String dbID = "root";
		String dbPassword = "root"; //여기서 dbURL, dbID, dbPassword로 연결.
		ss.close();
		return result;
	}	

	//회원가입
	public static int join(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("join", map);
		ss.close();
		return result;
	}
	
	//아이디값 중복시, alert 창 띄우기
	public static int DuplicateIDCount(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int IDCount = ss.selectOne("getDuplicateID", id);
		ss.close();
		return IDCount;
	}
	
}
