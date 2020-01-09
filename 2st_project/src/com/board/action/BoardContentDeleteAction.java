package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;

public class BoardContentDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardVO vo = new BoardVO();
		
		vo.setB_idx(request.getParameter("b_idx"));
		System.out.println("b_idx : " + vo.getB_idx());
		
		BoardDAO.getDelete(vo.getB_idx());

		return "BoardController?&cPage=0&type=boardAllList";
	}

}
