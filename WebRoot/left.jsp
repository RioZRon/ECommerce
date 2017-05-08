<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:forEach var="list" items="${requestScope.list }">
	<li><a href="${list.url }">${list.name }</a></li>
</c:forEach>
