package common;

public class D {

	public static final String driver = "oracle.jdbc.driver.OracleDriver";
	public static final String url = "jdbc:oracle:thin:@192.168.0.93:1521:orcl";
	public static final String user = "ora_user";
	public static final String pwd = "1234";

	public static final String sql = "INSERT INTO CRAP18(CR_UID, CR_TITLE, CR_CONTENT, CR_DATE, CR_USER) VALUES(CRAP.NEXTVAL, ?, ?, TO_CHAR(SYSDATE, 'yyyy-MM-dd hh:mm'), ?)";

	public static final String SQL_CRAP_SELECT = "select cr_uid, cr_title, cr_content ,cr_viewcnt, cr_date, cr_user from crap18 order by cr_uid desc";

	public static final String SQL_CRAP_SELECT_OLD = "select cr_uid, cr_title, cr_content ,cr_viewcnt, cr_date, cr_user from crap18 order by cr_uid";
	
	public static final String SQL_CRAP_SELECT_BEST = "select cr_uid, cr_title, cr_content ,cr_viewcnt, cr_date, cr_user from crap18 order by cr_viewcnt desc";
	
	public static final String SQL_NOTICE_SELECT = "select no, title, content, viewcnt, nt_date from board_notice order by no desc";
	
	public static final String SQL_CRAP_INSERT = "insert into crap18 (cr_uid, cr_title, cr_content, cr_date, cr_user, cr_hos) values (crap.nextval, ?, ?, sysdate, ?, ?)";
	
	public static final String SQL_NOTICE_INSERT = "insert into board_notice (no, title, content, nt_date) values (notice.nextval, ?, ?, to_date(sysdate, 'yyyy.mm.dd hh24:mi'))";
	
	public static final String SQL_NOTICE_INC_VIEWCNT = "update board_notice set viewcnt = viewcnt + 1 where no = ?";
	
	public static final String SQL_NOTICE_SELECT_BY_UID = "select no, title, content, viewcnt, nt_date from board_notice where no = ?";
	
	public static final String SQL_NOTICE_UPDATE = "update board_notice set title=?, content=? where no=?";
	
	public static final String SQL_NOTICE_DELETE = "delete from board_notice where no = ?";

	public static final String SQL_CRAP_SELECT_BY_UID = "select cr_uid, cr_title, cr_content, cr_viewcnt, cr_date, cr_user, CR_HOS  from crap18 where cr_uid = ?";
	
	public static final String SQL_SELECT_BY_USER = "select name, userid, email, phone, admin from member where userid = ?";
	
	public static final String SQL_CRAP_INC_VIEWCNT = "update crap18 set cr_viewcnt = cr_viewcnt + 1 where cr_uid = ?";
	
	public static final String SQL_CRAP_UPDATE = "update crap18 set CR_TITLE =?, CR_CONTENT = ? WHERE CR_UID = ?";
	
	public static final String SQL_CRAP_DELETE = "DELETE FROM CRAP18 WHERE CR_UID = ?";
	
	public static final String SQL_USER_LOGIN = "select * from ustable where userid = ? and userpw = ?";
	
	public static final String SQL_USER_JOIN = "insert into ustable values(?, ?, ?, ?)";
	
	public static final String SQL_GET_COUNT = "select count(*) from crap18";
	
	public static final String SQL_LIST_USER = "SELECT * FROM ( SELECT * FROM ( SELECT ROWNUM row_num, member.* FROM member) WHERE row_num >= ?) WHERE row_num <= ?";
	
	public static final String SQL_USER_COUNT = "SELECT COUNT(*) as count FROM MEMBER";
	
	public static final String SQL_NOTICE_COUNT = "select COUNT(*) as count from board_notice";

	public static final String SQL_NOTICE_LIST = "SELECT * FROM (SELECT ROWNUM N, b.*FROM (SELECT * FROM board_notice order by no desc) b)WHERE N BETWEEN ? AND ?";

	public static final String SQL_NOTICE_ALL_SELECT = "SELECT * FROM board_notice order by no desc";
	
	public static final String SQL_CRAP_COUNT = "select COUNT(*) as count from crap18";
	
	public static final String SQL_CRAP_LIST = "SELECT * FROM (SELECT ROWNUM N, b.*FROM (SELECT * FROM crap18 order by cr_uid desc) b)WHERE N BETWEEN ? AND ?";

	public static final String SQL_CRAP_LIST_OLD  = "SELECT * FROM (SELECT ROWNUM N, b.*FROM (SELECT * FROM crap18 order by cr_uid ) b)WHERE N BETWEEN ? AND ?";
	
	public static final String SQL_CRAP_LIST_BEST = "SELECT * FROM (SELECT ROWNUM N, b.*FROM (SELECT * FROM crap18 order by cr_viewcnt desc) b)WHERE N BETWEEN ? AND ?";
	
	public static final String SQL_CRAP_RECENT = "select NO, TITLE, CONTENT, VIEWCNT, NT_DATE from board_notice where ROWNUM < 4 order by no desc";
	
	public static final String SQL_CRAP_COUNT_TITLE = "select COUNT(*) as count from crap18 where cr_title like ?";
	
	public static final String SQL_CRAP_COUNT_USER = "select COUNT(*) as count from crap18 where cr_user like ?";
	
	public static final String SQL_CRAP_SEARCH_USER = "SELECT * FROM (SELECT * FROM (SELECT ROWNUM row_num, crap18.* FROM CRAP18 WHERE cr_user LIKE ? ORDER BY cr_uid desc) WHERE row_num >= ?) WHERE row_num <= ?";
	
	public static final String SQL_CRAP_SEARCH_TITLE = "SELECT * FROM (SELECT * FROM (SELECT ROWNUM row_num, crap18.* FROM CRAP18 WHERE cr_title LIKE ? ORDER BY cr_uid desc) WHERE row_num >= ?) WHERE row_num <= ?"; 

//	public static final String SQL_NOTICE_SEARCH_TITLE = "SELECT * FROM (SELECT * FROM (SELECT ROWNUM row_num, board_notice.* FROM board_notice WHERE title LIKE ? ORDER BY no desc) WHERE row_num >= ?) WHERE row_num <= ?";
//
//	public static final String SQL_NOTICE_SEARCH_CONTENT = "SELECT * FROM (SELECT * FROM (SELECT ROWNUM row_num, board_notice.* FROM board_notice WHERE content LIKE ? ORDER BY no desc) WHERE row_num >= ?) WHERE row_num <= ?";
//
//	public static final String SQL_NOTICE_COUNT_TITLE = "select COUNT(*) as count from board_notice where title like ?";
//	
//	public static final String SQL_NOTICE_COUNT_CONTENT = "select COUNT(*) as count from board_notice where content like ?";
//	
	
}