package mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.database.DBConnection;

/**
 * Servlet implementation class CheckServlet
 */
@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      String userId = request.getParameter("userId");
      response.getWriter().write(getJson(userId,request));
//      response.getWriter().write(idCheck(userId, request));
      
   }
   
   public String getJson(String userId, HttpServletRequest request) {
      if(userId == null) userId = "";
      int count = idCheck(userId, request);
      StringBuffer result = new StringBuffer();
      result.append("{\"result\":\"" + count + "\"}");      
      return result.toString();      
   }
   
   public int idCheck(String userId, HttpServletRequest request) {
            
      int isOkay = 0;
         
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "select count(*) from member where id=?";
      try{
         con = DBConnection.getConnection();
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, userId);
         rs = pstmt.executeQuery();
         
         if(rs.next()){
            isOkay = rs.getInt("count(*)");
            
            request.setAttribute("count", isOkay);
         }   
      }catch (Exception e){
         e.printStackTrace();
      }finally{
         try {
            if(rs!=null){
               rs.close();
            }
            if(pstmt!=null){
               pstmt.close();
            }
            if(con!=null){
               con.close();
            }
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return isOkay;
   }

}