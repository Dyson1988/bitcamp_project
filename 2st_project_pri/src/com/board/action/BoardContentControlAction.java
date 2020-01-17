package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardContentControlAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String contControl = request.getParameter("contControl");
		
		System.out.println("contControl data : " + contControl);
		System.out.println("contentContol에  진입");
		
		request.setCharacterEncoding("utf-8");
		String path = request.getSession().getServletContext().getRealPath("/mvc_view");
		MultipartRequest mr = new MultipartRequest(request, path, 500 * 1024 * 1024, "utf-8",
				new DefaultFileRenamePolicy());

		BoardVO vo = new BoardVO();
		vo.setWriter(mr.getParameter("writer"));
		vo.setSubject(mr.getParameter("subject"));
		vo.setContent(mr.getParameter("content"));
		vo.setB_idx(mr.getParameter("b_idx"));
		vo.setPwd(mr.getParameter("pwd"));
		vo.setIp(request.getRemoteAddr());

		// 파일 유무
		if (mr.getFile("file_name") != null) {
			vo.setFile_name(mr.getFilesystemName("file_name"));
			vo.setOri_name(mr.getOriginalFileName("file_name"));
		} else {
			vo.setFile_name("");
			vo.setOri_name("");
		}
		
		System.out.println("여기까지 진입");
		
		if(contControl.equals("0")) {				//게시글 수정 처리
			BoardDAO.getUpdate(vo);
			return "BoardController?b_idx=" + vo.getB_idx() 
			+ "&cPage=" + mr.getParameter("cPage") +"&type=boardContent";
			
		} else if (contControl.equals("1")){		//게시글 삭제 처리
			BoardDAO.getDelete(vo.getB_idx());
			return "BoardController?&cPage=0&type=boardAllList&selValue=0";
			
		} else if(contControl.equals("2")){			//게시글 추가 처리
			BoardDAO.getInsert(vo);
			return "BoardController?cPage=0&type=boardAllList&selValue=0";
		} else {
			return "BoardView.jsp";
		}
		
		
	}

}
