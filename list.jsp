<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>List</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<style>
     a { text-decoration : none; }
     a:visited { color: blue; }
    </style>
</head>
<body>
<%
//=============== 로그인된경우 아이디를 저장한다.(session) ====================//
HttpSession sess = request.getSession();
if(sess.getAttribute("LoginUserID")!=null){
 out.println("<center><h3><font color='BLUE'>로그인중...</font></h3></center>");
}
//==============================================================================//

String url="jdbc:mysql://localhost:3306/guestbook_d";
String user="root";
String password="";
Connection conn=DriverManager.getConnection(url,user,password);

ResultSet rs=null;
PreparedStatement stmt = null;
stmt = conn.prepareStatement("SELECT * FROM guestbook_t");
rs = stmt.executeQuery();

out.println("<table class='table'><thead class='table-dark'>"+
"<tr><th scope='col'>글번호</th><th scope='col'>글제목</th>"+
"<th scope='col'>글쓴이</th><th scope='col'>글쓴날짜</th><th scope='col'>조회수</th></tr></thead>");

out.println("<tbody class='table-group-divider'>");
while (rs.next()) { 
out.println("<tr>"); 
out.println("<td>"+rs.getString("no")+"</td>");
String no = rs.getString("no");
out.println("<td><a href=read.jsp?no=" + no + ">" + rs.getString("title") + "</a></td>");
//out.println("<td>"+rs.getString("content")+"</td>");
out.println("<td>"+rs.getString("writer")+"</td>");
out.println("<td>"+rs.getString("date")+"</td>");
out.println("<td>"+rs.getString("views")+"</td>");
out.println("</tr>");
} 
out.println("</tbody>");
out.println("</table>");
%>
</body>
</html>