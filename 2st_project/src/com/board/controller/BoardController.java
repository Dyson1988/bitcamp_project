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
import com.board.action.BoardContentAddAction;
import com.board.action.BoardContentControlAction;
import com.board.action.BoardContentSearchAction;
import com.board.action.CheckIDAction;
import com.board.action.Multi_imgAction;
import com.board.action.boardAnsDeleteAction;
import com.board.action.boardAnsReplyAction;
import com.board.action.boardAnsWriteAction;
import com.board.action.joinAction;
import com.board.action.loginAction;
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
		System.out.println("type = " + type);
		
		switch(type) {
			case"boardAllList": action = new BoardAllListAction();		break;
			case"boardContent": action = new BoardContentAction();		break;
			case"boardContentControl": action = new BoardContentControlAction();		break;
			case"boardContentAdd": action = new BoardContentAddAction();		break;
			case"boardContentSearch": action = new BoardContentSearchAction();	break;
			case"boardAnsWrite": action = new boardAnsWriteAction();	break;
			case"boardAnsDelete": action = new boardAnsDeleteAction();	break;
			case"boardAnsReply": action = new boardAnsReplyAction();	break;
			case"rexy": action = new Multi_imgAction(); break;
			case"login": action = new loginAction(); break;
			case"join": action = new joinAction(); break;
			case"Duplicate_go": action = new CheckIDAction(); break;
		}
		
		path = action.execute(request, response);
		            
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
