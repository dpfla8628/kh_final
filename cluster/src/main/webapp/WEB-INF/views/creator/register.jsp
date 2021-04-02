<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 추가 페이지</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnRegister").on("click", function(){
			self.location = "/creator/registerForm"
		})
	});
</script>
<body>
	<c:import url="/WEB-INF/views/creator/header.jsp"></c:import>
    <article>
		<h2># 신청 강의 검수 상황</h2>    		
    	
    	<table border="1">
		<tr>
			<th align="center" width="80">번호</th>
			<th align="center" width="320">강의명</th>
			<th align="center" width="150">신청일</th>
			<th align="center" width="150">진행상황</th>
			<th align="center" width="150">상태</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td align="center" colspan="5">
						검수 신청한 강의가 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="offclass">
					<tr>
						<td align="center">${offclass.classNo}</td>
						<td align="left">
							<a href="/creator/read?classNo=${offclass.classNo}">
								${offclass.className}
							</a>
						</td>
						<td align="center">${offclass.classStart}</td>
						<td align="center">${offclass.classEnd}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>			
    
    <div class="right">
    	<button type="button" id="btnRegister">신규강의 신청</button>
    </div>		
    </article>
    <c:import url="/WEB-INF/views/creator/footer.jsp"></c:import>  
</body>
</html>