<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="reservations.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<h2><spring:message code="reservations.title"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="reservations.id" /></th>
				<th><spring:message code="reservations.date" /></th>
				<th><spring:message code="reservations.numero" /></th>
				
				
				<th></th>
				<th></th>
			</tr>

			<c:forEach items="${reservations}" var="reservation">
				<c:url var="editUrl" value="/reservation/edit">
					<c:param name="id" value="${reservation.id}" />
				</c:url>
				<c:url var="deleteUrl" value="/reservation/delete">
					<c:param name="id" value="${reservation.id}" />
				</c:url>
				<tr>
					<td>${reservation.id}</td>
					<td><fmt:formatDate value="${reservation.date}"
							pattern="dd/MM/yyyy" /></td>
					<td>${reservation.numero}</td>
					
					<td><a href="${editUrl}" class="btn btn-info btn-xs"><spring:message
								code="reservations.edit" /></a></td>
					<td><a href="${deleteUrl}" class="btn btn-warning btn-xs"><spring:message
								code="reservations.delete" /></a></td>
				</tr>
			</c:forEach>
			<c:url var="addUrl" value="/reservation/add" />
			<tr>
				<td colspan="7"><a href="${addUrl}" class="btn btn-info"><spring:message
							code="reservations.add"/></a></td>
			</tr>
		</table>

	</div>

</body>
</html>