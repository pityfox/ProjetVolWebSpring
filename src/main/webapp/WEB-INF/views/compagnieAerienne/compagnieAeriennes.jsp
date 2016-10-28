<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<title><spring:message code="compagnieAeriennes.title" /></title>
</head>
<body>
<jsp:include page="/header"></jsp:include>
	<div class="container">
		<h2>
			<spring:message code="compagnieAeriennes.title" />
		</h2>

		<table class="table table-striped">
			<tr>
				<th><spring:message code="compagnieAeriennes.id" /></th>
				<th><spring:message code="compagnieAeriennes.nom" /></th>
				<th></th>
				<th></th>
			</tr>

			<c:forEach items="${compagnieAeriennes}" var="compagnieAerienne">
				<c:url var="editUrl" value="/compagnieAerienne/edit">
					<c:param name="id" value="${compagnieAerienne.id}" />
				</c:url>
				<c:url var="deleteUrl" value="/compagnieAerienne/delete">
					<c:param name="id" value="${compagnieAerienne.id}" />
				</c:url>
				<tr>
					<td>${compagnieAerienne.id}</td>
					<td>${compagnieAerienne.nom}</td>
					<td><a class="btn btn-info btn-xs" href="${editUrl}"><spring:message
								code="compagnieAeriennes.edit" /></a></td>
					<td><a class="btn btn-warning btn-xs" href="${deleteUrl}"><spring:message
								code="compagnieAeriennes.delete" /></a></td>
				</tr>
			</c:forEach>
			<c:url var="addUrl" value="/compagnieAerienne/add" />
			<tr>
				<td colspan="7"><a class="btn btn-primary" href="${addUrl}"><spring:message
							code="compagnieAeriennes.add" /></a></td>
			</tr>
		</table>
	</div>
</body>
</html>