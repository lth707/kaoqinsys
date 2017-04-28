<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<h1>
	<c:if test="${message==null}">
该页面不存在
</c:if>
	<c:if test="${message!=null}">
${message}
</c:if>
</h1>
<c:if test="${jump!=null}">
	<script>
		location = '${jump}';
	</script>
</c:if>
