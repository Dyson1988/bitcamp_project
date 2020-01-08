package com.board.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.ibatis.session.SqlSession;

import com.board.dao.BoardDAO;
import com.board.mybatis.DBService;
import com.board.vo.BoardVO;
import com.board.vo.Paging;

public class BoardAllListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		Paging paging = new Paging();
		
		paging.setTotalRecord(BoardDAO.getBoardTotalCount());	//DB에 등록 된 총 게시물 수 
		paging.setTotalPage();									//전체 페이지 갯수
		
		//현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		System.out.println("action cPage : " + cPage);
		if(!cPage.equals("0")) {//넘겨받은 데이터가 있으면
			System.out.println("Integer.parseInt(cPage) : " + Integer.parseInt(cPage));
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		//현재 페이지(nowPage)의 시작번호(begin) 끝번호(end) 구하기
		paging.setEnd(paging.getNowPage() * paging.getNumPerPage());  //현재 페이지 * 한페이지 당 게시글 수 = 현재 페이지의 마지막 번호 
		paging.setBegin(paging.getEnd() - paging.getNumPerPage() + 1);
		
		//블록의 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage = paging.getNowPage();
		int beginPage = (nowPage - 1) / paging.getPagePerBlock() * paging.getPagePerBlock() + 1;
		paging.setBeginPage(beginPage);
		paging.setEndPage(paging.getBeginPage() + paging.getPagePerBlock() - 1);
		
		
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		if (paging.getEndPage() > paging.getTotalPage()) {
			paging.setEndPage(paging.getTotalPage());
		}
		
		request.setAttribute("paging", paging);
		request.setAttribute("cPage", cPage);
		
		//현재페이지 기준으로 게시글 가져오기
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", paging.getBegin());
		map.put("end", paging.getEnd());
		
		System.out.println("begin : " + paging.getBegin() + " end : " + paging.getEnd());
		
		List<BoardVO> list = BoardDAO.getList(map);
		System.out.println("현재페이지 글목록(list) : " + list);
		
		request.setAttribute("list", list);
		
		
		if(!cPage.equals("0")) {
			return "BoardView.jsp?cPage=" + cPage;
		} else {
			return "BoardView.jsp";
		}
	}

}
