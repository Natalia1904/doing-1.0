<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>Отправка сообщений</title>
</head>
<body>
Введите данные:
        <br>
        <sf:form method="post" action="send-message.html" modelAttribute="email">

        	<table>
        	
        		<tr>
        			<td>
        				<sf:label path="emailFrom">От кого:</sf:label>
        			</td>
        			<td>
        				<sf:input path="emailFrom" size="15" />
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<sf:label path="emailTo">Кому:</sf:label>
        			</td>
        			<td>
        				<sf:input path="emailTo" size="15" />
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<sf:label path="subject">Тема:</sf:label>
        			</td>
        			<td>
        				<sf:input path="subject" size="15" />
        			</td>
        		</tr>
        		<tr>
        			<td colspan="2">>
        			<sf:textarea path="emailText" cols="25" id="description" rows="10"/>
        			</td>
        		</tr>
        		<tr>
	        		<td colspan="2">
	        	        	<input name="send_email_btn" type="submit" value="Отправить Сообщение"/>
	        				
	        				<input name="cancel_btn" type="submit" value="Отменить"/>
	        		</td>
        		</tr>
        	</table>       	
        </sf:form>
</body>
</html>