package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDAO;

public class noticeDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		try {
			cnt = new CrapDAO().NoticeDelete(uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		request.setAttribute("result", cnt);
	}

}
