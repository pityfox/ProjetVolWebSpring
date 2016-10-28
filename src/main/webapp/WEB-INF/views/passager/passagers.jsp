<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="passagers.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
<jsp:include page="/header"></jsp:include>
	<div class="container">
		<h2><spring:message code="passagers.title"/></h2>
		<table class="table table-striped">
			<tr>
				<th><spring:message code="passagers.id" /></th>
				<th><spring:message code="passagers.nom" /></th>
				<th><spring:message code="passagers.prenom" /></th>
				<%-- <th><spring:message code="passagers.adresse" /></th> --%>
				<th><spring:message code="passagers.adresse.codePostal" /></th>
				<th><spring:message code="passagers.adresse.ville" /></th>
				<th><spring:message code="passagers.adresse.pays" /></th>
				
				<th></th>
				<th></th>
			</tr>

			<c:forEach items="${passagers}" var="passager">
				<c:url var="editUrl" value="/passager/edit">
					<c:param name="id" value="${passager.id}" />
				</c:url>
				<c:url var="deleteUrl" value="/passager/delete">
					<c:param name="id" value="${passager.id}" />
				</c:url>
				<tr>
					<td>${passager.id}</td>
					<td>${passager.nom}</td>
					<td>${passager.prenom}</td>
					<td>${passager.adresse.codePostal}</td>
					<td>${passager.adresse.ville}</td>
					<td>${passager.adresse.pays}</td>
					
					<td><a href="${editUrl}" class="btn btn-info btn-xs"><spring:message
								code="passagers.edit" /></a></td>
					<td><a href="${deleteUrl}" class="btn btn-warning btn-xs"><spring:message
								code="passagers.delete" /></a></td>
				</tr>
			</c:forEach>
			<c:url var="addUrl" value="/passager/add" />
			<tr>
				<td colspan="7"><a href="${addUrl}" class="btn btn-info"><spring:message
							code="passagers.add"/></a></td>
			</tr>
		</table>

	</div>

</body>
</html>