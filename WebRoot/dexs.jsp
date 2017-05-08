<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:forEach var="list" items="${requestScope.list }">
	<li><a href="${list.url }">${list.name }</a> 
		<c:if test="${requestScope.list!=null||fn:length(requestScope.list) > 0}">
			<ul class="two">
				<s:action name="dexs" executeResult="true">
					<s:param name="id">${list.id}</s:param>
				</s:action>
			</ul>
		</c:if></li>
</c:forEach>

