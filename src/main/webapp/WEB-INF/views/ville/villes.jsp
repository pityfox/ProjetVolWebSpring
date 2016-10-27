<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="villes.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>

<div class="container">
		<h2><spring:message code="villes.title"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="villes.id" /></th>
				<th><spring:message code="villes.nom" /></th>
				
			</tr>

			<c:forEach items="${mesVilles}" var="ville">
				<c:url var="editUrl" value="/ville/edit">
					<c:param name="id" value="${ville.id}" />
				</c:url>
				<c:url var="deleteUrl" value="/ville/delete">
					<c:param name="id" value="${ville.id}" />
				</c:url>
				<tr>
					<td>${ville.id}</td>
				
					<td>${ville.nom}</td>
				
					
					<td><a href="${editUrl}" class="btn btn-info btn-xs"><spring:message
								code="villes.edit" /></a></td>
					<td><a href="${deleteUrl}" class="btn btn-warning btn-xs"><spring:message
								code="villes.delete" /></a></td>
				</tr>
			</c:forEach>
			<c:url var="addUrl" value="/ville/add" />
			<tr>
				<td colspan="7"><a href="${addUrl}" class="btn btn-info"><spring:message
							code="villes.add"/></a></td>
			</tr>
		</table>

	</div>
</body>
</html>