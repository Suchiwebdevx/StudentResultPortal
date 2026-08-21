package com.main;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/result")
public class Resultpage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            long seat = Long.parseLong(req.getParameter("seatNumber"));
            String name= req.getParameter("studentName");
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/result_db",
                "root",
                "root"
            );

            PreparedStatement ps = con.prepareStatement("select * from result1 where seatNumber=? and studentName=?");

                ps.setLong(1, seat);
                ps.setString(2, name);

                ResultSet rs = ps.executeQuery();

                if(rs.next()) {

                    int eng = rs.getInt("english");
                    int math = rs.getInt("maths");
                    int sci = rs.getInt("science");
                    int his = rs.getInt("history");
                    int comp = rs.getInt("computer");

                    int total = eng + math + sci + his + comp;
                    double percentage = total / 5.0;

                    req.setAttribute("studentName", name);
                    req.setAttribute("english", eng);
                    req.setAttribute("maths", math);
                    req.setAttribute("science", sci);
                    req.setAttribute("history", his);
                    req.setAttribute("computer", comp);
                    req.setAttribute("total", total);
                    req.setAttribute("percentage", percentage);
                    req.getRequestDispatcher("resultshow.jsp").forward(req, resp);
                } else {
                    resp.getWriter().println("Result Not Found!");
                }
                
            } catch(Exception e) {
                e.printStackTrace();
                resp.setContentType("text/html");
                resp.getWriter().println("Error: " + e.getMessage());
            }
    }
}

