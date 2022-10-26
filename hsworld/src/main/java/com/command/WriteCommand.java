package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDAO;
import com.beans.CrapDTO;

public class WriteCommand implements Command{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String user = (String)request.getAttribute("user");
		String hsname = request.getParameter("hosname");
		System.out.println(user+":"+content);
		
		CrapDTO dto = new CrapDTO();
		dto.setCR_TITLE(title);
		dto.setCR_CONTENT(content);
		dto.setCR_HOSNAME(hsname);
//		System.out.println(title);
//		System.out.println(content);
		
		if (title != null && title.trim().length() > 0) {
			try {
				cnt = new CrapDAO().insert(dto,user);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
	}
}
