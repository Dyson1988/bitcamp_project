package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.LoginDAO;
import com.board.vo.MemberVO;

public class joinAction implements Action {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LoginDAO loginDAO = new LoginDAO();
		Map<String, String> map = new HashMap<String, String>();
		map.put("ID", request.getParameter("ID"));
		map.put("PWD", request.getParameter("PWD"));
		map.put("name", request.getParameter("name"));
		map.put("age", request.getParameter("age"));
		map.put("address", request.getParameter("address"));
		
		int result = LoginDAO.join(map);
		if (result == 1) {//회원가입 성공시 1
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		else if (result == 0) {//회원가입 실패시 0
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	    
	    
	    
		
		return null;
	
	}
}
