package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.CommVO;

public class boardAnsDeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		String selValue = request.getParameter("selValue");
		int step = Integer.parseInt(request.getParameter("step"));
		int lev = Integer.parseInt(request.getParameter("lev"));
		CommVO cvo = new CommVO();
		
		cvo.setB_idx(request.getParameter("b_idx"));
		cvo.setStep(step);
		cvo.setLev(lev);
		
		BoardDAO.setReDelete(cvo);
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("b_idx", b_idx);
		request.setAttribute("selValue", selValue);
		
		
		
		return "BoardController?type=boardContent";
	}

}
