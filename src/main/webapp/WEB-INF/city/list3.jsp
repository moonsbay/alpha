<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %> <!-- 인구란의 숫자에 000,000,000 이런 형식으로 나오게 하기 위함 -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list3.jsp</title>
<style type="text/css">
tbody > tr:nth-child(2n){   /* tr :nth사이 스페이스가 있으면 결과는 달라짐..스페이스가 있으면 행이 아니고 열이 한칸식 바뀌네.. */
	background: orange;
}

</style>
<script type="text/javascript">
window.onload = function(){
	
	population.oninput = function(e){
		let value = parseInt(e.target.value);
		pop_value.innerText = value.toLocaleString();
	}
	
	pop_value.innerText = parseInt(populaion.value).toLocaleString();
}

</script>
</head>
<body>
<h1>City List3</h1>
<hr>
<form action="/city/list">
<fieldset>
  <legend>code</legend>
  <input name="code" value="${param.code}" type="search" list="codes">
  <datalist id="codes">
  <c:forEach var="c" items="${codes}">
    <option value="${c.code}">[${c.code}] ${c.name}</option>
  </c:forEach>
  </datalist>
</fieldset>
<fieldset>
  <legend>population</legend>
  <input id="population" name="population" value="${empty param.population ? 0 : param.population}"  type="range" min="0" max="10000000" step="100000">
<%--   <label><span id="pop_value">${param.population}</span>이상</label> --%>
   <label><span id="pop_value"></span>이상</label>
</fieldset>
<input type="submit" value="도시검색">
</form>
<hr>
<table border="1">
	<thead>
		<tr>
		 <th>no</th>
		 <th>id</th>
		 <th>name</th>
		 <th>countryCode</th>
		 <th>district</th>
		 <th>population</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="city" items="${list}" varStatus="status" >
	  <tr>
	   <td> ${status.count}</td>
	   <td> ${city.id}</td>
	   <td> ${city.name}</td>
	   <td> ${city.countryCode}</td>
	   <td> ${city.district}</td>
	   <td align="right"> ${city.population}</td>
	   <td> <fmt:formatNumber pattern="###,###,###" value="${city.population}"/></td>
	  </tr>
	</c:forEach>
	
	</tbody>
</table>
</body>
</html>