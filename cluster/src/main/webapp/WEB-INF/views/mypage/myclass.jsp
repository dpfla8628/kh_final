<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"/>

<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/mypage/template/header.jsp"></jsp:include>

<style>
	.table:not(.table-bordered) thead tr th{
		background-color: orange;
    	color: white;
    	font-weight: bold;
	}
	img{
		width: 155px;
   		height: 110px;
	}
	.btn-group mb-0{
		float: right;	
	}
</style>

<script>
$(document).ready(function(){
	$(document).on("click","#test",function(){
		alert("test");
	})
	$(document).on("click","#test1",function(){
		alert("test1");
	})
}))
</script>


<jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>


<div class="col-lg-6">
  <div class="grid">
    <p class="grid-header">나의 클래스</p>
    <div class="item-wrapper">
      <div class="table-responsive">
        <div class="btn-group mb-0">
           <label class="btn btn-outline-info active">
             <input type="radio" name="options" id="option1_1" checked>
             	현재강의
           </label>
           <label class="btn btn-outline-info" id="test">
             <input type="radio" name="options" OnClick="window.location.href='/mypage/myclassend';">
             	지난 강의
           </label>
         </div>
        <table class="table table-striped">
          <thead>
            <tr>
              <th>강의 이미지</th>
              <th>강의 명</th>
              <th>만료일</th>
              <th>강의 연락처</th>
            </tr>
          </thead>
          <tbody>
          <!-- 주의!!! 클래스 후기 작성은 한 클래스당 하나만 작성 가능하다 !!!!!! 두개의 클래스를 넣고 작성하려는 경우에는 에러 남 -->
          <c:forEach items="${orderList}" var="orderlist">				
          <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
		<fmt:formatDate value="${orderlist.classEnd }" pattern="yyyy-MM-dd" var="write_dt"/>
          <c:if test="${today <= write_dt}" >
           <c:if test="${orderlist.orderOk eq '입금완료'}" >
            <tr>       
              <td><img src="../resources/image/test.PNG"></td><!-- 강의 이미지 넣기 !! -->
              <td><a href="#">${orderlist.className}</a></td><!-- 클릭하면 강의 상세페이지로 이동 -->
              <td>~${orderlist.classEnd} </td><!-- 오늘 날짜 기준으로 넘어가면 classend로 ~ !!! -->
              <td>${orderlist.classTalk }</td>
            </tr>
            </c:if>
            </c:if>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>