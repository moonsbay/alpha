<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>race.jsp</title>
<style type="text/css">
#surface{
	border-collapse: collapse;
	font-family: monospace;
	font-size: 1.5em;
	background-color: red;
	background-image: url('/img/BackgroundFront.png'),url('/img/BackgroundBack.png');
	background-size: 100%;
	background-repeat: no-repeat;
}
#surface td{
	opacity: 0.7;
}
#startBtn{
	padding: 5px 20px;   /* 5px 20px 5px 20px의 의미 위부터 시계방향  5px하나만 쓰면 5px네개로 생각*/
}
</style>
<script type="text/javascript">

function race(alpha){
	
	/*	function add_tr(viewnum) {//행 추가
	    let table_body = document.getElementById(table_id);
	    let first_tr   = table_body.firstElementChild;
	    let tr_clone   = first_tr.cloneNode(true);//*1)복제된 node 반환

	    table_body.append(tr_clone);
	    clean_first_tr(table_body.firstElementChild);
	}
	
	const table = document.getElementById("viewnum");
	const new_row = table.insertRow();
	const newCell1 = newRow.insertCell(0);
	const newCell2 = newRow.insertCell(1);
//	const cell_length = table.rows[1].cells.length;
	newCell1.innerText = '새 과일';
	newCell2.innerText = 'New Fruit';
    
	let chalpha = document.getElementById('alphach');
	
	
    for(let i = 0; i < cell_length; i++) {
        const new_cell = new_row.insertCell(i);
        let temp_html = ``;
        if(i == 0) {
                temp_html = `<td align="right">0</td>`;
        } else if(i == 1) {
                 temp_html = `<td align="right">0</td>`;
        };
    }*/
//	console.log("race()..." + alpha);
	
	let cnt=0;
	let speed = Math.random()*1000 + 10;
	let direction = 0; // 0:right,  1:down, 2:left, 3:up

	alpha.line = 1;
	alpha.column = 1;
	

	let td = surface.rows[alpha.line-1].cells[alpha.column-1];
    td.style.color = alpha.fg;
    td.style.background = alpha.bg;
    td.innerText = alpha.ch;
    
    let tr = document.createElement('tr');
    let tdNo = document.createElement('td');
    let tdAlpha = document.createElement('td');
    let tdCount = document.createElement('td');
    
    tr.append(tdNo);
    tr.append(tdAlpha);
    tr.append(tdCount);
    
    stat.tBodies[0].append(tr);
    
    tdNo.align = 'right';
    tdAlpha.align = 'right';
    tdCount.align = 'right';
    
//  tdNo.innerText = tr.rowIndex;
    tdNo.innerText = tr.parentElement.rows.length;  // 위 문장 결과와 같다
    tdAlpha.innerText = alpha.ch;
    tdAlpha.style.color = alpha.fg;
    tdAlpha.style.background = alpha.bg;
    
    tdCount.innerText = 0;

    alphach.innerText = alpha.ch;
    
    
	let ccount = 0;
	
	setTimeout(function move(){   //이름을 줄 수 있다
//		   console.log(cnt++ + ", speed=" + speed)
		   let td = surface.rows[alpha.line-1].cells[alpha.column-1];
		
	       td.style.color = "Black";
	       td.style.background = 'Black';
	       
	       switch(direction){
	       case 0:
	    	   alpha.column++;
	    	   break;
	       case 1:
	    	   alpha.line++;
	    	   break;
	       case 2:
	    	   alpha.column--;
	    	   break;
	       case 3:
	    	   alpha.line--;
	    	   break;
	       }
	       
	       td = surface.rows[alpha.line-1].cells[alpha.column-1];
	       td.style.color = alpha.fg;
	       td.style.background = alpha.bg;
	       td.innerText = alpha.ch;
	       
	       if(alpha.line == 1 && alpha.column==1){
	    	   direction = 0;
	    	   roundCount.innerText = ++roundCount.innerText;
	    	   round.innerText = roundCount.innerText;
	    	   alphach.innerText = alpha.ch;
	    	   tdCount.innerText = ++tdCount.innerText;
	       }else if(alpha.line == 1 && alpha.column==40)
	    	   direction = 1;
	       else if(alpha.line == 20 && alpha.column==40)
	    	   direction = 2;
	       else if(alpha.line == 20 && alpha.column==1)
	    	   direction = 3;
	           ccount = 1;
	     
//	       return roundCount.innerText;
	       
//	       if(ccount==1){
//          	   clearTimeout();
//           }

	       
/*	    if(alpha.line == 1){
		   console.log(cnt++ + ", speed=" + speed)
		   let td = surface.rows[alpha.line-1].cells[alpha.column-1];
		
	       td.style.color = "Black";
	       td.style.background = 'Black';
		
	       alpha.column++;
	    
		   td = surface.rows[alpha.line-1].cells[alpha.column-1];
	       td.style.color = alpha.fg;
	       td.style.background = alpha.bg;
	       td.innerText = alpha.ch;
		}
	    if(alpha.column == 40){
	    	
		    let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			td.style.color = "Black";
		    td.style.background = 'Black';
		    
		    alpha.line++;
		    
		    td = surface.rows[alpha.line-1].cells[alpha.column-1];
		    td.style.color = alpha.fg;
		    td.style.background = alpha.bg;
		    td.innerText = alpha.ch;
		    
	    }
	    if(alpha.line == 20){
	    	let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			td.style.color = "Black";
		    td.style.background = 'Black';
			
		    alpha.column--;
		    td = surface.rows[alpha.line-1].cells[alpha.column-1];
		    td.style.color = alpha.fg;
		    td.style.background = alpha.bg;
		    td.innerText = alpha.ch;
	    }
	    if(alpha.column == 1 && alpha.line==20){
	    	let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			td.style.color = "Black";
		    td.style.background = 'Black';
			
		    alpha.line--;
		    td = surface.rows[alpha.line-1].cells[alpha.column-1];
		    td.style.color = alpha.fg;
		    td.style.background = alpha.bg;
		    td.innerText = alpha.ch;
            if(alpha.column == 1 && alpha.line ==1){
            	let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			     td.style.color = "Black";
		         td.style.background = 'Black';
            }
	    }*/
	    
	    
		setTimeout(move, speed);
	}, speed);
	
	count.innerText = ++count.innerText;
	if(count.innerText ==1){
		setInterval(function(){
			ellipse.innerText = ++ellipse.innerText;
		}, 1000);
	}
	
/*	for(i=0; i<count; i++){
	 let arr = new Array(count);	
	 alpha.ch = arr[i];
		
	}*/
 
}
window.onload = function(){
	
	startBtn.onclick = e =>{
		fetch('/alpha/data').then(response => response.json())
		.then(alpha => {
			race(alpha);
//			add_tr();
		});
		
	}
}

