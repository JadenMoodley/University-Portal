<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>University Portal</title>
  <style>
    body{font-family:system-ui,Segoe UI,Roboto,Arial;margin:2rem;}
    a.button{display:inline-block;padding:.6rem 1rem;border:1px solid #ccc;border-radius:8px;text-decoration:none;}
    .grid{display:grid;gap:1rem;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));}
    .card{border:1px solid #e5e7eb;border-radius:12px;padding:1rem;}
  </style>
</head>
<body>
  <h1>University Portal</h1>
  <p>Choose an action:</p>
  <div class="grid">
    <div class="card">
      <h3>All Courses</h3>
      <p>View the list of available courses.</p>
      <a class="button" href="courses">Open</a>
    </div>
    <div class="card">
      <h3>Student Schedule</h3>
      <p>Enter your student ID to see your schedule.</p>
      <a class="button" href="student">Open</a>
    </div>
    <div class="card">
      <h3>Faculty Update</h3>
      <p>Update course instructor or schedule.</p>
      <a class="button" href="faculty">Open</a>
    </div>
  </div>
</body>
</html>
