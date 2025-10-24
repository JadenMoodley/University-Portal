<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.university.portal.model.Course" %>
<!DOCTYPE html>
<html>
<head>
  <title>All Courses</title>
  <style>
    body{font-family:system-ui,Segoe UI,Roboto,Arial;margin:2rem;}
    table{border-collapse:collapse;width:100%;}
    th,td{border:1px solid #e5e7eb;padding:.5rem;text-align:left;}
    th{background:#f3f4f6;}
  </style>
</head>
<body>
  <h1>All Courses</h1>
  <p><a href="index.jsp">&#8592; Home</a></p>
  <table>
    <tr><th>Code</th><th>Name</th><th>Instructor</th><th>Schedule</th></tr>
    <%
      List<Course> courses = (List<Course>) request.getAttribute("courses");
      if (courses != null) {
        for (Course c : courses) {
    %>
      <tr>
        <td><%= c.getCourseCode() %></td>
        <td><%= c.getCourseName() %></td>
        <td><%= c.getInstructor() %></td>
        <td><%= c.getSchedule() %></td>
      </tr>
    <%
        }
      }
    %>
  </table>
</body>
</html>
