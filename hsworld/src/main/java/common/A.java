package common;

public class A {

	public static final String driver = "oracle.jdbc.driver.OracleDriver";
	
	public static final String url = "jdbc:oracle:thin:@192.168.0.93:1521:orcl";
	
	public static final String user = "ora_user";
	
	public static final String pwd = "1234";

	// 받아올 값 : 이름 , id , pwd , ip , email , 본인확인 질문
	public static final String SQL_INSERT_USER = "insert into member values (?, ?, ?, ?, ?, 1)";
	
	public static final String SQL_LOGIN_USER = "select * from member where userid = ? and pwd = ?";
	
	public static final String SQL_CHECK_ID = "select * from member where userid = ?";
	
	public static final String SQL_SEARCH_HS = "SELECT * FROM (SELECT * FROM (SELECT ROWNUM row_num, HOSPITAL.* FROM HOSPITAL WHERE hssubject LIKE ? or hslocal LIKE ? or hsname LIKE ? ORDER BY hsgrade desc) WHERE row_num >= ?) WHERE row_num <= ?";
	
	public static final String SQL_SELECT_ID = "select userid from member where userid = ?";
	
	public static final String SQL_UPDATE_USER = "update member set pwd = ?, email = ?, phone = ? where userid = ?";
	
	public static final String SQL_DELETE_USER = "delete from member where userid = ? and pwd = ?";
	
	public static final String SQL_GET_USER = "select * from member where userid = ?";
	
	public static final String SQL_SELECT_BY_USER = "select name, userid, email, phone, admin from member where userid = ?";

	public static final String SQL_ADMIN_USER_UPDATE = "update member set userid = ?, name = ?, email = ?, phone = ?, admin = ? where userid = ?";
	
	public static final String SQL_HOS_COUNT = "select COUNT(*) as count from hospital where hssubject like ? or hslocal like ? or hsname like ?";
	
	public static final String SQL_ADMIN_HOS_COUNT = "select COUNT(*) as count from hospital";
	
	public static final String SQL_ADMIN_HOS_LIST = "select * from (select * from ( select ROWNUM row_num, hospital.* from hospital ) WHERE row_num >= ?) WHERE row_num <= ?";
	
	public static final String SQL_ADMIN_BY_HOSPITAL = "select hsname, hslocal, hsnum, hssubject from hospital where hsname = ?";
			
	public static final String SQL_ADMIN_HOS_UPDATE = "update hospital set hsname = ?, hslocal = ?, hsnum = ?, hssubject = ? where hslocal = ?";
	
	public static final String SQL_HOS_REVIEW = "SELECT COUNT(*) AS count FROM CRAP18 WHERE CR_HOS LIKE ?";
	
	public static final String SQL_HOS_REVIEW_LIST = "select * from (select * from ( select ROWNUM row_num, crap18.* from CRAP18 WHERE CR_HOS LIKE ? order by cr_uid desc) WHERE row_num >= ?) WHERE row_num <= ?";
	
	public static final String SQL_RHOS_COUNT = "select COUNT(*) as count from hospital where hsname like ?";
	
	public static final String SQL_RSEARCH_HS = "SELECT * FROM (SELECT * FROM (SELECT ROWNUM row_num, HOSPITAL.* FROM HOSPITAL WHERE hsname LIKE ? ORDER BY hsgrade desc) WHERE row_num >= ?) WHERE row_num <= ?"; 

	public static final String SQL_ADMIN_COUNT_SEARCH_HSNAME = "select COUNT(*) as count from HOSPITAL where hsname like ?";
	
	public static final String SQL_ADMIN_COUNT_SEARCH_HSLOCATION = "select COUNT(*) as count from HOSPITAL where hslocation like ?";
	
	public static final String SQL_ADMIN_SEARCH_HSNAME = "SELECT * FROM (SELECT * FROM (SELECT ROWNUM row_num, HOSPITAL.* FROM HOSPITAL WHERE hsname LIKE ? ORDER BY hsname desc) WHERE row_num >= ?) WHERE row_num <= ?";
	
	public static final String SQL_ADMIN_SEARCH_HSLOCAl = "SELECT * FROM (SELECT * FROM (SELECT ROWNUM row_num, HOSPITAL.* FROM HOSPITAL WHERE hslocal LIKE ? ORDER BY hsname desc) WHERE row_num >= ?) WHERE row_num <= ?"; 
	
	public static final String SQL_ADMIN_DELETE_USER = "delete from member where userid = ?";

	
	
}