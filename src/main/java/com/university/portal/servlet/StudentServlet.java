package com.university.portal.servlet;

import com.university.portal.dao.CourseDAO;
import com.university.portal.dao.StudentDAO;
import com.university.portal.model.Course;
import com.university.portal.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"/student"})
public class StudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/studentSchedule.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("studentId");
        if (idStr == null || !idStr.matches("\\d+")) {
            request.setAttribute("message", "Please enter a valid numeric student ID.");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }
        int id = Integer.parseInt(idStr);
        StudentDAO sdao = new StudentDAO();
        CourseDAO cdao = new CourseDAO();
        try {
            Student s = sdao.findById(id);
            if (s == null) {
                request.setAttribute("message", "No student found with ID " + id);
                request.getRequestDispatcher("/message.jsp").forward(request, response);
                return;
            }
            List<Course> schedule = cdao.findByStudentId(id);
            request.setAttribute("student", s);
            request.setAttribute("schedule", schedule);
            request.getRequestDispatcher("/studentSchedule.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
