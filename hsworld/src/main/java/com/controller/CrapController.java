package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.AdminDeleteUserCommand;
import com.command.AdminHosSearchListCommand;
import com.command.AdminHospitalInfoCommand;
import com.command.AdminHospitalListCommand;
import com.command.AdminHospitalUpdateCommand;
import com.command.AdminHospitalUpdateOkCommand;
import com.command.AdminUpdateUserCommand;
import com.command.AdminUserSelectCommand;
import com.command.CheckIdCommand;
import com.command.Command;
import com.command.DeleteCommand;
import com.command.DeleteUserCommand;
import com.command.GetMemberCommand;
import com.command.ListBestCommand;
import com.command.ListCommand;
import com.command.ListOldCommand;
import com.command.LoginCommand;
import com.command.MemListCommand;
import com.command.ReviewCountCommand;
import com.command.SearchAdminHsStepCommand;
import com.command.SearchCommand;
import com.command.SelectCommand;
import com.command.SignupCommand;
import com.command.UpdateCommand;
import com.command.UpdateUserCommand;
import com.command.UserInfoCommand;
import com.command.ViewCommand;
import com.command.WriteCommand;
import com.command.hosSearchCommand;
import com.command.hosSearchStepCommand;
import com.command.hospitalReviewCommand;
import com.command.noticeDeleteCommand;
import com.command.noticeListCommand;
import com.command.noticeUpdateCommand;
import com.command.noticeViewCommand;
import com.command.noticeWriteOkCommand;
import com.command.reviewListSearchCommand;
import com.command.searchListStepCommand;
import com.command.searchTestCommand;
import com.command.selectNoticeCommand;

/**
 * Servlet implementation class CrapController
 */
