package com.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {

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
                    "SELECT * FROM student_enrollment WHERE seat_no=? AND full_name=? AND password=?");

            ps.setString(1, seat);
            ps.setString(2, name);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();

                session.setAttribute("seat", seat);
                session.setAttribute("name", name);

                response.sendRedirect("studentdashboard.jsp");

            } else {

                response.getWriter().println(
                        "<script>"
                      + "alert('Invalid Seat Number, Name or Password!');"
                      + "location='studentlogin.jsp';"
                      + "</script>");

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<script>"
                  + "alert('Database Error!');"
                  + "location='studentlogin.jsp';"
                  + "</script>");
        }
    }
}