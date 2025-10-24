package com.university.portal.servlet;

import com.university.portal.dao.CourseDAO;
import com.university.portal.model.Course;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CourseServlet", urlPatterns = {"/courses"})
public class CourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourseDAO dao = new CourseDAO();
        try {
            List<Course> courses = dao.findAll();
            request.setAttribute("courses", courses);
            request.getRequestDispatcher("/courses.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