</script>

<style type="text/css">
section > table{
	float: left;
	margin: 10px;
}

</style>
</head>
<body>
<h1>Ajax => fetch 활용</h1>
<hr>
<button id="startBtn">Start</button>
<hr>
<table border="1" width="400">
  <thead>
    <tr>
      <th>roundCount</th><th>count</th><th>ellipse</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td id="roundCount" align="right">0</td>
      <td id="count" align="right">0</td>
      <td id="ellipse" align="right">0</td>
    </tr>
  </tbody>
</table>
<hr>
<section>
<table id="stat" width="400" border="1">
 <thead>
   <tr>
      <th>no</th><th>alpha</th><th>Round Count</th>
   </tr>
 </thead>
 <tbody>
 
 </tbody>
</table>
<hr>
</section>
<!-- <hr> -->
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
  <tbody>
    <c:forEach var="i" begin="0" end="${surface.size()-1}">
      <tr>
    	<c:forEach var="j" begin="0" end="${surface.get(i).size()-1}">
    	  <c:set var="alpha" value="${surface[i][j]}"/>
   	      <td style="color: black; background:black;">${alpha.ch}</td>
<%--  	 	  <td> ${alpha.ch}</td> --%>
    	</c:forEach>
      </tr>	  
    </c:forEach>  
  </tbody>
</table>

<!-- <hr> -->
<!-- <table id="viewnum" border="1" width="200"> -->
<!--   <thead> -->
<!--     <tr> -->
<!--       <th>Alphach</th><th>Round</th> -->
<!--     </tr> -->
<!--   </thead> -->
<!--   <tbody> -->
<!--     <tr> -->
<!--       <td id="alphach" align="right">0</td> -->
<!--       <td id="round" align="right">0</td> -->
<!--     </tr> -->
<!--   </tbody> -->
<!-- </table> -->

</body>
</html>