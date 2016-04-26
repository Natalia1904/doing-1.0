<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>Управление пользователями</title>
<style type="text/css">
   body {
    font: 10pt Arial, Helvetica, sans-serif; /* Шрифт на веб-странице */
    background: #e1dfb9; /* Цвет фона */
   }
   h2 {
    font-size: 1.1em; /* Размер шрифта */
    color: #800040; /* Цвет текста */
    margin-top: 0; /* Отступ сверху */
   }
   #container {
    width: 1300px; /* Ширина слоя */
    margin: 0 auto; /* Выравнивание по центру */
    background: #f0f0f0; /* Цвет фона левой колонки */
   }
   #header {
    font-size: 2.2em; /* Размер текста */
    text-align: center; /* Выравнивание по центру */
    padding: 5px; /* Отступы вокруг текста */
    background: #8fa09b; /* Цвет фона шапки */
    color: #ffe; /* Цвет текста */
   }
   #sidebar {
    margin-top: 10px; 
    width: 110px; /* Ширина слоя */
    padding: 0 10px; /* Отступы вокруг текста */
    float: left; /* Обтекание по правому краю */
   }
   #content {
    margin-left: 130px; /* Отступ слева */
    padding: 10px; /* Поля вокруг текста */
    background: #fff; /* Цвет фона правой колонки */
   }
   #footer {
    background: #8fa09b; /* Цвет фона подвала */
    color: #fff; /* Цвет текста */
    padding: 5px; /* Отступы вокруг текста */
    clear: left; /* Отменяем действие float */
   }

  </style>
 </head>

<body> 
   <div id="container">
   <div id="header">Управление пользователями</div>
   <div id="sidebar">
    <p><a href="admin-events.html">Управление событиями </a></p>
    <p><a href="admin-media.html">Медиа-менеджер</a></p>
    <p><a href="events.html">Новости</a></p>
     <p><a href="setting.html">Настройки</a></p>
     <p><a href="logout.html">Выход</a></p>
   </div>
   <div id="content">
   <h2>Таблицы</h2>
   
   <table border="1">
        <tr>
            <th>email</th>
            <th>Пароль</th>
            <th>В черном списке?</th>
            <th>Роль</th>
        </tr>
        <c:forEach items="${allUsers}" var="u">
            <tr>
                <th>
                	<c:out value="${u.email}" />
				</th>
                <th>
                	<c:out value="${u.password}" />
				</th>
                <th>
                	<c:choose>
                		<c:when test="${u.enabled == true}">Нет</c:when>
                		<c:otherwise>Да</c:otherwise>
                	</c:choose>
				</th>
                <th>
                	<c:out value="${u.role.roleName}" />
				</th>				
				<th>
				    <a href="del-user.html?userId=${u.id}">Удалить </a>
                </th>
				<th>
				    <a href="edit-user.html?userId=${u.id}">Редактировать</a>	
				</th>
				<th>
				    <a href="blacklist.html">Занести в черный список</a>	
				</th>
				<th>
                    <a href="send-message.html?userId=${u.id}">Отправить сообщение</a>
				</th>
            </tr>        
        </c:forEach>
    </table>
    <br></br>
    Введите данные:
        <br>
        <sf:form method="post" action="save-user.html" modelAttribute="user">
        	<sf:hidden id="userId" path="id" size="15" />

        	<table>
        		<tr>
        			<td>
        				<sf:label path="email">E-mail:</sf:label>
        			</td>
        			<td>
        				<sf:input path="email" size="15" />
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<sf:label path="password">Пароль:</sf:label>
        			</td>
        			<td>
        				<sf:input path="password" size="15" />
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<sf:label path="password">Активный?:</sf:label>
        			</td>
        			<td>
        				<sf:checkbox path="enabled" />
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<sf:label path="role.id">Роль:</sf:label>
        			</td>
        			<td>
			        	<sf:select path="role.id">
							<c:forEach items="${allRoles}" var="role">
								<sf:option value='${role.id}'>
									<c:out value="${role.roleName}" />
								</sf:option>
							</c:forEach>
						</sf:select>
        			</td>
        		</tr>
        		<tr>
        			<td colspan="2">
        				<input name="saveUser" type="submit" value="Сохранить пользователя"/>
        			</td>
        		</tr>

        	</table>       	
        </sf:form>
        <br/>
    <br></br>

</body>
</html>