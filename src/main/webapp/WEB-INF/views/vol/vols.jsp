<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="vols.list.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
	<%-- <jsp:include page="/WEB-INF/views/header.jsp"/> --%>
	<div class="container">
		<h2>
			<spring:message code="vols.list.title" />
		</h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="vol.att.id" /></th>
				<th><spring:message code="vol.att.dtDepart" /></th>
				<th><spring:message code="vol.att.dtArrivee" /></th>
				<th><spring:message code="vol.att.hDepart" /></th>
				<th><spring:message code="vol.att.hArrivee" /></th>
				<th></th>
				<th></th>
			</tr>

			<c:forEach items="${vols}" var="vol">
				<c:url var="editUrl" value="/vols/edit">
					<c:param name="id" value="${vol.id}" />
				</c:url>
				<c:url var="deleteUrl" value="/vols/delete">
					<c:param name="id" value="${vol.id}" />
				</c:url>
				<tr>
					<td>${vol.id}</td>
					<td><fmt:formatDate value="${vol.dateDepart}"
							pattern="dd/MM/yyyy" /></td>
					<td><fmt:formatDate value="${vol.dateArrivee}"
							pattern="dd/MM/yyyy" /></td>
					<td><fmt:formatDate value="${vol.heureDepart}"
							pattern="HH:mm" /></td>
					<td><fmt:formatDate value="${vol.heureArrivee}"
							pattern="HH:mm" /></td>
					<td><a href="${editUrl}" class="btn btn-info btn-xs"><spring:message
								code="edit" /></a></td>
					<td><a href="${deleteUrl}" class="btn btn-warning btn-xs"><spring:message
								code="delete" /></a></td>
				</tr>
			</c:forEach>
			<c:url var="addUrl" value="/vols/add" />
			<tr>
				<td colspan="7"><a href="${addUrl}" class="btn btn-info"><spring:message
							code="add" /></a></td>
			</tr>
		</table>

	</div>

</body>
</html>