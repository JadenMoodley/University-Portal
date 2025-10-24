package com.university.portal.servlet;

import com.university.portal.dao.CourseDAO;
import com.university.portal.model.Course;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "FacultyServlet", urlPatterns = {"/faculty"})
public class FacultyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/facultyForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseCode = request.getParameter("courseCode");
        String instructor = request.getParameter("instructor");
        String schedule = request.getParameter("schedule");

        if (courseCode == null || instructor == null || schedule == null ||
            courseCode.isBlank() || instructor.isBlank() || schedule.isBlank()) {
            request.setAttribute("message", "All fields are required.");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }

        CourseDAO dao = new CourseDAO();
        try {
            Course c = dao.findByCode(courseCode);
            if (c == null) {
                request.setAttribute("message", "No course found with code " + courseCode);
                request.getRequestDispatcher("/message.jsp").forward(request, response);
                return;
            }
            boolean ok = dao.updateCourse(c.getCourseId(), instructor.trim(), schedule.trim());
            request.setAttribute("message", ok ? "Course updated successfully." : "No update performed.");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