@WebServlet("*.do")
public class CrapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CrapController() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Command command = null;
		
		String viewPage = null;
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		String conPath = request.getContextPath();
		System.out.println(conPath);
		String com = uri.substring(conPath.length());
		System.out.println(com);
		
		
		switch(com) {
		//후기게시판 리스트 (최신순)
		case "/list.do":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;

		//후기게시판 리스트 (오래된순)
		case "/listOld.do":
			command = new ListOldCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;	
			
		//후기게시판 리스트 (조회수 많은 순)
		case "/listBest.do":
			command = new ListBestCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;			
			
		//후기게시글 확인
		case "/view.do":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "view.jsp";
			break;
		// 후기게시글 작성
		case "/write.do":
			viewPage = "write.jsp";
			break;
		// 후기게시글 작성 완료
		case "/writeOk.do":
			request.setAttribute("user", session.getAttribute("id"));
			System.out.println("???? : " + (String)session.getAttribute("id"));
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "writeOk.jsp";
			break;
		// 후기게시글 수정
		case "/update.do":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "update.jsp";
			break;
		// 후기게시글 수정 완료
		case "/updateOk.do":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "updateOk.jsp";
			break;
		// 후기게시글 삭제 완료
		case "/deleteOk.do":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "deleteOk.jsp";
			break;
			
		// 후기게시판 병원 검색
		case "/hosTest.do":
			viewPage = "hosSearch.jsp";
			break;
			

			
		// 공지사항
		case "/notice.do":
			command = new noticeListCommand();
			command.execute(request, response);
			viewPage = "notice.jsp";
			break;
			
		// 공지사항 조회
		case "/noticeView.do":
			command = new noticeViewCommand();
			command.execute(request, response);
			viewPage = "noticeView.jsp";
			break;
			
		// 공지사항 수정
		case "/noticeUpdate.do":
			command = new selectNoticeCommand();
			command.execute(request, response);
			viewPage = "noticeUpdate.jsp";
			break;
			
		// 공지사항 수정 완료
		case "/noticeUpdateOk.do":
			command = new noticeUpdateCommand();
			command.execute(request, response);
			viewPage = "noticeUpdateOk.jsp";
			break;
			
		// 공지사항 작성
		case "/noticeWrite.do":
			viewPage = "noticeWrite.jsp";
			break;
			
		// 공지사항 작성 완료
		case "/noticeWriteOk.do":
			command = new noticeWriteOkCommand();
			command.execute(request, response);
			viewPage = "noticeWriteOk.jsp";
			break;
			
		// 공지사항 삭제
		case "/noticeDelete.do":
			command = new noticeDeleteCommand();
			command.execute(request, response);
			viewPage = "noticeDelete.jsp";
			break;
			
		// 어드민 유저 목록
		case "/memList.do":
			command = new MemListCommand();
			command.execute(request, response);
			viewPage = "MemberList.jsp";
			break;
			
		// 어드민 유저 목록 상세화면
		case "/userInfo.do":
			command = new UserInfoCommand();
			command.execute(request, response);
			viewPage = "UserInfo.jsp";
			break;
		
		// 어드민 유저 수정 화면	
		case "/AdminuserUpdate.do":
			command = new AdminUserSelectCommand();
			command.execute(request, response);
			viewPage = "AdminupdateUser.jsp";
			break;
			
		// 어드민 유저 수정 완료
		case "/AdminUpdateUserOk.do":
			command = new AdminUpdateUserCommand();
			command.execute(request, response);
			request.getRequestDispatcher("memList.do").forward(request, response);
			break;
			
		// 어드민 유저 삭제
		case "/AdminuserDelete.do":
			command = new AdminDeleteUserCommand();
			command.execute(request, response);
			viewPage = "AdminUserDeleteOk.jsp";
			break;
			
		case "/AdminHospitalList.do":
			command = new AdminHospitalListCommand();
			command.execute(request, response);
			viewPage = "AdminHospitalList.jsp";
			break;
			
		case "/AdminHospitalInfo.do":
			command = new AdminHospitalInfoCommand();
			command.execute(request, response);
			viewPage = "AdminHospitalInfo.jsp";
			break;
			
		case "/AdminHospitalUpdate.do":
			command = new AdminHospitalUpdateCommand();
			command.execute(request, response);
			viewPage = "AdminHospitalUpdate.jsp";
			break;
			
		case "/AdminHospitalUpdateOk.do":
			command = new AdminHospitalUpdateOkCommand();
			command.execute(request, response);
			request.getRequestDispatcher("AdminHospitalList.do").forward(request, response);
			break;
			
		// 메인화면
		case "/index.do":
			viewPage = "index.jsp";
			break;
		// 회원 가입
		case "/signup.do":
			viewPage = "signup.jsp";
			break;
		// 회원가입 완료
		case "/signOk.do":
			command = new SignupCommand();
			command.execute(request, response);
//			session.setAttribute("admin", request.getAttribute("admin"));
			viewPage = "signok.jsp";
			break;
		
			// 로그인
		case "/login.do":
			viewPage = "login.jsp";
			break;
	
			// 로그인 완료
		case "/loginOk.do":
			command = new LoginCommand();
			command.execute(request, response);
			session.setAttribute("admin", request.getAttribute("admin"));
			session.setAttribute("id", request.getAttribute("userid"));
			System.out.println("test1"+(String)request.getAttribute("userid"));
			viewPage = "loginOk.jsp";
			break;
			
		// 병원 검색
		case "/search.do":
			viewPage = "search.jsp";
			break;
	
			// 병원 검색 완료
		case "/searchOk.do":
//			session.setAttribute("subject", request.getAttribute("subject"));
//			session.setAttribute("location", request.getAttribute("location"));
//			session.setAttribute("hsname", request.getAttribute("hsname"));
			request.setAttribute("subject", session.getAttribute("subject"));
			request.setAttribute("location", session.getAttribute("location"));
			request.setAttribute("hsname", session.getAttribute("hsname"));
			request.setAttribute("searchWord", session.getAttribute("searchWord"));
			command = new SearchCommand();
			command.execute(request, response);
			viewPage = "searchOk.jsp";
			break;
			
		// 병원 검색
		case "/hosSearch.do":
			request.setAttribute("hosName", session.getAttribute("hosName"));
			command = new hosSearchCommand();
			command.execute(request, response);
			viewPage = "hosSearch.jsp";
			break;
			
		// 병원 검색 결과
		case "/searchResult.do":
			command = new ReviewCountCommand();
			command.execute(request, response);
			viewPage = "searchResult.jsp";
			break;
			
		// 병원 상세화면 리뷰 연결
		case "/hospitalReview.do":
			command = new hospitalReviewCommand();
			command.execute(request, response);
			viewPage = "hospitalReview.jsp";
			break;
		// 아이디 중복 확인
		case "/dbCheckId.do":
			command = new CheckIdCommand();
			command.execute(request, response);
			viewPage = "dbCheckId.jsp";
			break;
		// 메인페이지
		case "/main.do":
			viewPage = "main.jsp";
			break;
			
		// 회원정보수정
		case "/updateUser.do":
			command = new GetMemberCommand();
//			request.setAttribute("admin", session.getAttribute("admin"));
//			request.setAttribute("id", session.getAttribute("userid"));
			command.execute(request, response);
			viewPage = "updateUser.jsp";
			break;
			
		// 회원정보 수정완료
		case "/updateUserOk.do":
			command = new UpdateUserCommand();
			command.execute(request, response);
			viewPage = "main.jsp";
			break;
			
		// 회원탈퇴
		case "/deleteUser.do":
			viewPage = "deleteUser.jsp";
			break;
			
		// 회원 탈퇴 성공 여부 확인
		case "/deleteUserOk.do":
			command = new DeleteUserCommand();
			command.execute(request, response);
			viewPage = "deleteUserOk.jsp";
			break;
			
		// 회원 탈퇴 성공
		case "/deleteUserOk2.do":
			session.invalidate();
			viewPage = "deleteUserOk2.jsp";
			break;
			
		// 로그아웃
		case "/logout.do":
			session.invalidate();
			viewPage = "index.jsp";
			break;
			
			
		//contactUs 페이지 이동
	   case "/contactUs.do":
	         viewPage = "contactUs.jsp";
	         break;
	      
	     
		// 병원 검색값 유지
		case "/searchTest.do":
			command = new searchTestCommand();
			command.execute(request, response);
			session.setAttribute("searchWord", request.getAttribute("searchWord"));
//			response.sendRedirect("searchOk.do");
//			viewPage = "searchTest.jsp";
			session.setAttribute("subject", request.getAttribute("subject"));
			session.setAttribute("location", request.getAttribute("location"));
			session.setAttribute("hsname", request.getAttribute("hsname"));
			request.getRequestDispatcher("searchOk.do").forward(request, response);
			break;
			
		// 병원 검색값 유지
		case "/hosSearchStep.do":
			command = new hosSearchStepCommand();
			command.execute(request, response);
			session.setAttribute("hosName", request.getAttribute("hosName"));
			request.getRequestDispatcher("hosSearch.do").forward(request, response);
			break;
			
		// 리뷰 게시판 검색값 유지
		case "/searchReviewListStep.do":
			command = new searchListStepCommand();
			command.execute(request, response);
			session.setAttribute("keyword", request.getAttribute("keyword"));
			session.setAttribute("col", request.getAttribute("col"));
			request.getRequestDispatcher("searchReviewList.do").forward(request, response);
			break;
			
		// 리뷰 게시판 검색
		case "/searchReviewList.do":
			request.setAttribute("keyword", session.getAttribute("keyword"));
			request.setAttribute("col", session.getAttribute("col"));
			command = new reviewListSearchCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;
			
		// 관리자-병원목록 검색값 유지
		case "/searchAdminHsListStep.do":
			command = new SearchAdminHsStepCommand();
			command.execute(request, response);
			session.setAttribute("keyword", request.getAttribute("keyword"));
			session.setAttribute("col", request.getAttribute("col"));
			request.getRequestDispatcher("searchAdminHosList.do").forward(request, response);
			break;	
		
		// 관리자-병원목록 검색	
		case"/searchAdminHosList.do":
			request.setAttribute("keyword", session.getAttribute("keyword"));
			request.setAttribute("col", session.getAttribute("col"));
			command = new AdminHosSearchListCommand();
			command.execute(request, response);
			viewPage = "AdminHospitalList.jsp";
			break;

		}
		
		
		

		
		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/crap/" + viewPage);
			dispatcher.forward(request, response);
		}
	}

}
