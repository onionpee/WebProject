package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDAO;
import com.beans.CrapDTO;
import com.beans.Paging;

public class ListOldCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CrapDAO dao = new CrapDAO();
		List<CrapDTO> list = null;
		
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		
		int count = 0;
		
		try {
			count = dao.getReviewCount();
//			System.out.println("count : " + count);
		} catch ( SQLException e) {
			e.printStackTrace();
		}
		paging.setPage(page);
		paging.setTotalCount(count);
		System.out.println("page : " + page);
		System.out.println("count : " + count);
		
		try {
			list = dao.selectAllReviewOld(paging);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);

	}

}
