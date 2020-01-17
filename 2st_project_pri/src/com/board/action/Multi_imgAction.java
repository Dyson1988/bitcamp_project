package com.board.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Multi_imgAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String imgName ="";
	    //서비스클래스 (JAVA) 파일로 처리하는것이 좋다.
	 
	    //1. multiport/form-data 여부 확인
	    
	    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	    
	if (isMultipart) {
	    // 2. 메모리나 파일로 업로드 파일 보관하는 FileItem의 Factory 설정
	    DiskFileItemFactory factory = new DiskFileItemFactory();
	    
	    // 3. 업로드 요청을 처리하는 ServletFileUpload 생성
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    
	    // 4. 업로드 요청 파싱해서 FileItem 목록 구함
	    
	    List<FileItem> items;
		try {
			
			items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
		    
		    while(iter.hasNext()){
		        FileItem item = iter.next();
		        
	        	// 파일인지 여부 확인 : isFormFile() -> type=file 이외의 폼 데이터 인지 확인
	            if (item.isFormField()) { // 텍스트 입력인 경우
	            	// name : input name
	                String name = item.getFieldName(); 
	                String value;
					try {
						// 파일이 아니면 form 태그에서 전달 된 모든 데이터  저장
						// value : input value값
						value = item.getString("utf-8");
						System.out.println("일반 폼 필드 :" + name+ "-" + value);
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					} 
	            }else{
	                String name = item.getFieldName(); //필드이름
	                String originFileName = item.getName();  //원본 파일 명
	                //String contentType = item.getContentType();
	                //boolean isInMemory = item.isInMemory();
	                //long sizeInBytes = item.getSize(); //파일 사이즈
	                
	                System.out.println("파일 이름 :" + originFileName);
	                System.out.println("필드 이름 :" + name);
	                
	                // 저장하고자 하는 파일의 이름
	                imgName = "rexy" + originFileName;
	                System.out.println("저장 이름 :" + imgName);
	                
	                //웹서비스에서 사용되는 저장 경로
	                //String uploadUri = "C:\\MyStudy\\BITBANG\\-BitCamp_Project02\\Code\\WebContent\\main\\resale\\resale_img";;
	                
	                // 물리적인 경로 - 각각 지정
	                String dir = "C:\\MyStudy\\60_web\\2st_project_backup\\WebContent\\images\\resale_img";
	                System.out.println(dir+"의 물리적 경로 : "+ dir);
	                
	                // 데이터 저장 File(위치, 파일명)
	                // 만들어놓은 웹컨텐트 /file/photo/___ <이곳에 저장하기 위해 경로를 지정한것(물리적으로)
	                try {
						item.write(new File(dir, imgName));
					} catch (Exception e) {
						e.printStackTrace();
					}
	                
	            }
		    }//while End
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}
	    
	    
	 
	    }
	return "images/multi_imgs.jsp";
	}//exec End
}
