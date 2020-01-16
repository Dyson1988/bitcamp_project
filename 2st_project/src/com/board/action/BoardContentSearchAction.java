package com.board.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.board.vo.Paging;

public class BoardContentSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		System.out.println("BoardContentSearchAction 진입");
		//파라미터 값 추출
		String cPage = request.getParameter("cPage");
		String conSearch = request.getParameter("conSearch");
		String searchData = request.getParameter("searchData");
		String selValue = request.getParameter("selValue");
		
		System.out.println("상단 selValue : " + selValue);
		
		String idx = "";
		switch(conSearch) {
			case "subCon":  idx = "1"; break; //제목+내용
			case "subject": idx = "2"; break; //제목만
			case "writer":  idx = "3"; break; //글작성자
		}
		
		Map<String, String> map = new HashMap<>();
		System.out.println("idx : " + idx + " \n searchData : " + searchData);
		map.put("idx", idx);
		map.put("searchData", searchData);
		
		
		Paging paging = new Paging();
		
		System.out.println(map.toString());
		System.out.println("map idx : " + map.get("idx"));
		System.out.println("map searchData : " + map.get("searchData"));
		
		
		if(!selValue.equals("0")) {
			paging.setNumPerPage(Integer.parseInt(selValue));
		}
		
		paging.setTotalRecord(BoardDAO.getConSearchCount(map));	//DB에 등록 된 총 게시물 수
		paging.setTotalPage();									//전체 페이지 갯수
		
		System.out.println("TotalRecord : " + paging.getTotalRecord());
		System.out.println("TotalPage : " + paging.getTotalPage());
		
		//현재 페이지 구하기
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
		
		map.put("begin", String.valueOf(paging.getBegin()));
		map.put("end", String.valueOf(paging.getEnd()));
		System.out.println("begin : " + paging.getBegin() + " end : " + paging.getEnd());
		
		List<BoardVO> list = BoardDAO.getConSearch(map);
		System.out.println("현재페이지 글목록(list) : " + list);
		
		
		request.setAttribute("list", list);
		request.setAttribute("conSearch", conSearch);
		request.setAttribute("searchData", searchData);
		request.setAttribute("selValue", selValue);
		
		if(!cPage.equals("0")) {
			return "BoardSearchView.jsp?cPage=" + cPage;
		} else {
			return "BoardSearchView.jsp";
		}
	}

}
