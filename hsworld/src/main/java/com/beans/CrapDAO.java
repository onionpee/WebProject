package com.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.A;
import common.D;



public class CrapDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public CrapDAO() {
		try {
			Class.forName(D.driver);
			conn = DriverManager.getConnection(D.url, D.user, D.pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
	
	public List<UserDTO> selectAllMember(Paging paging) throws SQLException {
		List<UserDTO> list = null;
		int startNum = paging.getStartNum();
		System.out.println("startNum : " +startNum);
		int endNum = paging.getEndNum();
		System.out.println("endNum : " + endNum);
		
		try {
			pstmt = conn.prepareStatement(D.SQL_LIST_USER);
			System.out.println(D.SQL_LIST_USER);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			list = getUser(rs);
		} finally {
			close();
		}
		return list;
	}
	
	public List<UserDTO> getUser(ResultSet rs) throws SQLException {
		List<UserDTO> list = new ArrayList<>();
		
		while (rs.next()) {
			String name = rs.getString("name");
			String userid = rs.getString("userid");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			int admin = rs.getInt("admin");
//			System.out.println("name :" + name);
			UserDTO dto = new UserDTO(name, userid, email, phone, admin);
			list.add(dto);
		}
		return list;
	}
	
//	public List<CrapDTO> getNoticeList(ResultSet rs) throws SQLException {
//		List<CrapDTO> list = new ArrayList<>();
//		
//		while (rs.next()) {
//			int uid = rs.getInt("NO");
//			String title = rs.getString("TITLE");
//			String content = rs.getString("CONTENT");
//			if (content == null) content = "";
//			int viewCnt = rs.getInt("VIEWCNT");
//			String date = rs.getString("NT_DATE");
////			System.out.println("name :" + name);
//			CrapDTO dto = new CrapDTO(uid, title, content, viewCnt, date);
//			list.add(dto);
//		}
//		return list;
//	}
	
	
	
	private List<CrapDTO> buildList(ResultSet rs)throws SQLException {
		List<CrapDTO> list = new ArrayList<>();
		
		
		while (rs.next()) {
			int uid = rs.getInt("cr_uid");
			String title = rs.getString("cr_title");
			String content = rs.getString("cr_content");
			if (content == null) content = "";
			int viewCnt = rs.getInt("cr_viewcnt");
			String date = rs.getString("CR_DATE");
			String user = rs.getString("CR_USER");
			String hsname = rs.getString("CR_HOS");
			
			CrapDTO dto = new CrapDTO(uid, title, content, hsname, viewCnt, date, user);
			list.add(dto);
		}
		return list;
	}
	
	   private List<CrapDTO> NoticeList(ResultSet rs) throws SQLException {
		      List<CrapDTO> list = new ArrayList<>();
		      
		      while (rs.next()) {
		         int uid = rs.getInt("NO");
		         String title = rs.getString("TITLE");
		         String content = rs.getString("CONTENT");
		         if (content == null) content = "";
		         int viewCnt = rs.getInt("VIEWCNT");
		         String date = rs.getString("NT_DATE");
		         
		         CrapDTO dto = new CrapDTO(uid, title, content, viewCnt, date);
		         list.add(dto);
		      }
		      
		      return list;
		   }
	
	   private List<CrapDTO> CrapList(ResultSet rs) throws SQLException {
		      List<CrapDTO> list = new ArrayList<>();
		      
		      while (rs.next()) {
		         int uid = rs.getInt("cr_uid");
		         String title = rs.getString("cr_title");
		         String content = rs.getString("cr_content");
		         if (content == null) content = "";
		         int viewCnt = rs.getInt("cr_viewcnt");
		         String date = rs.getString("CR_DATE");
		         String user = rs.getString("CR_USER");
		         
		         CrapDTO dto = new CrapDTO(uid, title, content, viewCnt, date, user);
		         list.add(dto);
		      }
		      
		      return list;
		   }
	
	private List<UserDTO> UserList(ResultSet rs) throws SQLException {
		List<UserDTO> list = new ArrayList<>();
		
		while (rs.next()) {
			String name = rs.getString("name");
			String userid = rs.getString("userid");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			int admin = rs.getInt("admin");
			
			UserDTO dto = new UserDTO(name, userid, email, phone, admin);
			list.add(dto);
		}
		return list;
	}
	
	public List<CrapDTO> select() throws SQLException{
		List<CrapDTO> list = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_CRAP_SELECT);
			rs = pstmt.executeQuery();
			list = buildList(rs);
		} finally {
			close();
		}
		return list;
	}
	
	
	public List<CrapDTO> selectOld() throws SQLException{
		List<CrapDTO> list = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_CRAP_SELECT_OLD);
			rs = pstmt.executeQuery();
			list = buildList(rs);
		} finally {
			close();
		}
		return list;
	}
	
	
	
	public List<CrapDTO> selectBest() throws SQLException{
		List<CrapDTO> list = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_CRAP_SELECT_BEST);
			rs = pstmt.executeQuery();
			list = buildList(rs);
		} finally {
			close();
		}
		return list;
	}
	

	public List<CrapDTO> NoticeSelect() throws SQLException {
		List<CrapDTO> list = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_NOTICE_SELECT);
			rs = pstmt.executeQuery();
			list = NoticeList(rs);
		} finally {
			close();
		}
		return list;
	}
	
	   public List<CrapDTO> selectAllNotice(Paging paging) throws SQLException {
		      List<CrapDTO> list = null;
		      int startNum = paging.getStartNum();
		      int endNum = paging.getEndNum();
		      
		      try {
		         pstmt = conn.prepareStatement(D.SQL_NOTICE_LIST);
		         pstmt.setInt(1, startNum);
		         pstmt.setInt(2, endNum);
		         rs = pstmt.executeQuery();
		         list = NoticeList(rs);
		      } finally {
		         close();
		      }
		      System.out.println("start Num : " + startNum);
		      System.out.println("end num : " + endNum);
		      return list;
		   }
	   
	   public List<CrapDTO> selectSearchReview(Paging paging, String h2, String keyword) throws SQLException {
		   
		   List<CrapDTO> list = null;
		   int startNum = paging.getStartNum();
		   int endNum = paging.getEndNum();
		   
		   try {
			   if (h2.equals("title")) {
				   pstmt = conn.prepareStatement(D.SQL_CRAP_SEARCH_TITLE);
				   pstmt.setString(1, "%"+keyword+"%");
				   pstmt.setInt(2, startNum);
				   pstmt.setInt(3, endNum);
				   rs = pstmt.executeQuery();
				   list = CrapList(rs);
			   } else if (h2.equals("name")) {
				   pstmt = conn.prepareStatement(D.SQL_CRAP_SEARCH_USER);
				   pstmt.setString(1, "%"+keyword+"%");
				   pstmt.setInt(2, startNum);
				   pstmt.setInt(3, endNum);
				   rs = pstmt.executeQuery();
				   list = CrapList(rs);
			   }
		   } finally {
		   }
		   
		   return list;
	   }
	   
	
	   public List<CrapDTO> selectAllReview(Paging paging) throws SQLException {
		      List<CrapDTO> list = null;
		      int startNum = paging.getStartNum();
		      int endNum = paging.getEndNum();
		      
		      try {
		         pstmt = conn.prepareStatement(D.SQL_CRAP_LIST);
		         pstmt.setInt(1, startNum);
		         pstmt.setInt(2, endNum);
		         rs = pstmt.executeQuery();
		         list = CrapList(rs);
		      } finally {
		    	  
		      }
		      System.out.println("start Num : " + startNum);
		      System.out.println("end num : " + endNum);
		      return list;
		   }
	   
	   public List<CrapDTO> selectRecentNotice() throws SQLException {
		   List<CrapDTO> list = null;
		   
		   try {
			   pstmt = conn.prepareStatement(D.SQL_CRAP_RECENT);
			   
			   rs = pstmt.executeQuery();
//			   System.out.println(rs);
			   list = NoticeList(rs);
		   } finally {
			   close();
		   }
		   System.out.println(list);
		   return list;
	   }
		   
	   public List<CrapDTO> selectAllReviewOld(Paging paging) throws SQLException {
		      List<CrapDTO> list = null;
		      int startNum = paging.getStartNum();
		      int endNum = paging.getEndNum();
		      
		      try {
		         pstmt = conn.prepareStatement(D.SQL_CRAP_LIST_OLD);
		         pstmt.setInt(1, startNum);
		         pstmt.setInt(2, endNum);
		         rs = pstmt.executeQuery();
		         list = CrapList(rs);
		      } finally {
		         close();
		      }
		      System.out.println("start Num : " + startNum);
		      System.out.println("end num : " + endNum);
		      return list;
		   }
	   
	   public List<CrapDTO> selectAllReviewBest(Paging paging) throws SQLException {
		      List<CrapDTO> list = null;
		      int startNum = paging.getStartNum();
		      int endNum = paging.getEndNum();
		      
		      try {
		         pstmt = conn.prepareStatement(D.SQL_CRAP_LIST_BEST);
		         pstmt.setInt(1, startNum);
		         pstmt.setInt(2, endNum);
		         rs = pstmt.executeQuery();
		         list = CrapList(rs);
		      } finally {
		         close();
		      }
		      System.out.println("start Num : " + startNum);
		      System.out.println("end num : " + endNum);
		      return list;
		   }
	

	public int insert(CrapDTO dto, String user)throws SQLException {
	      int cnt = 0;
	      String title = dto.getCR_TITLE();
	      String content = dto.getCR_CONTENT();
	      String hosName = dto.getCR_HOSNAME();

	      int uid;
	      String[] generatedCols = {"CR_UID"};
	      
	      try {
	         pstmt = conn.prepareStatement(D.SQL_CRAP_INSERT, generatedCols);
	         pstmt.setString(1, title);
	         pstmt.setString(2, content);
	         pstmt.setString(3, user);
	         pstmt.setString(4, hosName);
	         
	         cnt = pstmt.executeUpdate();
	         
	         if (cnt > 0) {
	            rs = pstmt.getGeneratedKeys();
	            if (rs.next()) {
	               uid = rs.getInt(1);
	               dto.setCR_UIT(uid);
	            }
	         }
	      } finally {
	         close();
	      }
	      return cnt;
	      
	   }
	
	public int NoticeInsert(CrapDTO dto) throws SQLException {
		int cnt = 0;
		
		String title = dto.getNT_TITLE();
		String content = dto.getNT_CONTENT();
		int uid;
		
		String[] generatedCols = {"no"};
		try {
			pstmt = conn.prepareStatement(D.SQL_NOTICE_INSERT, generatedCols);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			cnt = pstmt.executeUpdate();
			
			if (cnt > 0) {
				rs = pstmt.getGeneratedKeys();
				if (rs.next()) {
					uid = rs.getInt(1);
					dto.setNT_UID(uid);
				}
			}
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public List<UserDTO> readByUser(String id) throws SQLException {
		List<UserDTO> list = null;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(D.SQL_SELECT_BY_USER);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			list = UserList(rs);
			
			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public List<CrapDTO> readByNotice(int uid) throws SQLException {
		List<CrapDTO> list = null;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(D.SQL_NOTICE_INC_VIEWCNT);
			pstmt.setInt(1, uid);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(D.SQL_NOTICE_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			list = NoticeList(rs);
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	
	public List<CrapDTO> readByUid(int uid) throws SQLException {
		List<CrapDTO> list = null;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(D.SQL_CRAP_INC_VIEWCNT);
			pstmt.setInt(1, uid);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(D.SQL_CRAP_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			list = buildList(rs);
			
			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
			throw e;
		} finally {
			close();
		}
		
		return list;
	}
	
	public List<CrapDTO> selectByUid(int uid) throws SQLException {
		List<CrapDTO> list = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_CRAP_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			list = buildList(rs);
		} finally {
			close();
		}
		
		return list;
	}
	
	public List<CrapDTO> NoticeSelectByUid(int uid) throws SQLException {
		List<CrapDTO> list = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_NOTICE_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			list = NoticeList(rs);
		} finally {
			close();
		}
		
		return list;
	}
	
	public int update(int uid, String title, String summary) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_CRAP_UPDATE);
			pstmt.setString(1, title);
			pstmt.setString(2, summary);
			pstmt.setInt(3, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
			
		return cnt;
	}
	
	public int NoticeUpdate(int uid, String title, String summary) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_NOTICE_UPDATE);
			pstmt.setString(1,  title);
			pstmt.setString(2, summary);
			pstmt.setInt(3, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public int delete(int uid) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_CRAP_DELETE);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int NoticeDelete(int uid) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_NOTICE_DELETE);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	public int login(String userid, String userpw) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_USER_LOGIN);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}

	public int getAllCount() throws SQLException {
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_USER_COUNT);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			close();
		}
		return count;
	}
	public int getNoticeCount() throws SQLException {
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_NOTICE_COUNT);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public int getReviewCount() throws SQLException {
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_CRAP_COUNT);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public int getReviewCount2(String col, String keyword) throws SQLException {
		int count = 0;
		
		try {
			if (col.equals("title")) {
				pstmt = conn.prepareStatement(D.SQL_CRAP_COUNT_TITLE);
				pstmt.setString(1, keyword);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					count = rs.getInt("count");
				}
			} else if (col.equals("name")) {
				pstmt = conn.prepareStatement(D.SQL_CRAP_COUNT_USER);
				pstmt.setString(1, keyword);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					count = rs.getInt("count");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	

	
}
