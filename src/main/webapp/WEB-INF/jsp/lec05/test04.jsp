<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>회원 정보 리스트</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>NO</th>
					<th>이름</th>
					<th>전화 번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${members }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${member.name }</td>
						<td>
							<c:choose>
								<%-- 
									{fn} 안에 {멤버변수} 사용이 안됨 -> 괄호 범위 중복인듯(해결완료) 
									조건문 통제 오류 -> '조건문' 수정 필요(해결완료)
								--%>
								<c:when test="${fn:substring(member.phoneNumber, 0, 3) ne '010'}">
									유효하지 않은 전화번호
								</c:when>
								<c:otherwise>
									${member.phoneNumber }
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							${fn:substring(member.nationality, 0, 2) } - ${fn:split(member.nationality, " ")[1] }
						</td>
						<td>
							<b>${fn:split(member.email, "@")[0] }</b>@${fn:split(member.email, "@")[1] }
						</td>
						<td>
							${fn:substring(member.introduce, 0, 15)} ...
						</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
	
	</div>
</body>
</html>