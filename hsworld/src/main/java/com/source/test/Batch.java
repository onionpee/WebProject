//package com.source.test;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.sql.Statement;
//
//import org.junit.jupiter.api.Test;
//
//class Batch {
//	
//	Connection conn = null;
//	Statement stmt = null;
//	PreparedStatement pstmt = null;
//	int cnt = 0;
//	
//	public static final String driver = "oracle.jdbc.driver.OracleDriver";
//	public static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
//	public static final String user = "ora_user";
//	public static final String pwd = "1234";
//	
//	public static final String sql = "insert into crap18(cr_uid, cr_title, cr_content, cr_date) values (crap.nextval, ?, ?, to_date(sysdate, 'yyyy-mm-dd hh:mi'))";
//	
//	@Test
//	void genDate() {
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, user, pwd);
//			pstmt = conn.prepareStatement(sql);
//			
//			int num = 10;
//			for (int i=0; i<num; i++) {
//				pstmt.setString(1, String.format("제목%03d", i));
//				pstmt.setString(2, String.format("요약%03d", i));
//				cnt += pstmt.executeUpdate();
//			}
//			System.out.println(cnt + "개의 데이터 insert");
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (stmt != null) stmt.close();
//				if (pstmt != null) pstmt.close();
//				if (conn != null) conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//
//}
