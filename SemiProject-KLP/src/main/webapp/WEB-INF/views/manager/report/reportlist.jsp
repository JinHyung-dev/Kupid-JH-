<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kupid.manager.report.model.dto.Report" %>    
<%
	List<Report> report=(List<Report>)request.getAttribute("report");

	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
	String searchType=request.getParameter("searchType");
	String searchKeyword=request.getParameter("searchKeyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul{
   /* width:80%; */
   display:table;
   padding:0px;
   margin:auto;
}
ul li { 
   list-style-type: none; 
   width: 8em; 
   height: 2em;
   float: left; 
   text-align: center; 
   font-family: "휴먼모음T", sans-serif; 
   border-left: 1px #00bcd4 solid;
   background-color: #5283de; 
}
ul li:last-of-type{border-right:1px #00bcd4 solid;;}
ul li a {
   display: block;
   padding:.5em;
   text-decoration: none;
   color: #292929;
}

/* hover시 배경색 변경 */
ul li:hover{
   background-color: #3300ff;
}
ul li:hover > a{
   color:#FFF; /* 글자색*/
}
.report-container{
	display: flex;
	
}
.report-sec{
	width:85%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.table-size{
	width:85%;
	height:650px;
	font-size:30px;
	border :1px solid blue;
}
.section{
	width:95%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
<div class="report-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
	<div class="report-sec">
	<h1>신고 내역</h1>
	<h1>
			<div>
				<select id="searchType">
		       		<option value="reporting_member" <%=searchType!=null&&searchType.equals("reporting_member")?"selected":"" %>>신고한 회원</option>
		        	<option value="reported_member" <%=searchType!=null&&searchType.equals("reported_member")?"selected":"" %>>신고받은 회원</option>
	        	</select>
	        	<div id="search-reported_member">
					<form action="<%=request.getContextPath()%>/manager/searchreport.do">
						<input type="hidden" name="searchType" value="reported_member">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
				<div id="search-reporting_member">
					<form action="<%=request.getContextPath()%>/manager/searchreport.do">
						<input type="hidden" name="searchType" value="reporting_member">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
			</div> 
		</h1>
	<section class="section">
	<table class="table-size">
		<tr>
			<th>신고번호</th>
			<th>카테고리</th>
			<th>신고한회원</th>
			<th>신고받은회원</th>
			<th>신고날짜</th>
			<th>처리결과</th>
		</tr>
	
		<%if(report!=null){ %>
			<%for(Report rp : report){ %>
			<tr>
				<td style="text-align:center;"><%=rp.getReportNo() %></td>
				<td style="text-align:center;"><%=rp.getReportCategory()%></td>
				<td style="text-align:center;"><%=rp.getReportingId()%></td>
				<td style="text-align:center;"><%=rp.getReportedId() %></td>
				<td style="text-align:center;"><%=rp.getReportDate() %></td>	
				<td style="text-align:center;">
				<%if(rp.getReportResult()!=null){ %>
					<%=rp.getReportResult() %>
				<%}else{ %>
					<p>처리중...</p>
				<%} %>
				
				</td>	
				<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/reportview.do?no=<%=rp.getReportNo()%>')">(상세내용)처리</button></td>
			</tr>
			<%} 
		}else{%>
			<span>신고내역이 없습니다</span>
		<%} %>
	</table>
	</section>
		<div><%=pagebar %></div>
		</div>
	</div>
	<script>
	$(()=>{
		 $("#searchType").change();
	})


	$("#searchType").change(e=>{
			const type=e.target.value;
			$(e.target).parent().children("div").hide();
			$("#search-"+type).css("display","inline-block");
		})
	</script>
</body>
</html>