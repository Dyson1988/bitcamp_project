package com.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.board.action.BoardAllListAction;
import com.board.action.BoardContentAction;
import com.board.action.BoardContentDeleteAction;
import com.board.action.BoardContentModifyAction;
import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;

@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("controller doget 진입");
		//index.jsp로 부터 전달 받은 type의 값을 받기 위해 파라미터 값 추출
		String type = request.getParameter("type");
		String path = "";
		Action action = null;
		
		switch(type) {
		
			case"boardAllList": action = new BoardAllListAction(); break;
			case"boardContent": action = new BoardContentAction(); break;
			case"boardContentModify": action = new BoardContentModifyAction(); break;
			case"boardContentDelete": action = new BoardContentDeleteAction(); break;
		}
		
		path = action.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
