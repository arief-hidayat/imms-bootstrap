
<%@ page import="com.hida.imms.Asset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asset" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'asset.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'asset.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="assetGroup" title="${message(code: 'asset.assetGroup.label', default: 'Asset Group')}" />
					
						<g:sortableColumn property="locationCd" title="${message(code: 'asset.locationCd.label', default: 'Location Cd')}" />
					
						<g:sortableColumn property="originalCost" title="${message(code: 'asset.originalCost.label', default: 'Original Cost')}" />
					
						<g:sortableColumn property="note" title="${message(code: 'asset.note.label', default: 'Note')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${assetInstanceList}" status="i" var="assetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${assetInstance.id}">${fieldValue(bean: assetInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: assetInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "assetGroup")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "locationCd")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "originalCost")}</td>
					
						<td>${fieldValue(bean: assetInstance, field: "note")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${assetInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
