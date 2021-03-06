package com.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.board.vo.CommVO;
import com.board.mybatis.DBService;
import com.board.vo.BoardVO;

public class BoardDAO {
	
	//게시글(BBS_T)의 전체 건수 조회
		public static int getBoardTotalCount() {
			SqlSession ss = DBService.getFactory().openSession(true);
			//mapper.xml ->  selectOne -> resultType(int)로 설정 되어 있기 때문에 return type이 int다.
			//resultType => VO객체로 받을 수 있다.
			int totalCount = ss.selectOne("getBoardTotalCount");
			ss.close();
			return totalCount;
		}
		
		//표시할 게시글 조회
		public static List<BoardVO> getList(Map<String, Integer> map) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<BoardVO> list = ss.selectList("getBoardlist", map);
			ss.close();
			return list;
		}
	
		
		//글 하나 조회
		public static BoardVO getOneList(String seq) {
			SqlSession ss = DBService.getFactory().openSession(true);
			BoardVO vo = ss.selectOne("getOneList", seq);
			ss.close();
			return vo;
		}
		
		//검색 데이터를 받아 갯수 조회
		public static int getConSearchCount(Map<String, String> map) {
			SqlSession ss = DBService.getFactory().openSession(true);
			System.out.println("DAO Map Data : " + map);
			int result = ss.selectOne("getConSearchCount", map);
			System.out.println("검색 데이터 개수 : " + result);
			ss.close();
			return result;
		}
		
		//검색 데이터를 받아 조회
		public static List<BoardVO> getConSearch(Map<String, String> map) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<BoardVO> list = ss.selectList("getConSearch", map);
			System.out.println("검색 데이터 조회 값 : " + list);
			ss.close();
			return list;
		}
		
		//게시글 클릭시 조회수 1증가 처리
		public static int updateHit(int b_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("updateHit", b_idx);
			ss.close();
			return result;
		}
		
		
		/*
		===========================================
						게시글에 달린 댓글 
		===========================================
		*/
		//댓글 조회
		public static List<CommVO> getCommList(String b_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<CommVO> list = ss.selectList("getCommList", b_idx);
			ss.close();
			return list;
		}
		
		//댓글 step 조회
		public static int getCommStep(String b_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.selectOne("getCommStep", b_idx);
			ss.close();
			return result;
		}
		//댓글에 답글 추가 전
		//lev 1증가 처리(기존 댓글에 대한 순서 조정)
		public static int setUpdateLev(CommVO cvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("updateLev", cvo);
			ss.close();
			return result;
		}
		
		//댓글에 답글 추가
		public static int setReAnsWrite(CommVO cvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("setReAnsWrite", cvo);
			ss.close();
			return result;
		}
		
		//댓글 추가
		public static int setReInsert(CommVO cvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("setReInsert", cvo);
			ss.close();
			return result;
		}
		
		//댓글 삭제
		public static void setReDelete(CommVO cvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			ss.delete("re_delete", cvo);
			ss.close();
		}
		
		//댓글 입력
		public static int getReInsert(BoardVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("re_insert", vo);
			ss.close();
			return result;
		}
		
		//게시글 추가
		public static int getInsert(BoardVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("insert", vo);
			ss.close();
			return result;
		}

		//게시글 수정
		public static int getUpdate(BoardVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("update", vo);
			ss.close();
			return result;
		}
		
		//게시글 추가
		public static int getDelete(String b_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("delete", b_idx);
			ss.close();
			return result;
		}
}
