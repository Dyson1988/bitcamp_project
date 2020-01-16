package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.CommVO;

public class replyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		System.out.println("replyAction 진입");
		
		String cPage = request.getParameter("cPage");
		
		CommVO cvo = new CommVO();
		
		cvo.setWriter(request.getParameter("writer"));
		cvo.setContent(request.getParameter("content"));
		cvo.setPwd(request.getParameter("pwd"));
		cvo.setB_idx(request.getParameter("b_idx"));
		cvo.setIp(request.getRemoteAddr());
		BoardDAO.setInsert(cvo);
		
		request.setAttribute("cvo", cvo);
		return "BoardController?b_idx="+cvo.getB_idx()+"&cPage="+cPage+"&type=boardContent&selValue=0";
	}

}
