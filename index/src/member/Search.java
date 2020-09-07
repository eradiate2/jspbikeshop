package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Search {

	private static Search instance = new Search();
	
	
	public static Search getInstance() {
		return instance;
	}
	
	
	public Search() {
		
	}
	public String searchId(String Name, String Securitynumber,String Securitynumber1) throws Exception {

		Connection conn = null;

		        Class.forName("com.mysql.jdbc.Driver");

		try {

		            String jdbcDriver = "jdbc:mysql://localhost:3306/company?" +

		"useUnicode=true&characterEncoding=euckr";

		            String dbUser = "root";

		            String dbPass = "1234";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

		            //DAO 객체를 생성 시 Connection 전달 

		MemberDao SearchDao = new MemberDao(conn);

		            String userId = SearchDao.searchId(Name,Securitynumber,Securitynumber1);

		        //    System.out.println(name);

		return (userId);

		} 

		finally {

		if (conn != null) try { conn.close(); } catch(SQLException ex) {};

		}

		}

		public String  searchPwd(String Id,String Name,String Securitynumber,String Securitynumber1) throws Exception {

		Connection conn = null;

		        Class.forName("com.mysql.jdbc.Driver");

		try {

		            String jdbcDriver = "jdbc:mysql://localhost:3306/company?" +

		"useUnicode=true&characterEncoding=euckr";

		            String dbUser = "root";

		            String dbPass = "1234";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

		            //DAO 객체를 생성 시 Connection 전달 

		MemberDao SearchDao = new MemberDao(conn);

		            String userPwd = SearchDao.searchPwd(Id,Name,Securitynumber,Securitynumber1);

		        //    System.out.println(name);

		return (userPwd);

		} 

		finally {

		if (conn != null) try { conn.close(); } catch(SQLException ex) {};

		}

		}



}
