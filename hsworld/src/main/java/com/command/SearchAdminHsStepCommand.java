package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchAdminHsStepCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String col = request.getParameter("column");
		String keyword = request.getParameter("searchWord");
		
		System.out.println("col : " + col);
		System.out.println("keyword : " + keyword);
		
		request.setAttribute("col", col);
		request.setAttribute("keyword", keyword);

	}

}
