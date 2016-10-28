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
<title><spring:message code="volEdit.title" /></title>
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="volEdit.fieldset" />
			</legend>
			<form:form method="post" modelAttribute="vol" action="save">
				<form:hidden path="id" />
				<form:hidden path="version" />
				<div class="form-group">
					<form:label path="dateDepart" class="control-label">
						<spring:message code="volEdit.dateDepart" />
					</form:label>
					<form:input path="dateDepart" class="form-control" type="date" />
					<form:errors path="dateDepart" cssClass="text-danger" />
				</div>
				<div class="form-group">
					<form:label path="dateArrivee" class="control-label">
						<spring:message code="volEdit.dateArrivee" />
					</form:label>
					<form:input path="dateArrivee" class="form-control" type="date" />
					<form:errors path="dateArrivee" />
				</div>

				<div class="form-group">
					<form:label path="heureDepart" class="control-label">
						<spring:message code="volEdit.heureDepart" />
					</form:label>
					<form:input path="heureDepart" class="form-control" type="datetime" />
					<form:errors path="heureDepart" />
				</div>
				<div class="form-group">
					<form:label path="heureArrivee" class="control-label">
						<spring:message code="volEdit.heureArrivee" />
					</form:label>
					<form:input path="heureArrivee" class="form-control"
						type="datetime" />
					<form:errors path="heureArrivee" />
				</div>
				<div class="form-group">
					<form:label path="depart" class="control-label">
 						<spring:message code="volEdit.depart" /> 
					</form:label>

					<form:select path="depart.id">
						<form:option value="">
							<spring:message code="volEdit.depart.selection" />
						</form:option>
						<c:forEach items="${aeroports}" var="t">
							<form:option value="${t.id}">
								${t.nom}
							</form:option>
						</c:forEach>
					</form:select>
					</div>
					<div class="form-group">
					<form:label path="depart" class="control-label">
					<spring:message code="volEdit.arrivee" /> 
					</form:label>
					
					<form:select path="arrivee.id">
						<form:option value="">
							<spring:message code="volEdit.arrivee.selection" />
						</form:option>
						<c:forEach items="${aeroports}" var="t">
							<form:option value="${t.id}">
								${t.nom}
							</form:option>
						</c:forEach>
					</form:select>
				</div>
				<input type="submit" value="<spring:message code="save"/>"
					class="btn btn-success" />
			</form:form>
		</fieldset>
	</div>


</body>
</html>