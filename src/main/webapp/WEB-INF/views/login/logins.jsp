<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="logins.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<h2><spring:message code="logins.title"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="logins.id" /></th>
				<th><spring:message code="logins.login" /></th>
				<th><spring:message code="logins.motDePasse" /></th>
				<th><spring:message code="logins.admin" /></th>
				
			</tr>

			<c:forEach items="${mesLogins}" var="login">
				<c:url var="editUrl" value="/login/edit">
					<c:param name="id" value="${login.id}" />
				</c:url>
				<c:url var="deleteUrl" value="/login/delete">
					<c:param name="id" value="${login.id}" />
				</c:url>
				<tr>
					<td>${login.id}</td>
				
					<td>${login.login}</td>
					<td>${login.motDePasse}</td>
					<td>${login.admin}</td>
					
					<td><a href="${editUrl}" class="btn btn-info btn-xs"><spring:message
								code="logins.edit" /></a></td>
					<td><a href="${deleteUrl}" class="btn btn-warning btn-xs"><spring:message
								code="logins.delete" /></a></td>
				</tr>
			</c:forEach>
			<c:url var="addUrl" value="/login/add" />
			<tr>
				<td colspan="7"><a href="${addUrl}" class="btn btn-info"><spring:message
							code="logins.add"/></a></td>
			</tr>
		</table>

	</div>

</body>
</html>