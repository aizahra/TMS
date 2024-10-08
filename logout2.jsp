<%-- 
    Document   : logout
    Created on : 7 Apr, 2024, 4:19:51 AM
    Author     : Sejal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
<p id="usertype_check" style="display: none;"><%=session.getAttribute("LogedInUserType")%></p>
</body>
        <script type="text/javascript">
	var usertype_check_val = document.getElementById('usertype_check').innerText;
	var action = confirm("Are you sure you want to log out?");

	if (action == true) {
		window.location.href = "Dashboard.jsp";
	} else {
		if (usertype_check_val == "admin") {
			window.location.href = "loggedindash.jsp";
		} else {
			window.location.href = "loggedindash.jsp";
		}
	}
</script>
</html>