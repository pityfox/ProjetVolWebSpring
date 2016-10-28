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
<title><spring:message code="reservationEdit.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
<jsp:include page="/header"></jsp:include>
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="reservationEdit.fieldset" />
			</legend>
			<form:form method="post" modelAttribute="reservation" action="save">
				<form:hidden path="id" />
				<form:hidden path="version" />
				
				<div class="form-group">
					<form:label path="date" class="control-label">
						<spring:message code="reservationEdit.date" />
					</form:label>
					<form:input path="date" class="form-control" type="date" />
					<form:errors path="date"/>
				</div>	
							
				<div class="form-group">
					<form:label path="numero" class="control-label">
						<spring:message code="reservationEdit.numero" />
					</form:label>
					<form:input path="numero" class="form-control" />
					<form:errors path="numero" />
				</div>					
				
				<input type="submit"
					value="<spring:message code="reservationEdit.save"/>"
					class="btn btn-success" />
			</form:form>
		</fieldset>
	</div>


</body>
</html>