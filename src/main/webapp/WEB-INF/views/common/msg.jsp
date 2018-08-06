<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!doctype html>
<c:set var='path' value="${pageContext.request.contextPath}"/> 

<html>
	<head>
		<meta charset="UTF-8">
		<title>알림</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			alert('${msg}');
			location.href="${path}/${loc}";
		</script>
	</head>
	<body>
	
	</body>
</html>