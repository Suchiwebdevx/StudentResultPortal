package com.main;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/SportsEntryServlet")
public class SportsEntryServlet extends HttpServlet{

     protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{

      String seat=request.getParameter("seat");
      String name=request.getParameter("name");
      String sport=request.getParameter("sport");
      int score=Integer.parseInt(request.getParameter("score"));
    		  
    		  String grade;
          if(score>=90)
          grade="A";
          else if(score>=80)
          grade="B";
          else if(score>=70)
          grade="C";
          else if(score>=60)
          grade="D";
          else
          grade="F";

        try{

          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/result_db","root","root");

           PreparedStatement ps=con.prepareStatement("insert into sports_record(seat_no,student_name,sport_name,score,grade) values(?,?,?,?,?)");
           ps.setString(1,seat);
           ps.setString(2,name);
           ps.setString(3,sport);
           ps.setInt(4,score);
           ps.setString(5,grade);

           ps.executeUpdate();
           
           PrintWriter out = response.getWriter();
           out.println("<html><head>");
           out.println("<link rel='stylesheet' href='css/style.css'>");
           out.println("</head><body>");
           out.println("<div class='container'>");

           out.println("<h1>Data added Successfully!</h1>");
           out.println("<a href='admindashboard.jsp' class='btn'>Back to Home</a>");

           out.println("</div></body></html>");

           con.close();

        }
         catch(Exception e){
         response.getWriter().println(e);
        }
     }

   }