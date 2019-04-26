<%@ page language="java" import="cmc.interaction.*,java.util.*,cmc.functionality.*"%>
<%@include file="verifyLoginCMC.jsp" %>
<% 
String u = request.getParameter("username");
String p = request.getParameter("password");

AccountInteraction interaction = new AccountInteraction();
int loginStatus = interaction.login(u, p);
if(loginStatus == 0)
{
	if(interaction.viewProfile(u).get(4).equals("a"))
	{
		interaction = new AdminInteraction();
		interaction.login(u,p);
		//interaction.setUfCon(u);
		interaction.setAccount(u);
		session.setAttribute("interaction", interaction);
		response.sendRedirect("AdminMenu.jsp");
	}
	if(interaction.viewProfile(u).get(4).equals("u"))
	{
		interaction = new StudentInteraction();
		//interaction.setUfCon(u);
		interaction.login(u,p);
		interaction.setAccount(u);
		session.setAttribute("interaction", interaction);
		response.sendRedirect("StudentMenu.jsp");
	}
}
else
{
	 response.sendRedirect("Login.jsp?Error="+loginStatus);
}
%>