<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<spring:url value="/resources/clients.css" var="styleClients" />
<link href="${styleClients}" rel="stylesheet" />
</head>
<body>
	<c:url var="home" value="/" />
	<c:url var="client" value="/client" />
	<c:url var="vol" value="/vol" />
	<c:url var="compagnieAerienne" value="/compagnieAerienne" />
	<div class="container">

		<div id=nav " class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="${home}"><spring:message
							code="website.name" /></a>
				</div>
				<ul class="nav navbar-nav">
					<li class="${page eq 'home' ? 'active' : '' }"><a
						href="${home}"><spring:message code="nav.home" /></a></li>
					<li class="dropdown ${page eq 'client' ? 'active' : '' }"><a
						class="dropdown-toggle" data-toggle="dropdown" href="${client}"><spring:message
								code="nav.clients" /> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${client}"><spring:message
										code="nav.clients.list" /></a></li>
						</ul></li>
						<li class="dropdown ${page eq 'vol' ? 'active' : '' }"><a class="dropdown-toggle"
						data-toggle="dropdown" href="${vol}"><spring:message
								code="nav.vols" /> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${vol}"><spring:message
										code="nav.vols.list" /></a></li>
						</ul></li>
					<li class="dropdown ${page eq 'compagnieAerienne' ? 'active' : '' }"><a class="dropdown-toggle"
						data-toggle="dropdown" href="${compagnieAerienne}"><spring:message
								code="nav.compagnieAeriennes" /> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${compagnieAerienne}"><spring:message
										code="nav.compagnieAeriennes.list" /></a></li>
						</ul></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Sign Up</a></li>
					<li><a href="#">Login</a></li>
				</ul>

			</div>
		</div>


	</div>
</body>
</html>