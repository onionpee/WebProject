package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDAO;
import com.beans.CrapDTO;
import com.beans.Paging;
import com.beans.UserDAO;

public class hospitalReviewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String hosname = request.getParameter("hosName");
		
		System.out.println(hosname);
		
		UserDAO dao = new UserDAO();
		
		List<CrapDTO> list = null;
		
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		
		int count = 0;
		
		try {
			count = dao.hospitalCount(hosname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		paging.setPage(page);
		paging.setTotalCount(count);
		
		try {
			list = dao.hospitalReview(paging, hosname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
	}

}
