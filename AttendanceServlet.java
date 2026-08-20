package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws IOException {

    long seat = Long.parseLong(req.getParameter("seat"));
    String name = req.getParameter("name");
    String subject = req.getParameter("subject");
    int total = Integer.parseInt(req.getParameter("total"));
    int present = Integer.parseInt(req.getParameter("present"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/result_db",
            "root",
            "root"
        );

        PreparedStatement ps = con.prepareStatement(
        "INSERT INTO subject_attendance VALUES(?,?,?,?,?) " +
        "ON DUPLICATE KEY UPDATE total_classes=?, present_classes=?"
        );

        ps.setLong(1, seat);
        ps.setString(2, name);
        ps.setString(3, subject);
        ps.setInt(4, total);
        ps.setInt(5, present);
        ps.setInt(6, total);
        ps.setInt(7, present);

        ps.executeUpdate();

        res.getWriter().println("<h1>Attendance Saved Successfully!!<h1>");
        PrintWriter out = res.getWriter();
        out.println("<a href='subjectAttendance.jsp' class='btn'>Back to Home</a>");

        out.println("</div></body></html>");


    } catch(Exception e) {
        res.getWriter().println(e);
    }
}
}