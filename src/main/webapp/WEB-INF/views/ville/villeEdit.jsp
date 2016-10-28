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
<title><spring:message code="villeEdit.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
<jsp:include  page="/header"></jsp:include>
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="villeEdit.fieldset" />
			</legend>
			<form:form method="post" modelAttribute="ville" action="save">
				<form:hidden path="id" />
				
				<div class="form-group">
					<form:label path="nom" class="control-label">
						<spring:message code="villeEdit.nom" />
					</form:label>
					<form:input path="nom" class="form-control" />
					<form:errors path="nom" />
				</div>
				
				<input type="submit"
					value="<spring:message code="villeEdit.save"/>"
					class="btn btn-success" />
			</form:form>
		</fieldset>
	</div>


</body>
</html>