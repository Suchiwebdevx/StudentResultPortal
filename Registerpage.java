package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterPage")
public class Registerpage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        resp.setContentType("text/html");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String name =(req.getParameter("studentName"));
            long seat = Long.parseLong(req.getParameter("seatNumber"));
            int eng = Integer.parseInt(req.getParameter("english"));
            int math = Integer.parseInt(req.getParameter("maths"));
            int sci = Integer.parseInt(req.getParameter("science"));
            int his = Integer.parseInt(req.getParameter("history"));
            int comp = Integer.parseInt(req.getParameter("computer"));
            String Sports=(req.getParameter("sports"));
            String Grade=(req.getParameter("sports_grade"));

            Connection con = DriverManager.getConnection(
            		"jdbc:mysql://localhost:3306/result_db?useSSL=false&serverTimezone=UTC",
                    "root",
                    "root"
                );

            PreparedStatement ps = con.prepareStatement(
            	    "INSERT INTO result1 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
            	);

            	ps.setLong(1, seat);
            	ps.setString(2, name);
            	ps.setInt(3, eng);
            	ps.setInt(4, math);
            	ps.setInt(5, sci);
            	ps.setInt(6, his);
            	ps.setInt(7, comp);
            	ps.setString(8, Sports);
            	ps.setString(9,Grade);
            	
             ps.executeUpdate();

                PrintWriter out = resp.getWriter();
                out.println("<html><head>");
                out.println("<link rel='stylesheet' href='css/style.css'>");
                out.println("</head><body>");
                out.println("<div class='container'>");

                out.println("<h1>Result Added Successfully!</h1>");
                out.println("<a href='admindashboard.jsp' class='btn'>Back to Home</a>");

                out.println("</div></body></html>");


            } catch(Exception e) {
                e.printStackTrace();
                resp.getWriter().println("Error: " + e.getMessage());
            }
        }
    }