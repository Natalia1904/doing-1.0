<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>Добавить улицу</title>
</head>
<body>
	Введите название улицы:
	<br>
	<sf:form method="post" action="save-street.html" modelAttribute="street">
		<sf:input path="name" size="15" />
		<p> 	
		<sf:select path="city.id">
			<c:forEach items="${allSities}" var="city">
				<sf:option value='${city.id}'>
					<c:out value="${city.name}" />
				</sf:option>
			</c:forEach>
		</sf:select>
		</p>
		
		<input name="saveStreet" type="submit" value="Сохранить"/>
	</sf:form>

	<br/>

</body>
</html>