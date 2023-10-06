<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script type="text/javascript" src="/js/jquery-3.7.1.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script> -->
<script type="text/javascript"  src="/webjars/jquery/jquery.js"></script>
<title>placeholder.jsp</title>
<script type="text/javascript">
$(function(){
	for(let i=0;i<30;i++){
		$('body').append('<img alt="xxx"/>');
	}
	
// 	$('img').attr('src', 'http://via.placeholder.com/100x100');
    $('img').attr({
    	alt:function(i){
    	  return i+' num';	
    	},
    	src:function(i){
    	  let colors = [
    		  '000000',
    		  'ff0000',
    		  '00ff00',
    		  '0000ff',
    		  'ffff00',
    		  'ff00ff',
    		  '00ffff',
    		  ]
    	  
    	  let fg = null;
    	  let bg = null;
    	  do{
    	  fg = colors[parseInt(Math.random()*colors.length)];
    	  bg = colors[parseInt(Math.random()*colors.length)];
    	  }while(fg==bg)
    	  let width = parseInt(Math.random()*10+1)*10;
    	  let height = parseInt(Math.random()*10+1)*10;
    	  return `http://via.placeholder.com/\${width}x\${height}/\${bg}/\${fg}` 
    	}
    }).css('border', '1px solid blue')
    .css('margin', 10)
    .css('vertical-align', 'top');
    
});
</script>
</head>
<body>

</body>
</html>