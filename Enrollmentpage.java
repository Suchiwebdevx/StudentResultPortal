package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Enrollmentpage")
public class Enrollmentpage extends HttpServlet{

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException{

        String name=request.getParameter("name");
        String enrollment=request.getParameter("enrollment");
        String seat=request.getParameter("seat");
        String dob=request.getParameter("dob");
        String gender=request.getParameter("gender");
        String mobile=request.getParameter("mobile");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        String institute=request.getParameter("institute");
        String board=request.getParameter("board");
        String course=request.getParameter("course");
        String year=request.getParameter("year");
        String academic=request.getParameter("academic");
        String username=request.getParameter("username");
        String password=request.getParameter("password");

        try{

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con=DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/result_db",
            "root",
            "root");

            PreparedStatement ps=con.prepareStatement(
            "insert into student_enrollment(full_name,enrollment_no,seat_no,dob,gender,mobile,email,address,institute,board_university,course_class,year_semester,academic_year,username,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

            ps.setString(1,name);
            ps.setString(2,enrollment);
            ps.setString(3,seat);
            ps.setString(4,dob);
            ps.setString(5,gender);
            ps.setString(6,mobile);
            ps.setString(7,email);
            ps.setString(8,address);
            ps.setString(9,institute);
            ps.setString(10,board);
            ps.setString(11,course);
            ps.setString(12,year);
            ps.setString(13,academic);
            ps.setString(14,username);
            ps.setString(15,password);

            int i=ps.executeUpdate();
 
            
            if(i>0){
                   
            	    response.sendRedirect("studentdashboard.jsp");
                PrintWriter out = response.getWriter();
                out.println("<h1>Enrollment completed Successfully!</h1>");
                out.println("<a href='studentHome' class='btn'>Back to Home</a>");

                out.println("</div></body></html>");
            }else {
                response.getWriter().println("<h2>Enrollment Failed</h2>");
                response.getWriter().println("<a href='studentHome.jsp' class='btn'>Back to Home</a>") ;
            }

            con.close();

        }catch(Exception e){
      response.getWriter().println("Error: " + e.getMessage());

        }

    }

}