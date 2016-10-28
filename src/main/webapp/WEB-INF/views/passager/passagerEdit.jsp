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
<title><spring:message code="passagerEdit.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="passagerEdit.fieldset" />
			</legend>
			<form:form method="post" modelAttribute="passager" action="save">
				<form:hidden path="id" />
				<form:hidden path="version" />

				<div class="form-group">
					<form:label path="nom" class="control-label">
						<spring:message code="passagerEdit.nom" />
					</form:label>
					<form:input path="nom" class="form-control" />
					<form:errors path="nom" />
				</div>

				<div class="form-group">
					<form:label path="prenom" class="control-label">
						<spring:message code="passagerEdit.prenom" />
					</form:label>
					<form:input path="prenom" class="form-control" />
					<form:errors path="prenom" />
				</div>
				<%-- <div class="form-group">
					<form:label path="adr.adresse" class="control-label">
						<spring:message code="passagerEdit.adresse" />
					</form:label>
					<form:input path="adr.adresse" class="form-control" />
					<form:errors path="adr.adresse" />
				</div> --%>
				<div class="form-group">
					<form:label path="adresse.codePostal" class="control-label">
						<spring:message code="passagerEdit.codePostal" />
					</form:label>
					<form:input path="adresse.codePostal" class="form-control" />
					<form:errors path="adresse.codePostal" />
				</div>
				<div class="form-group">
					<form:label path="adresse.ville" class="control-label">
						<spring:message code="passagerEdit.ville" />
					</form:label>
					<form:input path="adresse.ville" class="form-control" />
					<form:errors path="adresse.ville"/>
				</div>	
				<div class="form-group">
					<form:label path="adresse.pays" class="control-label">
						<spring:message code="passagerEdit.pays" />
					</form:label>
					<form:input path="adresse.pays" class="form-control" />
					<form:errors path="adresse.pays"/>
				</div>	
				<input type="submit"
					value="<spring:message code="passagerEdit.save"/>"
					class="btn btn-success" />
			</form:form>
		</fieldset>
	</div>


</body>
</html>