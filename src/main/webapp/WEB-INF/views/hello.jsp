<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HelloWorld</title>
	</head>
	<body>
		<div>
		  <table id="billboard_table"><c:if test="${aass.size()>0}">
		  	<thead>
		  		<tr>
		  			<th> 標題</th>
		  			<th> 發佈日期</th>
		  			<th> 截止日期</th>
		  			<th> 修改</th>
		  			<th> 刪除</th>
		  		</tr></thead>
		  		<tbody>
		  		<c:forEach items="${aass}" var="result" varStatus="s">
							<tr>
								<td>${result.title}</td>
								<td>${result.publishdate}</td>
								<td>${result.enddate}</td>
								<td>a</td>
								<td>b</td>
							</tr>
						</c:forEach>
		  		</tbody></c:if>
		  </table>
	  	</div>
	  	<div>
	  		<button onclick="add()">新增</button>
	  		<button onclick="deletechoose()">刪除</button>
	  	</div>
	  
	</body>
</html>