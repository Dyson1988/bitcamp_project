package com.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.board.action.Action;
import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.board.vo.CommVO;

public class BoardContentAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		//BoardView -> Controller -> 로부터 전달 받은 파라미터 값 추출
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		String selValue = request.getParameter("selValue");
		
		System.out.println("b_idx : " + b_idx);
		System.out.println("cPage : " + cPage);
		
		//게시글 조회수 1증가 처리
		BoardDAO.updateHit(Integer.parseInt(b_idx));
		
		//유저가 클릭한 한개의 게시글 내용을 DB로부터 가져온다.
		BoardVO bvo = BoardDAO.getOneList(b_idx);
		
		//게시글에 댓글 여부를 확인하기위해 가져온다.
		List<CommVO> c_list = BoardDAO.getCommList(b_idx);
		int stepResult = BoardDAO.getCommStep(b_idx);
		
		//조회된 데이터를 view페이지에서 사용할 수 있도록 속성에 저장한다.
		request.setAttribute("bvo", bvo);
		request.setAttribute("c_list", c_list);
		request.setAttribute("cPage", cPage);//작업중 페이지로 이동시 사용
		request.setAttribute("selValue", selValue);//작업중 페이지로 이동시 사용
		request.setAttribute("stepResult", stepResult);
		
		
		System.out.println("stepResult : " + stepResult);
		System.out.println("c_list 값 : " + c_list);
		return "BoardContentView.jsp";
	}

}
