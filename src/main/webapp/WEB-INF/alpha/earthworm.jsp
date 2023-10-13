<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>earthworm.jsp</title>
<link rel="stylesheet" href="/css/earthworm.css">
<script type="text/javascript" src="/js/earthworm.js"></script> 
</head>
<body>
<h1>ZigZag class + fetch + async/await</h1>
<h2>external javascript로 만들기(zigzag.js)</h2>
<hr>
<button id="btnCreate">Create</button>
<hr>
<table id="surface">
  <tbody>
    <c:forEach var="list" items="${surface}">
      <tr>
        <c:forEach var="alpha" items="${list}">
          <td style="color:white; background:white">${alpha.ch}</td>
        </c:forEach>
      </tr>
    </c:forEach>
  </tbody>
</table>
</body>
</html>