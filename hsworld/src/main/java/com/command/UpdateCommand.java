// 자유 게시판 글 수정 커맨드

package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.*;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");

		if ((title != null && title.trim().length() > 0)) {
			try {
				cnt = new CrapDAO().update(uid, title, summary);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("result", cnt);
	}
}