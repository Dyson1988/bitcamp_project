package com.login.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.board.dao.LoginDAO;

public class CheckIDAction implements Action {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		System.out.println("CheckIdAction 진입");
		
		//String id = request.getParameter("id");
		String id = request.getParameter("id");
		
		int result = LoginDAO.DuplicateIDCount(id);
		
		System.out.println("result 값 : " + result);
		
		request.setAttribute("result", result);
		
		return "join.jsp";
	}
}
