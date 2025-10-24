<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Faculty Update</title>
  <style>
    body{font-family:system-ui,Segoe UI,Roboto,Arial;margin:2rem;}
    label{display:block;margin:.5rem 0 .25rem;}
    input[type=text]{padding:.5rem;border:1px solid #ccc;border-radius:6px;width:320px;}
    button{margin-top:1rem;padding:.5rem 1rem;border:1px solid #ccc;border-radius:8px;background:#f9fafb;cursor:pointer;}
    .hint{color:#6b7280;font-size:.9rem;}
  </style>
</head>
<body>
  <h1>Faculty: Update Course</h1>
  <p><a href="index.jsp">&#8592; Home</a></p>
  <form method="post" action="faculty">
    <label for="courseCode">Course Code</label>
    <input type="text" id="courseCode" name="courseCode" placeholder="e.g., CS101" />

    <label for="instructor">Instructor</label>
    <input type="text" id="instructor" name="instructor" placeholder="New instructor name" />

    <label for="schedule">Schedule</label>
    <input type="text" id="schedule" name="schedule" placeholder="e.g., Tue 10:00-12:00" />

    <button type="submit">Save</button>

    <p class="hint">Tip: first view all courses to confirm the course code.</p>
  </form>
</body>
</html>
