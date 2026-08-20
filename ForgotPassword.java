package com.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String seat = request.getParameter("seat");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/result_db",
                    "root",
                    "root");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE student_enrollment SET password=? WHERE seat_no=? AND full_name=?");

            ps.setString(1, password);
            ps.setString(2, seat);
            ps.setString(3, name);

            int i = ps.executeUpdate();

            if(i > 0){

                response.getWriter().println(
                    "<script>"
                  + "alert('Password Updated Successfully');"
                  + "location='studentlogin.jsp';"
                  + "</script>");

            }else{

                response.getWriter().println(
                    "<script>"
                  + "alert('Student Not Found');"
                  + "location='forgotPassword.jsp';"
                  + "</script>");
            }

            ps.close();
            con.close();

        } catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(
                "<script>"
              + "alert('Database Error');"
              + "location='forgotPassword.jsp';"
              + "</script>");
        }
    }
}