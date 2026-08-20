package com.main;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("adminCode");
        String correctCode = "ADMIN3013"; 
        
        PrintWriter out = response.getWriter();
        out.println("<a href='index.jsp' class='btn'>Back to Home</a>");

        out.println("</div></body></html>");

        
        if(correctCode.equals(code)) {
            response.sendRedirect("admindashboard.jsp");  
        }else {
            request.setAttribute("error", "Wrong Admin Code!");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
    }
}