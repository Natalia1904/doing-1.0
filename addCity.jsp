<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>Добавить город</title>
</head>
<body>
		Введите название города:
        <br>
        <sf:form method="post" action="save-city.html" modelAttribute="city">
        	<sf:hidden path="id" />
        	<sf:input path="name" size="15" />
        	<input name="saveCity" type="submit" value="Сохранить"/>
        </sf:form>
        <br/>
</body>
</html>