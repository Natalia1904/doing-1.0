<%@ page language="java" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; UTF-8">
  <title>Медиа</title>
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
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
  
    <script type="text/javascript">
      $(function() {
          $("#eventDate").datepicker();
      });
  </script>
  
 </head>
 <body>
  <div id="container">
   <div id="header">Медиа -менеджер</div>
   <div id="sidebar">
   <p><a href="admin-users.html">Управление пользователями</a></p>
   <p><a href="admin-media.html">Медиа-менеджер </a></p>
   <p><a href="events.html">Новости</a></p>
   <p><a href="setting.html">Настройки</a></p>
   <p><a href="logout.html">Выход</a></p>
   </div>
   <div id="content">
    <h2>Создать мероприятие</h2>
    <ul>

	Заполните форму для создания события:

	<form:form method="post" action="save-event.html" modelAttribute="event">
		Введите название события:
		<form:input path="name" size="15" />
		<br></br>

		Введиде дату:
		<fmt:formatDate value="${event.date}" pattern="MM-dd-yyyy" var="eventDate"/>
		<form:input path="date" value="${eventDate}" id="eventDate" />
		<br></br>

		<%-- Введите город:
		<form:select path="address.sity.id">
			<c:forEach items="${allCities}" var="city">
				<form:option value='${city.id}'>
					<c:out value="${city.name}" />
				</form:option>
			</c:forEach>
		</form:select>
		<br></br>
		
		Введите улицу:
		<form:select path="address.street.id">
			<c:forEach items="${allStreets}" var="street">
				<form:option value='${street.id}'>
					<c:out value="${street.name}" />
				</form:option>
			</c:forEach>
		</form:select>
		<br></br>
		
		Введите дом:
		<form:input path="address.house" size="15" />
		<br></br>

		Введите квартиру:
		<form:input path="address.flat" size="15" />
		<br></br> --%>

        Опишите мероприятие:
        <form:textarea path="description"/>
        <br></br>

        <input name="add-ev" type="submit" value="Дабавить мероприятие"/>
	</form:form>
		
		<br><br><br><br><br>


 	<%-- 	</br>
	<table border="1">
        <tr>
            <th>Имя</th>
            <th>Событие</th>
            <th>Адрес</th>
        </tr>
        <c:forEach items="${allUsers}" var="u">
            <tr>
                <th>
                	<c:out value="${u.email}" />
				</th>
		 </c:forEach>
		 <c:forEach items="${allEvents}" var="e">
            <tr>
                <th>
                	<c:out value="${e.events}" />
				</th>
		 </c:forEach>
	</table> --%>
	
    <a href="add-cr.html">Выбрать</a><br></br>
    <a href="edit-red.html">Редактировать событие</a>
    <a href="del-ev.html">Удалить событие</a>
    <a href="list.html">Редактировать список событий</a>
      
    </form>
    </ul> 
   </div>
   <div id="footer">&copy; by.burim</div>
  </div> 
 </body>
</html>