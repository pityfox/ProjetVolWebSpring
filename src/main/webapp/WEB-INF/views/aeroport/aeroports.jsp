<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="aeroports.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
<jsp:include  page="/header"></jsp:include>
<div class="container">
		<h2><spring:message code="aeroports.title"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="aeroports.id" /></th>
				<th><spring:message code="aeroports.nom" /></th>
				
			</tr>

			<c:forEach items="${mesAeroports}" var="aeroport">
				<c:url var="editUrl" value="/aeroport/edit">
					<c:param name="id" value="${aeroport.id}" />
				</c:url>
				<c:url var="deleteUrl" value="/aeroport/delete">
					<c:param name="id" value="${aeroport.id}" />
				</c:url>
				<tr>
					<td>${aeroport.id}</td>
				
					<td>${aeroport.nom}</td>
				
					
					<td><a href="${editUrl}" class="btn btn-info btn-xs"><spring:message
								code="aeroports.edit" /></a></td>
					<td><a href="${deleteUrl}" class="btn btn-warning btn-xs"><spring:message
								code="aeroports.delete" /></a></td>
				</tr>
			</c:forEach>
			<c:url var="addUrl" value="/aeroport/add" />
			<tr>
				<td colspan="7"><a href="${addUrl}" class="btn btn-info"><spring:message
							code="aeroports.add"/></a></td>
			</tr>
		</table>

	</div>
</body>
</html>