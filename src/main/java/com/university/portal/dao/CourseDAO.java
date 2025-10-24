package com.university.portal.dao;

import com.university.portal.model.Course;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

    public List<Course> findAll() throws SQLException {
        String sql = "SELECT course_id, course_code, course_name, instructor, schedule FROM courses ORDER BY course_code";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<Course> list = new ArrayList<>();
            while (rs.next()) {
                list.add(map(rs));
            }
            return list;
        }
    }

    public List<Course> findByStudentId(int studentId) throws SQLException {
        String sql = "SELECT c.course_id, c.course_code, c.course_name, c.instructor, c.schedule " +
                     "FROM courses c JOIN student_course sc ON c.course_id = sc.course_id " +
                     "WHERE sc.student_id = ? ORDER BY c.course_code";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                List<Course> list = new ArrayList<>();
                while (rs.next()) {
                    list.add(map(rs));
                }
                return list;
            }
        }
    }

    public boolean updateCourse(int courseId, String instructor, String schedule) throws SQLException {
        String sql = "UPDATE courses SET instructor = ?, schedule = ? WHERE course_id = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, instructor);
            ps.setString(2, schedule);
            ps.setInt(3, courseId);
            return ps.executeUpdate() == 1;
        }
    }

    public Course findByCode(String code) throws SQLException {
        String sql = "SELECT course_id, course_code, course_name, instructor, schedule FROM courses WHERE course_code = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, code);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return map(rs);
                return null;
            }
        }
    }

    private Course map(ResultSet rs) throws SQLException {
        return new Course(
            rs.getInt("course_id"),
            rs.getString("course_code"),
            rs.getString("course_name"),
            rs.getString("instructor"),
            rs.getString("schedule")
        );
    }
}
