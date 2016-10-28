<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="loginEdit.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
<jsp:include  page="/header"></jsp:include>
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="loginEdit.fieldset" />
			</legend>
			<form:form method="post" modelAttribute="login" action="save">
				<form:hidden path="id" />
				<form:hidden path="version" />
				
				<div class="form-group">
					<form:label path="login" class="control-label">
						<spring:message code="loginEdit.login" />
					</form:label>
					<form:input path="login" class="form-control" />
					<form:errors path="login" />
				</div>
				<div class="form-group">
					<form:label path="motDePasse" class="control-label">
						<spring:message code="loginEdit.motDePasse" />
					</form:label>
					<form:input path="motDePasse" class="form-control" />
					<form:errors path="motDePasse" />
				</div>
				<div class="form-group">
					<form:label path="admin" class="control-label">
						<spring:message code="loginEdit.admin" />
					</form:label>
					<form:input path="admin" class="form-control"/>
					<form:errors path="admin" />
				</div>
				
				<input type="submit"
					value="<spring:message code="loginEdit.save"/>"
					class="btn btn-success" />
			</form:form>
		</fieldset>
	</div>


</body>
</html>