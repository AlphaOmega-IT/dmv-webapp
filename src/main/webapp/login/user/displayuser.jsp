<%@ page import="de.alphaomega.it.dmv.database.daos.UserDao" %>
<%@ page import="de.alphaomega.it.dmv.database.entities.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bildhochladen.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/extras.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hovereffekt.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/kat1sample.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/MUSA_panel-table-panel-table.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/MUSA_panel-table.css" type="text/css">
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/Video-Parallax-Background-v2.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/javascript/adminpanel.js" type="text/javascript"></script>

<tbody>
<%
	UserDao userDao = new UserDao();
	final List<User> users = userDao.findAll();
	for (User user : users) {
%>
<tr style="vertical-align: middle">
	<td style="text-align: center;">
		<%
			if (!user.getUsername().equals("admin")) {
		%>
		<form method="post" action="${pageContext.request.contextPath}/deleteuser/<%=user.getUsername()%>" >
			<button type="submit" class="btn btn-default"><em class="fa fa-trash"></em></button>
		</form>
		<%
			}
		%>
	</td>
	<td class="hidden-xs"><%=user.getId()%>
	</td>
	<td><%=user.getUsername()%>
	</td>
	<td><%=String.join(";", user.getPermissions())%>
	</td>
</tr>
<%
	}
%>
</tbody>