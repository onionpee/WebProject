package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class searchTestCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String sb = request.getParameter("subject");
		String lo = request.getParameter("location");
		String hs = request.getParameter("hsname");
		String sW = request.getParameter("searchWord");
		
		
		System.out.println("sb : " + sb);
		System.out.println("lo : " + lo);
		System.out.println("hs : " + hs);
		request.setAttribute("subject", sb);
		request.setAttribute("location", lo);
		request.setAttribute("hsname", hs);
		request.setAttribute("searchWord", sW);

	}

}
