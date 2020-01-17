package com.board.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.dao.BoardDAO;
import com.board.dao.LoginDAO;
import com.board.vo.LoginVO;

public class loginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		
		Map<String, String> map = new HashMap<>();
		map.put("id", userID);
		map.put("pwd", userPassword);
		System.out.println("id, pwd : " + map.get("id")+ " " + map.get("pwd"));
		HashMap<String, String> hmap = LoginDAO.loginCheck(map);
		
		System.out.println("hmap : " + hmap.toString());
		
		String path = null;
		//분기처리
		
		if(hmap.get("PWD").equals(userPassword)) {
			System.out.println("로그인 성공");
			//session이 없을시 생성해주는 코드
			HttpSession session = request.getSession(true);
			session.setAttribute("userID", request.getParameter("userID"));
			path = "main.jsp"; //로그인 성공시 갈 곳~
		} else if (!hmap.get("PWD").equals(userPassword)) {
			System.out.println("비밀번호 오류");
			path = "login.jsp"; //비밀번호 오류시 login창 다시 띄움
			
		}
		
		return path;
		//1 로그인 성공
		
		//0 비밀번호가 틀림

	}

}
