<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cross.jsp</title>
<style type="text/css">
body{
   background-image:url('/media/alpha.png'), url('/media/favicon_small.png');
}

#surface{
  border-collapse: collapse;
  font-family: monospace;
  font-size: 150%;
  
  border: 20px outset red;  /*outset, inset*/
}

#surface td{
  opacity: 0.9;
}

</style>
<script type="text/javascript">

  
  
  function sleep(millis){
	  return new Promise(function(resolve, reject) {
	  		setTimeout(resolve, millis);
	  });
  }
  
  class Cross{
	  
	  
	  
	  constructor(){
		this.direction = parseInt(Math.random()*4);
		this.speed = Math.random()*300 + 10;
	  }
	  
	  show(){
		 let td = surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		 td.style.color = this.alpha.fg;
		 td.style.background = this.alpha.bg;
		 td.innetText = this.alpha.ch;
	  }
	  
	  hide(){
		 let td = surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		 td.style.color = 'black';
		 td.style.background = 'black';
	  }
	  
	  move(){
		   
		  this.hide();
		  switch(this.direction){
		   case 0:
	    	   this.alpha.column++;
	    	   break;
	       case 1:
	    	   this.alpha.line++;
	    	   break;
	       case 2:
	    	   this.alpha.column--;
	    	   break;
	       case 3:
	    	   this.alpha.line--;
	    	   break;
		  }
		  
		  let alpha = this.alpha;
		  if(alpha.line==0 || alpha.column==0
				  || alpha.line==21 || alpha.column==41)
			  return false;
		  
		  
		  this.show();
		  return true;
	  }
//	  cnt = 0;
	  async run(){
		  let response = await fetch('/alpha/data');  //let이 없으면 전역변수.. 전역변수는 가능하면 사용지양..
		  this.alpha = await response.json();
		  this.alpha.line = 10;
		  this.alpha.column = 20;
//		  console.log(this.alpha);
		  
		  this.show();    //자바스크립트는 this를 반드시 줘야 한다 자바처럼 생략 불가능
		  
		  
		  for(;;){
			  await sleep(this.speed);
			  if(!this.move())       
				  break;        //밑에 if문과 결과는 같다
//			  if(this.move() == false)
//				  break;
			 
//			  this.move();
			  
//			  await sleep(1000);
//			  this.hide();
//			  this.alpha.column++;
//			  this.show();
//			  async가 없으면 밑에 있는 cross.run()호출시.. 브라우져는 먹통이 되어버린다 여기서 무한루프에 빠져서..
//			  하지만 이것이 async await가되면 비동기로 동작하여 괜찮다, 그래서 마치 셋인터벌 타이머처럼 사용 가능하다
//			  console.log(this.cnt++);
//               if(this.alpha.line == 1 || this.alpha.column == 1
//             	 || this.alpha.line == 20 || this.alpha.column == 40){
//             	 break;
//               }
		  }
	  }
	  
  }
  
  window.onload = () => {
	  var cbox = document.getElementById("auto");
	  if(cbox.checked == true){
	  createBtn.onclick = () =>{
		 for(;;){
		 let cross = new Cross();
		 cross.run();
		 }
	   }
	 }else{
	  createBtn.onclick = () =>{
		 let cross = new Cross();
		 cross.run();
	 }
  }
  }
</script>
</head>
<body>
<h1>async/await + class</h1>
<hr>
<button id="createBtn">Create</button>
<input id="auto" type="checkbox" name="auto">
<label for="auto">Auto</label>
<hr>
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
 <tbody>
  
  <c:forEach var="i" begin="0" end="${surface.size()-1}"> 
   <tr>
    <c:forEach var="alpha" items="${surface[i]}">
      <td style="color: black; background: black;">${alpha.ch}</td>
      
    </c:forEach>
   </tr>
<%--    ${surface[i]}<br>    --%>
<%--   <c:forEach var="list" items="${surface}"> --%>
<%--    ${list}<br>     이것도 위의  ${surface[i]}<br>과 같은 결과가 나온다--%>
  </c:forEach> 
 </tbody>
</table>
</body>
</html>