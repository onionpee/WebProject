// 자유 게시판 글 선택 커맨드

package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDAO;
import com.beans.CrapDTO;

public class SelectCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			int uid = Integer.parseInt(request.getParameter("uid"));
			List<CrapDTO> list = null;
			
			try {
				list = new CrapDAO().selectByUid(uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("list", list);
	}
	
}
