// 자유 게시판 글 보는 커맨드

package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDAO;
import com.beans.CrapDTO;

public class ViewCommand implements Command{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		List<CrapDTO> list = null;
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		try {
			list = new CrapDAO().readByUid(uid);
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
