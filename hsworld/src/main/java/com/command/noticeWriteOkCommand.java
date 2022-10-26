package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDAO;
import com.beans.CrapDTO;

public class noticeWriteOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		CrapDTO dto = new CrapDTO();
		dto.setNT_TITLE(title);
		dto.setNT_CONTENT(content);
		
		if (title != null && title.trim().length() > 0) {
			try {
				cnt = new CrapDAO().NoticeInsert(dto);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);

	}

}
