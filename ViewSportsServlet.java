package com.main;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/ViewSportsServlet")
public class ViewSportsServlet extends HttpServlet{

protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{

    String seat=request.getParameter("seat");
    response.setContentType("text/html");
    PrintWriter out=response.getWriter();

   try{

      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/result_db","root","root");

      PreparedStatement ps=con.prepareStatement("select * from sports_record where seat_no=?");

      ps.setString(1,seat);

      ResultSet rs=ps.executeQuery();

      if(rs.next()){

     out.println("<h2>Sports Record</h2>");
     out.println("<table border='1' cellpadding='10'>");
     out.println("<tr><td>Name</td><td>"+rs.getString("student_name")+"</td></tr>");
     out.println("<tr><td>Sport</td><td>"+rs.getString("sport_name")+"</td></tr>");
     out.println("<tr><td>Score</td><td>"+rs.getInt("score")+"</td></tr>");
     out.println("<tr><td>Grade</td><td>"+rs.getString("grade")+"</td></tr>");
     out.println("</table>");

     if(rs.getString("grade").equals("A")){
     out.println("<br><a href='Certificate.jsp?seat="+seat+"'>Download Certificate</a>");
      }
        }else{
           out.println("<h3>No Record Found</h3>");
     } 
      con.close();

   }catch(Exception e){
     out.println(e);

       }
   }
}