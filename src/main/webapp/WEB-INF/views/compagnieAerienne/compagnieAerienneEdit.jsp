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
<spring:url value="/resources/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />
<title><spring:message code="compagnieAerienneEdit.title" /></title>
</head>
<body>
<jsp:include page="/header"></jsp:include>
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="compagnieAerienneEdit.fieldset" />
			</legend>

			<form:form method="post" action="save"
				modelAttribute="compagnieAerienne" cssClass="form-horizontal">
				<form:hidden path="version" />
				<form:hidden path="id" />
				
				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="nom">
						<spring:message code="compagnieAerienneEdit.nom" />
					</form:label>
					<div class="col-xs-5">
						<form:input cssClass="form-control" path="nom" />
						<form:errors cssClass="text-danger" path="nom" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-3 text-right"></div>
					<div class="col-xs-5 text-right">
						<input class="btn btn-primary" type="submit"
							value="<spring:message code="compagnieAerienneEdit.save"/>" />
						<c:url var="cancel" value="/compagnieAerienne" />
						<a href="${cancel}">
							<button type="button" class="btn">
								<spring:message code="clientEdit.cancel" />
							</button>
						</a>
					</div>
				</div>
			</form:form>
		</fieldset>
	</div>
</body>
</html>