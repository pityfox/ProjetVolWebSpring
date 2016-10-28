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
<title><spring:message code="clientEdit.title" /></title>
</head>
<body>
<jsp:include page="/header"></jsp:include>
	<div class="container">
		<fieldset>
			<legend>
				<spring:message code="clientEdit.fieldset" />
			</legend>

			<form:form method="post" action="save" modelAttribute="client"
				cssClass="form-horizontal">
				<form:hidden path="id" />
				<form:hidden path="version" />

				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="titre">
						<spring:message code="clientEdit.titre" />
					</form:label>
					<div class="col-xs-5">
						<form:select path="titre">
							<form:option value="">
								<spring:message code="clientEdit.titre.selection" />
							</form:option>
							<c:forEach items="${titres}" var="t">
								<form:option value="${t}">
									<spring:message code="${t.label}" />
								</form:option>
							</c:forEach>
						</form:select><br>
						<form:errors cssClass="text-danger" path="titre" />
					</div>
				</div>
				
				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="nom">
						<spring:message code="clientEdit.nom" />
					</form:label>
					<div class="col-xs-5">
						<form:input cssClass="form-control" path="nom" />
						<form:errors cssClass="text-danger" path="nom" />
					</div>
				</div>

				<%-- <div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="prenom">
						<spring:message code="clientEdit.prenom" />
					</form:label>
					<div class="col-xs-5">
						<form:input cssClass="form-control" path="prenom" />
						<form:errors cssClass="text-danger" path="prenom" />
					</div>
				</div>
				
				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="siret">
						<spring:message code="clientEdit.siret" />
					</form:label>
					<div class="col-xs-5">
						<form:input cssClass="form-control" path="siret" />
						<form:errors cssClass="text-danger" path="siret" />
					</div>
				</div> --%>

				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="numeroTel">
						<spring:message code="clientEdit.numeroTel" />
					</form:label>
					<div class="col-xs-5">
						<form:input cssClass="form-control" path="numeroTel" />
						<form:errors cssClass="text-danger" path="numeroTel" />
					</div>
				</div>

				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="numeroFax">
						<spring:message code="clientEdit.numeroFax" />
					</form:label>
					<div class="col-xs-5">
						<form:input cssClass="form-control" path="numeroFax" />
						<form:errors cssClass="text-danger" path="numeroFax" />
					</div>
				</div>

				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="email">
						<spring:message code="clientEdit.email" />
					</form:label>
					<div class="col-xs-5">
						<div class="input-group">
							<span class="input-group-addon">@</span>
							<form:input path="email" cssClass="form-control" />
						</div>
						<form:errors cssClass="text-danger" path="email" />
					</div>
				</div>

				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="adresse.pays">
						<spring:message code="clientEdit.pays" />
					</form:label>
					<div class="col-xs-5">
						<form:input cssClass="form-control" path="adresse.pays" />
						<form:errors cssClass="text-danger" path="adresse.pays" />
					</div>
				</div>

				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label"
						path="adresse.codePostal">
						<spring:message code="clientEdit.codePostal" />
					</form:label>
					<div class="col-xs-5">
						<form:input cssClass="form-control" path="adresse.codePostal" />
						<form:errors cssClass="text-danger" path="adresse.codePostal" />
					</div>
				</div>

				<div class="form-group">
					<form:label cssClass="col-xs-3 control-label" path="adresse.ville">
						<spring:message code="clientEdit.ville" />
					</form:label>
					<div class="col-xs-5">
						<form:input cssClass="form-control" path="adresse.ville" />
						<form:errors cssClass="text-danger" path="adresse.ville" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-3 text-right"></div>
					<div class="col-xs-5 text-right">
						<input class="btn btn-primary" type="submit"
							value="<spring:message code="clientEdit.save"/>" />
						<c:url var="cancel" value="/client" />
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