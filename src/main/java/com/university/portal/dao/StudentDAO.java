package com.university.portal.dao;

import com.university.portal.model.Student;
import java.sql.*;

public class StudentDAO {

    public Student findById(int id) throws SQLException {
        String sql = "SELECT student_id, first_name, last_name, email FROM students WHERE student_id = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Student(
                        rs.getInt("student_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email")
                    );
                }
                return null;
            }
        }
    }
}
