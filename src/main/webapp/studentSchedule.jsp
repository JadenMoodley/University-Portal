<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.university.portal.model.Course, com.university.portal.model.Student" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Schedule</title>
  <style>
    body{font-family:system-ui,Segoe UI,Roboto,Arial;margin:2rem;}
    label{display:block;margin:.5rem 0 .25rem;}
    input[type=text]{padding:.5rem;border:1px solid #ccc;border-radius:6px;width:240px;}
    button{padding:.5rem 1rem;border:1px solid #ccc;border-radius:8px;background:#f9fafb;cursor:pointer;}
    table{border-collapse:collapse;margin-top:1rem;width:100%;}
    th,td{border:1px solid #e5e7eb;padding:.5rem;text-align:left;}
    th{background:#f3f4f6;}
  </style>
</head>
<body>
  <h1>Student Schedule</h1>
  <p><a href="index.jsp">&#8592; Home</a></p>
  <form method="post" action="student">
    <label for="studentId">Student ID</label>
    <input type="text" id="studentId" name="studentId" placeholder="e.g., 1001" />
    <button type="submit">View Schedule</button>
  </form>

  <%
    Student s = (Student) request.getAttribute("student");
    List<Course> schedule = (List<Course>) request.getAttribute("schedule");
    if (s != null) {
  %>
    <h2>Schedule for <%= s.getFirstName() + " " + s.getLastName() %> (ID: <%= s.getStudentId() %>)</h2>
    <table>
      <tr><th>Code</th><th>Name</th><th>Instructor</th><th>Schedule</th></tr>
      <%
        if (schedule != null) {
          for (Course c : schedule) {
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
  <%
    }
  %>
</body>
</html>
