<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<h1>${ee.id }번 고객 수정</h1>
	<div>
		<form action="/sub24/link7" method="post">
			<input type="hidden" name="id" value="${ee.id }"/>
			라스트 네임 <input type="text" name="lastName" value="${ee.lastName }"/> <br />
			퍼스트 네임 <input type="text" name="firstName" value="${ee.firstName }"/> <br />
			생년월일 <input type="text" name="birth" value="${ee.birth }"/> <br />
			포토 <input type="text" name="photo" value="${ee.photo }"/> <br />
			노트 <input type="text" name="notes" value="${ee.notes }"/> <br />
			<input type="submit" value="수정" />
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>