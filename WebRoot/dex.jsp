<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:forEach var="list" items="${requestScope.list }">

	<c:if test="${list.type==4 }">
		<a style="margin-left:10px;background:url(images/adv_icon1.gif) no-repeat center left;" href="${list.url }">${list.name }</a>
	</c:if>

	<c:if test="${list.type!=4 }">
		<a href="${list.url }">${list.name }</a>
	</c:if>

	<c:if
		test="${requestScope.list!=null||fn:length(requestScope.list) > 0}">
		<s:action name="dex" executeResult="true">
			<s:param name="id">${list.id}</s:param>
		</s:action>
	</c:if>
	
</c:forEach>