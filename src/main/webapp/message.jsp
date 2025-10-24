<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Message</title>
  <style>
    body{font-family:system-ui,Segoe UI,Roboto,Arial;margin:2rem;}
    .box{border:1px solid #e5e7eb;padding:1rem;border-radius:12px;background:#f9fafb;}
  </style>
</head>
<body>
  <p><a href="index.jsp">&#8592; Home</a></p>
  <div class="box">
    <h3><%= request.getAttribute("message") %></h3>
  </div>
</body>
</html>
