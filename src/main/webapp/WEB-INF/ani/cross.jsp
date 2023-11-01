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
   opacity : 0.5;
   position : relative;
   border : 5px solid red;
   height : 400px;
   width : 400px;
   transition:height 2s, width 2s, transform 2s, backgroundColor 2s;
}
.front{
   position : absolute;
   top : 170px;
   left   : 190px;
   border : 5px solic black;
   height : 20px;
   width  : 20px;
/*    background-color: #00FF99; */
/*    transition: top 4s; */
   transition:left 1s, top 1s, bottom 1s, transform 1s, backgroundColor 1s;
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
 		this.color = parseInt((Math.random()*0xffffff));
		this.bcolor = this.color.toString(16);
// 		this.color = Color[parseInt(Math.random()*8)];
		this.speed = Math.random()*300 + 10;
		this.front = document.createElement("div");
		this.back = document.querySelector(".back")
	  }
	  
	  show(){
// 		  let div = document.createElement("div");
		  this.front.setAttribute("class", "front");
		  document.querySelector(".back").append(this.front);
// 		  this.back.style.backgroundColor = '#'+this.bcolor;	 
	
// 		  this.front.style.top = "150px";
//           console.log(this.bcolor);
	  }	
	  
	  hide(){
		  
	  }
	  move(){
		  
	  			
// 	      this.back.style.height = "200px";	
// 	      this.back.style.width = "200px";
          
// 		  this.back.style.transform = `rotate(\${360}deg)`;
// 		  let div = document.createElement("div");
// 		  this.div.setAttribute("class", "front");
// 		  document.querySelector("#body").append(div);
// 		  let div = document.querySelector(".front");
// 		  div.style.left = "380px";      //right
//        div.style.left = "0px";        //left
// 		  div.style.top = "-30px";       //bottom
// 		  div.style.top = "-410px";      //top
// 		  div.style.bottom = "30px";      //bottom
// 		  div.style.bottom = "410px";      //top
//           console.log(this.direction);
// 		  div.className = 'front';
// 		  let text = this.documment.createTextNode('Front');
// 		  div.appendChild(text);
// 		  this.document.body.appendChild(div);
// 		  div.style.height = 
//		  let td = document.querySelector(".front") 
// 		  this.hide();
		  switch(this.direction){
		   case 0:
			   this.front.style.left = "375px";
			   this.front.style.transform = `rotate(\${360*3}deg)`;
			   this.front.style.backgroundColor = '#'+this.bcolor;
	    	   break;
	       case 1:
	    	   this.front.style.top = "375px";
	    	   this.front.style.transform = `rotate(\${360*3}deg)`;
	    	   this.front.style.backgroundColor = '#'+this.bcolor;
	    	   break;
	       case 2:
	    	   this.front.style.left = "0px";
	    	   this.front.style.transform = `rotate(\${360*3}deg)`;
	    	   this.front.style.backgroundColor = '#'+this.bcolor;
	    	   break;
	       case 3:
	    	   this.front.style.top = "0px";
	    	   this.front.style.transform = `rotate(\${360*3}deg)`;
	    	   this.front.style.backgroundColor = '#'+this.bcolor;
	    	   break;
		  }
		  
		  return true;
		  
	  }
	  
	  remove(){
		  if(document.querySelector(".front").offsetLeft==375 ||
		     document.querySelector(".front").offsetLeft==0 ||
			 document.querySelector(".front").offsetTop==375 ||
			 document.querySelector(".front").offsetTop==0)
	  			
			  this.front.remove();
		  
		  
	  }
	 
	   run(){  //async
// 		  let response = await fetch('/ani/data');  //let이 없으면 전역변수.. 전역변수는 가능하면 사용지양..
// 		  let div = document.createElement("div");
// 		  div.setAttribute("class", "front");
// 		  document.querySelector("#body").append(div);
// 		  this.show();
		  this.move();
		  return 1;
// 		  div.style.left = "380px";
// 		  await sleep(1000);
	  }
	  
  }
  
  window.onload = () => {
	  var cbox = document.getElementById("auto");
	  let num = 0;
	  createBtn.onclick= ()=>{
// 		      let div = document.createElement("div");
// 	  		  div.setAttribute("class", "front");
// 	  		  document.querySelector(".back").appendChild(div);
// 	  		  div.style.bottom = "-150px";
		    
	    	if(cbox.checked == true){
	    		let inf = setInterval (function(){
	    		let cross = new Cross();
	    		cross.show();
	 	  		setTimeout (function(){
	 	  			
	 	  			cross.move();
	 	  		},2000);
	 	  		setTimeout (function(){
	 	  		cross.remove();
	 	  		
	 	  		if(cbox.checked == false)
	    			  clearInterval(inf);
	 	  		},4000);
	    	
	    	  }, 500)
	    	}else{
// 	    		let front = document.createElement("div");
// 	 	  		  front.setAttribute("class", "front");
// 	 	  		  document.querySelector(".back").appendChild(front);   //  append(div);
// 	 	  		  front.style.bottom = "-150px";
	 	  		let cross = new Cross();
	 	  		cross.show();
	 	  		
	 	  		setTimeout (function(){
	 	  			cross.move();
// 	 	  			cross.front.style.left = "400px";
	 	  		},2000);
	 	  		setTimeout (function(){
	 	  		console.log(document.querySelector(".front").offsetLeft);
	 	  		console.log(document.querySelector(".front").offsetTop);
	 	  		cross.remove();
// 	 	  		if(document.querySelector(".front").offsetLeft==400)
// 	 	  			cross.front.remove();
	 	  		    
	 	  		},4000);
// 	 	  		let su = 0; 
// 	 	  		let cross = new Cross();
// 	 	  	    if(num > su){
// 	 	  	    	cross.run();
// 	 	  	    	console.log(cross.run() == 1);
// 	 	  	        if(cross.run() == 1)
// 	 	  	        	div.removeAttribute("class","front");
	 	  	        
// 	 	  	    }
	 	  	    
// 	    		 let cross = new Cross();
// 	    		 cross.show();
// 	    		 cross.run();
// 				this.div.style.left = "380px";
	    	}
// 	    	num = ++num;
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

<div class="back"></div>
<!-- <div class="front">F</div> -->
</body>
</html>