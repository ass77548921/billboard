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
  <h1>Hello World!! Spring MVC</h1>
  <table><c:if test="${aass.size()>0}">
  	<thead>
  		<tr>
  			<th> test1</th>
  			<th> test2</th>
  		</tr></thead>
  		<tbody>
  		<c:forEach items="${aass}" var="result" varStatus="s">
					<tr>
						<td>${result.id}</td>
						<td>${result.title}</td>
						
					</tr>
				</c:forEach>
  		</tbody></c:if>
  </table>
</body>
</html>