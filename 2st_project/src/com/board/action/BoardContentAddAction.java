package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardContentAddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = request.getSession().getServletContext().getRealPath("/mvc_view");
		// String path = getServletContext().getRealPath("/upload");
		MultipartRequest mr = new MultipartRequest(request, path, 500 * 1024 * 1024, "utf-8",
				new DefaultFileRenamePolicy());

		BoardVO vo = new BoardVO();
		vo.setWriter(mr.getParameter("writer"));
		vo.setSubject(mr.getParameter("subject"));
		vo.setContent(mr.getParameter("content"));
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
		
		BoardDAO.getInsert(vo);
		return "BoardController?cPage=0&type=boardAllList";
	}

}
