package com.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Request;

import common.A;
import common.D;

public class UserDAO {
	
	Connection conn = null;
	
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	
	
	
	public UserDAO() {
		try {
			Class.forName(A.driver);
			conn = DriverManager.getConnection(A.url, A.user, A.pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
	
	public int insert(UserDTO dto) throws SQLException {
		int cnt = 0;
		
		String userid = dto.getUser_id();
		String userpw = dto.getUser_pw();
		String username = dto.getUser_name();
		String usermail = dto.getUser_mail();
		String userNum = dto.getUser_Num();
		
		try {
			pstmt = conn.prepareStatement(A.SQL_INSERT_USER);
			pstmt.setString(1, username);
			pstmt.setString(2, userid);
			pstmt.setString(3, userpw);
			pstmt.setString(4, usermail);
			pstmt.setString(5, userNum);
			cnt = pstmt.executeUpdate();
			
//			if (cnt>0) {
//				rs = pstmt.getGeneratedKeys();
//				
			} catch (Exception e) {
				e.printStackTrace();
				cnt = 0;
		} finally {
			close();
		}
		System.out.println(cnt);
		return cnt;
	}

	public List<UserDTO> readByHospital(String hsname) throws SQLException {
		List<UserDTO> list = null;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(A.SQL_ADMIN_BY_HOSPITAL);
			pstmt.setString(1, hsname);
			rs = pstmt.executeQuery();
			list = HospitalList(rs);
			
			conn.commit();
			} catch (SQLException e) {
				conn.rollback();
				e.printStackTrace();
			} finally {
				close();
			}
		
		return list;
	}
	
	private List<UserDTO> HospitalList(ResultSet rs) throws SQLException {
		List<UserDTO> list = new ArrayList<>();
		
		while (rs.next()) {
			String hsname = rs.getString("hsname");
			String hslocal = rs.getString("hslocal");
			String hsnum = rs.getString("hsnum");
			String subject = rs.getString("hssubject");
			
			UserDTO dto = new UserDTO(hsname, hslocal, hsnum, subject);
			list.add(dto);
		}
		
		return list;
	}
	
	public int login(UserDTO dto) throws SQLException {
		int cnt = 0;
		String userid = dto.getUser_id();
		String userpw = dto.getUser_pw();
		
		try {
			pstmt = conn.prepareStatement(A.SQL_LOGIN_USER);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			
			rs = pstmt.executeQuery();
			String checkId = null;
			String checkPw = null;
			
			if (rs.next()) {
				checkId = rs.getString("userid");
				checkPw = rs.getString("pwd");
				String name = rs.getString("name");
				int admin = rs.getInt("admin");
				dto.setAdmin(admin);
				if (userid.equals(checkId) && userpw.equals(checkPw)) {
					cnt = 1;
				} else {
					cnt = 0;
				}
			} 
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		
		System.out.println(cnt);
		return cnt;
	}
	
//	public int search(UserDTO dto) throws SQLException {
//		int cnt = 0;
//		
//		String subject = dto.getSubject();
//		String location = dto.getLocation();
//		String hsname = dto.getHsname();
//		
//		try {
//			pstmt = conn.prepareStatement(A.SQL_SEARCH_HS);
//			pstmt.setString(1, "%"+subject+"%");
//			pstmt.setString(2, "%"+location+"%");
//			pstmt.setString(3, "%"+hsname+"%");
//			
//			rs = pstmt.executeQuery();
//			
//			ArrayList<String> hostpitalList = new ArrayList<String>();
//			ArrayList<String> hostpitalLocal = new ArrayList<String>();
//			ArrayList<String> hostpitalNum = new ArrayList<String>();
//			
//			while (rs.next()) {
//				String hsArr = rs.getString("HSNAME");
//				hostpitalList.add(hsArr);
//				String hsLoc = rs.getNString("HSLOCAL");
//				hostpitalLocal.add(hsLoc);
//				String hsNum = rs.getString("HSNUM");
//				hostpitalNum.add(hsNum);
//			}
//			
//			if (hostpitalList.isEmpty()) {
//				
//			} else {
//				
//			}
//			
//		}
//	};
	
	public List<UserDTO> search(Paging paging, String searchWord ) throws SQLException {
		List<UserDTO> list = null;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		
//		System.out.println(subject + location + hsname);
		try {
			pstmt = conn.prepareStatement(A.SQL_SEARCH_HS);
			pstmt.setString(1, "%"+searchWord+"%");
			pstmt.setString(2, "%"+searchWord+"%");
			pstmt.setString(3, "%"+searchWord+"%");
			pstmt.setInt(4, startNum);
			pstmt.setInt(5, endNum);
			rs = pstmt.executeQuery();
			list = searchList(rs);
		} finally {
			close();
		}
		return list;
	}
	
	public List<UserDTO> hosSearch(Paging paging, String hos) throws SQLException {
		List<UserDTO> list = null;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		try {
			pstmt = conn.prepareStatement(A.SQL_RSEARCH_HS);
			pstmt.setString(1, "%"+hos+"%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			rs = pstmt.executeQuery();
			list = searchList(rs);
		} finally {
			close();
		}
		return list;
	}
	
	public List<CrapDTO> hospitalReview(Paging paging, String hosname) throws SQLException {
		List<CrapDTO> list = null;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		try {
			pstmt = conn.prepareStatement(A.SQL_HOS_REVIEW_LIST);
			pstmt.setString(1, "%"+hosname+"%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			rs = pstmt.executeQuery();
			list = ReviewList(rs);
		} finally {
			close();
		}
		
		return list;
	}
	
	
	
	public int getHosCount(String searchWord) throws SQLException {
		int count = 0;
//		String searchWord = dto.getSubject();
		
		try {
			pstmt = conn.prepareStatement(A.SQL_HOS_COUNT);
			pstmt.setString(1, "%"+searchWord+"%");
			pstmt.setString(2, "%"+searchWord+"%");
			pstmt.setString(3, "%"+searchWord+"%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getRhosCount(String hos) throws SQLException {
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_RHOS_COUNT);
			pstmt.setString(1, "%"+hos+"%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	private List<UserDTO> searchList(ResultSet rs) throws SQLException {
		List<UserDTO> list = new ArrayList<>();
		
		while (rs.next()) {
			String hsname = rs.getString("hsname");
			String hslocation = rs.getString("hslocal");
			String hsnum = rs.getString("hsnum");
			String subject = rs.getString("HSSUBJECT");
//			System.out.println(subject);
			
			UserDTO dto = new UserDTO(subject, hslocation, hsname, hsnum);
			list.add(dto);
		}
		return list;
	}
	
	private List<CrapDTO> ReviewList(ResultSet rs) throws SQLException {
		List<CrapDTO> list = new ArrayList<>();
		
		while (rs.next()) {
			int uid = rs.getInt("cr_uid");
			String title = rs.getString("cr_title");
			String content = rs.getString("cr_content");
			if (content == null) content = "";
			int viewcnt = rs.getInt("cr_viewcnt");
			String date = rs.getString("CR_DATE");
			String user = rs.getString("CR_USER");
			
			CrapDTO dto = new CrapDTO(uid, title, content, viewcnt, date, user);
			list.add(dto);
		}
		
		return list;
	}
	
	public int getHospitalCount() throws SQLException {
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_ADMIN_HOS_COUNT);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public List<UserDTO> selectAllHospital(Paging paging) throws SQLException {
		List<UserDTO> list = null;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		try {
			pstmt = conn.prepareStatement(A.SQL_ADMIN_HOS_LIST);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			list = getHospital(rs);
		} finally {
			close();
		}
		System.out.println("start Num : " + startNum);
		System.out.println("end num : " + endNum);
		return list;
	}
	
	public List<UserDTO> getHospital(ResultSet rs) throws SQLException {
		List<UserDTO> list = new ArrayList<>();
		
		while (rs.next()) {
			String subject = rs.getString("HSSUBJECT");
			String hsname = rs.getString("hsname");
			String hslocation = rs.getString("hslocal");
			String hsnum = rs.getString("hsnum");
			System.out.println(subject + "+" + hsname + "+" + hslocation + "+" + hsnum);
			
			UserDTO dto = new UserDTO(subject, hsname, hslocation, hsnum);

			list.add(dto);
		}
		return list;
	}
	
	public int hospitalCount(String hos) throws SQLException {
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_HOS_REVIEW);
			pstmt.setString(1, "%"+hos+"%");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return result;
	}
	
	public int seleltAllId(String id) throws SQLException {
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_SELECT_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int updateUser(UserDTO dto) throws SQLException {
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_UPDATE_USER);
			pstmt.setString(1, dto.getUser_pw());
			pstmt.setString(2, dto.getUser_mail());
			pstmt.setString(3, dto.getUser_Num());
			pstmt.setString(4, dto.getUser_id());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
		}catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		System.out.println(result);
		return result;
	}
	
	public int deleteUser(UserDTO dto) throws SQLException {
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_DELETE_USER);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pw());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(A.SQL_DELETE_USER);
		System.out.println(dto.getUser_id());
		System.out.println(result);
		return result;
	}
	
	public UserDTO getUser(String userid) throws SQLException {
		int result = -1;
		UserDTO dto = null;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_GET_USER);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new UserDTO();
				
				String name = rs.getString("name");
				System.out.println(name);
				dto.setUser_name(name);
				dto.setUser_id(rs.getString("userid"));
				dto.setUser_mail(rs.getString("email"));
				dto.setUser_Num(rs.getString("phone"));
				
			} else {
				result = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(dto);
		return dto;
	}
	
	public List<UserDTO> selectByUser(String id) throws SQLException {
		List<UserDTO> list = null;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_SELECT_BY_USER);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			list = UserList(rs);
		} finally {
			close();
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

	public int AdminupdateUser(String id, String name, String email, String phone, int admin) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_ADMIN_USER_UPDATE);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, phone);
			pstmt.setInt(5, admin);
			pstmt.setString(6, id);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		System.out.println(cnt);
		return cnt;
	}
	
	public int AdminUpdateHospital(String name, String location, String number, String subject) throws SQLException {
		int cnt =0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_ADMIN_HOS_UPDATE);
			pstmt.setString(1, name);
			pstmt.setString(2, location);
			pstmt.setString(3, number);
			pstmt.setString(4, subject);
			pstmt.setString(5, location);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public int AdmindeleteUser(UserDTO dto) throws SQLException {
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_ADMIN_DELETE_USER);
			pstmt.setString(1, dto.getUser_id());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(A.SQL_ADMIN_DELETE_USER);
		System.out.println(dto.getUser_id());
		System.out.println(result);
		return result;
	}
	
	public int getAdminHosCount(String col, String keyword) throws SQLException {
		int count = 0;
		
		try {
			if (col.equals("hsname")) {
				pstmt = conn.prepareStatement(A.SQL_ADMIN_COUNT_SEARCH_HSNAME);
				pstmt.setString(1, keyword);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					count = rs.getInt("count");
				}
			} else if (col.equals("hslocation")) {
				pstmt = conn.prepareStatement(A.SQL_ADMIN_COUNT_SEARCH_HSLOCATION);
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
	   private List<UserDTO> AdminHosList(ResultSet rs) throws SQLException {
		      List<UserDTO> list = new ArrayList<>();
		      
		      while (rs.next()) {
					String subject = rs.getString("HSSUBJECT");
					String hsname = rs.getString("hsname");
					String hslocation = rs.getString("hslocal");
					String hsnum = rs.getString("hsnum");
					System.out.println(subject + "+" + hsname + "+" + hslocation + "+" + hsnum);
					
					UserDTO dto = new UserDTO(subject, hsname, hslocation, hsnum);

					list.add(dto);
				}
				return list;
		      
		   }
	
	   public List<UserDTO> selectSearchAdminHos(Paging paging, String h2, String keyword) throws SQLException {
		   
		   List<UserDTO> list = null;
		   int startNum = paging.getStartNum();
		   int endNum = paging.getEndNum();
		   
		   try {
			   if (h2.equals("hsname")) {
				   pstmt = conn.prepareStatement(A.SQL_ADMIN_SEARCH_HSNAME);
				   pstmt.setString(1, "%"+keyword+"%");
				   pstmt.setInt(2, startNum);
				   pstmt.setInt(3, endNum);
				   rs = pstmt.executeQuery();
				   list = AdminHosList(rs);
			   } else if (h2.equals("hslocal")) {
				   pstmt = conn.prepareStatement(A.SQL_ADMIN_SEARCH_HSLOCAl);
				   pstmt.setString(1, "%"+keyword+"%");
				   pstmt.setInt(2, startNum);
				   pstmt.setInt(3, endNum);
				   rs = pstmt.executeQuery();
				   list = AdminHosList(rs);
			   }
		   } finally {
		   }
		   
		   return list;
	   }

}
