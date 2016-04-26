<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>Администратор</title>
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

<script src="js/jquery-1.6.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var prefix = 'users.html';
 
    var RestGet = function() {
        $.ajax({
            type: 'GET',
            url:  prefix,
            dataType: 'json',
            async: true,
            success: function(result) {
                alert('Время: ' + result.time
                        + ', сообщение: ' + result.message);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert(jqXHR.status + ' ' + jqXHR.responseText);
            }
        });
    }
</script>

</head>
<body>
	<div id="container">
		<div id="header">Rest</div>
		<div id="sidebar">
			<p>
				<a href="#" onclick="RestGet()">Получить данные</a>
			</p>
		</div>
		<div id="content">
			<h2>Администратор:</h2>
		</div>
		<div id="footer">&copy; by.burim</div>
	</div>
</body>
</html>