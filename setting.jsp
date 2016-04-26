<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; UTF-8">
     <link href="style/layout02.css" rel="stylesheet">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <title>Настройки</title>
     <style type="text/css">
</head>
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
   <div id="header">Настройки </div>
   <div id="sidebar">
    <p><a href="admin-users.html">Управление пользователями</a></p>
    <p><a href="admin-events.html">Управление событиями </a></p>
    <p><a href="admin-media.html">Медиа-менеджер</a></p>
    <p><a href="events.html">Новости</a></p>
    <p><a href="logout.html">Выход</a></p>
   </div>
   <div id="content">
    <h2>Таблицы</h2>
    <ul>
     
<table border="1">
        <tr>
            <th>City Name</th>
            <th>All Streets</th>
            <th>Operation City</th>
        </tr>
        <c:forEach items="${allSity}" var="s">
            <tr>
                <th>
                	<c:out value="${s.name}" />
				</th>
				<th>
					<ul>
						<c:forEach items="${s.streets}" var="curStreet">
							<li>
								<c:out value="${curStreet.name}" />
							</li>
						</c:forEach>
					</ul>
				</th>
				<th>
					<a href="del-city.html?cityId=${s.id}">Delete</a>
                	<a href="edit-city.html?cityId=${s.id}">Edit</a> <!-- поменять s -->
                	
				</th>
            </tr>        
        </c:forEach>
    </table>
    <br></br>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>City Name</th>
            <th>Operation Streets</th>    
        </tr>
        <c:forEach items="${allStreets}" var="st">
            <tr>
                <th>
                	<c:out value="${st.name}" />
				</th>

				 <th>
                	<c:out value="${st.city.name}" />
				</th> 
				
				<th>
                	<a href="del-street.html?streetId=${st.id}">Delete</a>
                	<a href="edit-street.html?streetId=${st.id}">Edit</a> <!-- поменять st -->
				</th>
            </tr>        
        </c:forEach>
    </table>
    <br></br>
     
	<a href="add-streets.html">Добавить улицу</a>
    <a href="add-city.html">Добавить город</a>
    
    </ul> 
   </div>
   <div id="footer">&copy; by.burim</div>
  </div> 
 </body>
</html>