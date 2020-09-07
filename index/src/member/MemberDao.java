package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MemberDao {

	private Connection conn;
	
	public MemberDao(Connection conn) {
		this.conn = conn;
	}
	
	public String searchId(String Name,String Securitynumber,String Securitynumber1) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement(
				"select id from human " +
				"where name = ? and securitynumber = ? and securitynumber1 = ? ");
			pstmt.setString(1, Name);
			pstmt.setString(2, Securitynumber);
			pstmt.setString(3, Securitynumber1);
			
			rs = pstmt.executeQuery();
			
				if(rs.next())
					return (rs.getString("id"));
				else
					return null;
			}finally {
				if(rs!=null) try{
					rs.close();
				}catch(SQLException ex) {
					
				}
		}
	}
	public String searchPwd(String Id,String Name,String Securitynumber,String Securitynumber1) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
					"select password from human " +
					"where id = ? and name = ? and securitynumber = ? and securitynumber1 =?"
					);
			pstmt.setString(1, Id);
			pstmt.setString(2, Name);
			pstmt.setString(3, Securitynumber);
			pstmt.setString(4, Securitynumber1);
			rs= pstmt.executeQuery();
			if(rs.next())
				return (rs.getString("password"));
			else
				return null;
		}finally {
			if(rs!=null)
				try {
					rs.close();
				}catch(SQLException ex) {}
			if(pstmt != null) try {
				pstmt.close();
			}catch(SQLException ex) {}
		}
	}
	
	
}
