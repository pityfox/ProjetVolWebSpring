<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="clients.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<spring:url value="/resources/clients.css" var="styleClients" />
<link href="${styleClients}" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<h2>
			<spring:message code="clients.title" />
		</h2>
		<table class="table table-striped">
			<tr>

				<th><spring:message code="clients.id" /></th>
				<th><spring:message code="clients.type" /></th>
				<th><spring:message code="clients.titre" /></th>
				<th><spring:message code="clients.nom" /></th>
				<%-- <th><spring:message code="clients.prenom" /></th>
				<th><spring:message code="clients.siret" /></th> --%>
				<th><spring:message code="clients.numeroTel" /></th>
				<th><spring:message code="clients.numeroFax" /></th>
				<th><spring:message code="clients.email" /></th>
				<th><spring:message code="clients.codePostal" /></th>
				<th><spring:message code="clients.ville" /></th>
				<th><spring:message code="clients.pays" /></th>
				<th></th>
				<th></th>
			</tr>

			<c:forEach items="${clients}" var="client">
				<c:url var="editUrl" value="/client/edit">
					<c:param name="id" value="${client.id}" />
				</c:url>
				<c:url var="deleteUrl" value="/client/delete">
					<c:param name="id" value="${client.id}" />
				</c:url>
				<tr>
					<td>${client.id}</td>
					<td>${client.type}</td>
					<%-- <td><spring:message code="${client.titre.label}" /></td> --%>
					<td>${client.titre}</td>
					<td>${client.nom}</td>
					<%-- 	<td>${client.prenom}</td>
					<td>${client.siret}</td> --%>
					<td>${client.numeroTel}</td>
					<td>${client.numeroFax}</td>
					<td>${client.email}</td>
					<td>${client.adresse.codePostal}</td>
					<td>${client.adresse.ville}</td>
					<td>${client.adresse.pays}</td>

					<td><a href="${editUrl}" class="btn btn-info btn-xs"><spring:message
								code="clients.edit" /></a></td>
					<td><a href="${deleteUrl}" class="btn btn-warning btn-xs"><spring:message
								code="clients.delete" /></a></td>
				</tr>
			</c:forEach>
			<c:url var="addClientPhysiqueUrl" value="/client/addClientPhysique" />
			<c:url var="addClientMoralUrl" value="/client/addClientMoral" />
			<c:url var="addClientEIUrl" value="/client/addClientEI" />
			<tr>
				<td colspan="13"><div class="dropdown">
						<button class="btn btn-info"><spring:message code="clients.add"/></button>
						<div class="dropdown-content ">
							<a href="${addClientPhysiqueUrl}"><spring:message
							code="clients.addClientPhysique" /></a>
							<a href="${addClientMoralUrl}"><spring:message
							code="clients.addClientMoral" /></a> 
							 <a href="${addClientEIUrl}"><spring:message
							code="clients.addClientEI" /></a>
						</div>
					</div>
					</td>
			</tr>
		</table>

	</div>

</body>
</html>