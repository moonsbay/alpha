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
/*    background-image:url('/media/alpha.png'), url('/media/favicon_small.png'); */
}
div{
   border : 5px solid red;
   height : 400px;
   width : 400px;
}
.back{
   position : relative;
   border : 5px solid red;
   height : 400px;
   width : 400px;
}
.front{
   position : relative;
   bottom : 220px;
   left   : 190px;
   border : 5px solic black;
   height : 20px;
   width  : 20px;
   transition:left 2s, top 2s, transform 4s;
}
#surface{
  border-collapse: collapse;
  font-family: monospace;
  font-size: 150%;
  
  border: 20px outset red;  /*outset, inset*/
}

#surface td{
  opacity: 0.2;
  position:relative;
     
  top:0px;
  left:0px;
  transition:left 2s, top 2s, transform 4s;
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
// 		this.speed = Math.random()*300 + 10;
	  }
	  show(){

	  }
	  hide(){
		 
	  }
	  move(){
		  let div = document.createElement("div");
		  div.setAttribute("class", "front");
		  document.querySelector("#body").append(div);
// 		  div.style.left = "380px";
// 		  div.className = 'front';
// 		  let text = this.documment.createTextNode('Front');
// 		  div.appendChild(text);
// 		  this.document.body.appendChild(div);
// 		  div.style.height = 
//		  let td = document.querySelector(".front") 
// 		  this.hide();
// 		  switch(this.direction){
// 		   case 0:
// 			   div.style.left = "380px";
// 	    	   break;
// 	       case 1:
// 	    	   div.style.top = "380px";
// 	    	   break;
// 	       case 2:
// 	    	   div.style.left = "0px";
// 	    	   break;
// 	       case 3:
// 	    	   div.style.top = "0px";
// 	    	   break;
// 		  }
		  

	  }
	 
	  async run(){
		  let response = await fetch('/ani/data');  //let이 없으면 전역변수.. 전역변수는 가능하면 사용지양..
			  this.move();
//			  await sleep(1000);
	  }
	  
  }
  
  window.onload = () => {
	  var cbox = document.getElementById("auto");
	  createBtn.onclick= ()=>{
	    	if(cbox.checked == true){
	    	  var inf = setInterval(function(){
	    		  let cross = new Cross();
	    		  cross.run();
	    		  if(cbox.checked == false)
	    			  clearInterval(inf);
	    	  }, 500)
	    	}else{
	    		let cross = new Cross();
				cross.run();
// 				this.div.style.left = "380px";
	    	}
	     }
  }
</script>
</head>
<body id="body">
<h1>async/await + class</h1>
<h1>Cross</h1>
<hr>
<button id="createBtn">Create</button>
<input id="auto" type="checkbox" name="auto">
<label for="auto">Auto</label>
<hr>
<div class="back">cross</div>
<!-- <div class="front">F</div> -->
</body>
</html>