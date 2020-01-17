package com.board.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.CommVO;

public class boardAnsReplyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("boardAnsReplyAction 진입 ");
		
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		int step = Integer.parseInt(request.getParameter("step"));
		int lev = Integer.parseInt(request.getParameter("lev"));
		
		lev ++;
		
		
		CommVO cvo = new CommVO();
		
		cvo.setWriter(request.getParameter("writer"));
		cvo.setContent(request.getParameter("content"));
		cvo.setPwd(request.getParameter("pwd"));
		cvo.setB_idx(b_idx);
		cvo.setIp(request.getRemoteAddr());
		cvo.setStep(step);
		cvo.setLev(lev);
		
		BoardDAO.setUpdateLev(cvo);
		
		
		BoardDAO.setReInsert(cvo);
		
		request.setAttribute("cvo", cvo);
		return "BoardController?b_idx="+cvo.getB_idx()+"&cPage="+cPage+"&type=boardContent&selValue=0";
		
	}

}
