<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<!--  <style>
    section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    </style> -->

<section id="customer-container">
	<form action="<%=request.getContextPath()%>/inquiry/inquirywriteend.do" method="post" enctype="multipart/form-data">
	<table id="tbl-customer">
	<tr>
		<th>제 목</th>
		<td><input  class="form-control" type="text" name="title" required></td>
	</tr>
	<tr>
		<tr>
			<th>문의 내용</th>
			<td><textarea class="form-control"  cols="47" rows="10" name="content" style="resize:none"></textarea>"</td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td><input class="form-control" type="file" name="upfile" ></td>
		</tr>
		<tr>
			<th>회원 번호</th>
			<td><input class="form-control" type="text" name="inq_member" value="<%=loginMember.getMemberNo()%>"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="form-control" type="submit" value ="접수하기"  onclick="">
			</th>
		</tr>

		
			
		
	</table>
	</form>
</section>
<%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>