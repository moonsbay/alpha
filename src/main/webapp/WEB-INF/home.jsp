<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>

<link rel="icon" type="image/png" href="favicon.png"/>
<link rel="stylesheet" href="/css/cube.css">

<style type="text/css">
/*
nav{
  border:1px solid black;
}

ul{
   border:1px solid red;   */
/*    margin:0px; */
/*}

ol{
   border:1px solid blue;
}

li{
   border:1px solid green;
}

li>div, li>a{
   border:5px solid purple;
} */

	.menu{
	  display:flex;
	  list-style: none;
	  
	  align-items:flex-start;
	  position:fixed;
	  width:90%;
	  top:10px;
	  left:10px;
	}
	
	.menu-item{
/* 	  float:left; 예전 메뉴 가로 배치 방법 */
/*      min-width:150px;   하위메뉴로 메뉴의 폭이 유동적인 것을 막아줌*/
       width:150px;
       flex-shrink: 0;   /*하위메뉴로 메뉴의 폭이 유동적인 것을 막아줌 위와 동일 */
       background:orange;
	}
	
	.menu-title a{
	  display:block;
	  text-decoration: none;
	  color:black;
	}
	
	.menu-item:hover > .sub-menu{
/* 	  display:block; */
	  max-height:250px;
	  transition:max-height 2s;
	}
	
	.menu-item:hover > .menu-title{
	  text-shadow:10px 10px 5px red;
	}
	
	.menu-item:nth-last-child(2){
	  margin-left:auto;
	  margin-right:2px;
	}
	
	.menu-title{
	   padding:10px;
	   font-size:15px;
	}
	
	.sub-menu{
	   max-height:0px;
	   overflow:hidden;
	   list-style: none;
 	   padding-left: 20px; 
	}
	
	.sub-menu-item{
	   
	}
	
	.sub-menu-item > a{
	    display:block;
	    padding:10px;
	    font-size:12px;
	    text-decoration: none;
	    color:black;
	    
	}
	
	.sub-menu-item:hover > a{
	    background:red;
	}
	
	iframe{
	    margin-top: 100px;
	}
</style>
<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>

<script type="text/javascript">
function resize(){
	let iframe = document.querySelector('iframe');
	iframe.style.height = getComputedStyle(iframe.contentDocument.documentElement).height;
  }
// window.onload = function(){
// 	setInterval(resize, 100);
// }
  $(document).ready(function(){
	setInterval(resize, 100);
   });
</script>
</head>
<body>

<nav>
  <ul class="menu">
    <li style="padding:0px 20px;">
    <section class="perspective">
    <article class="cube">
     <div class="base">Base</div>
     <div class="base front">Front</div>
     <div class="base back">Back</div>
     <div class="base left">Left</div>
     <div class="base right">Right</div>
     <div class="base top">Top</div>
     <div class="base bottom">Bottom</div>
    </article>
    </section>
    </li>
    <li class="menu-item">
      <div class="menu-title">Alpha</div>
      <ol class="sub-menu">
        <li class="sub-menu-item"><a target="content" href="/alpha/fill">fill</a></li>
        <li class="sub-menu-item"><a target="content" href="/alpha/cross">cross</a></li>
        <li class="sub-menu-item"><a target="content" href="/alpha/race">race</a></li>
        <li class="sub-menu-item"><a target="content" href="/alpha/zigzag">zigzag</a></li>
        <li class="sub-menu-item"><a target="content" href="/alpha/earthworm">earthworm</a></li>
      </ol>
    </li>
    <li class="menu-item">
      <div class="menu-title">Animation</div>
      <ol class="sub-menu">
        <li class="sub-menu-item"><a target="content" href="/ani/fill">fill</a></li>
        <li class="sub-menu-item"><a target="content" href="/ani/cross">cross</a></li>
        <li class="sub-menu-item"><a target="content" href="/ani/race">race</a></li>
        <li class="sub-menu-item"><a target="content" href="/cube.jsp">cube</a></li>
        <li class="sub-menu-item"><a target="content" href="/placeholder.jsp">placeholder</a></li>
      </ol>
    </li>
    <li class="menu-item">
      <div class="menu-title">React</div>
      <ol class="sub-menu">
        <li class="sub-menu-item"><a target="content" href="/fill.jsp">fill</a></li>
        <li class="sub-menu-item"><a target="content" href="/sort.jsp">sort</a></li>
        <li class="sub-menu-item"><a target="content" href="/move.jsp">move</a></li>
        <li class="sub-menu-item"><a target="content" href="/flow.jsp">flow</a></li>
        <li class="sub-menu-item"><a target="content" href="/ping.jsp">ping</a></li>
    
      </ol>
    </li>
    <li class="menu-item">
      <div class="menu-title">Employee</div>
      <ol class="sub-menu">
        <li class="sub-menu-item"><a target="content" href="/dept/list">dept</a></li>
        <li class="sub-menu-item"><a target="content" href="/emp/list">emp</a></li>
        <li class="sub-menu-item"><a target="content" href="/salgrade/list">salgrade</a></li>
    
      </ol>
    </li>
    <li class="menu-item">
      <div class="menu-title">City</div>
      <ol class="sub-menu">
        <li class="sub-menu-item"><a target="content" href="/city/list">city</a></li>
        <li class="sub-menu-item"><a target="content" href="/country/list">country</a></li>
        <li class="sub-menu-item"><a target="content" href="/language/list">language</a></li>
        <li class="sub-menu-item"><a target="content" href="/search">search</a></li>
      </ol>
    </li>
   
    <sec:authorize access="isAnonymous()">
    <li class="menu-item">
      <div class="menu-title">
        <a href="/login">Login</a>
      </div>
    </li>
     <li class="menu-item">
      <div class="menu-title">
        <a href="/register">Register</a>
      </div>
    </li>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
    <li class="menu-item">
      <div class="menu-title">
        <a href="/logout">Logout</a>
      </div>
    </li>
    <li class="menu-item">
      <div class="menu-title">
        <a href="#"><sec:authentication property="name"/></a>
      </div>
    </li>
    </sec:authorize>
  </ul>
</nav>

<iframe src="/alpha/fill" 
        name="content" 
        width="100%"
        scrolling="no"
        frameborder="0"
        sendbox="allow-same-origin"  
        onload = "resize()"
        >
iframe태그를 지원하지 않는 브라우저는 이 글이 보인다
</iframe>
</body>
</html>