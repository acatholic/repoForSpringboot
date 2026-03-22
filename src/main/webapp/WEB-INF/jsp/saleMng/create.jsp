<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/base.css"/>
<title>Registration</title>




</head>
<body>

<%@ include file="./include/include.jsp"%>



<div id="wrapper" style="width:85%;padding:5px;margin:0 auto;">		
	
	<div id="insertDiv">
	
		<h2>Registration</h2>
	
		<br>
		<br>	
			
		<table>
		<tr>
			<td style="width:30%;">판매일 </td>
			<td style="width:70%"><input type="text" name="I_saleDate" style="width:99%"></td>
		</tr>
		<tr>
			<td style="width:30%;">판매사이트 </td>
			<td style="width:70%"><input type="text" name="I_saleSite" style="width:99%"></td>
		</tr>
		<tr>
			<td style="width:30%;">판매아디템 </td>
			<td style="width:70%"><input type="text" name="I_saleItem" style="width:99%"></td>
		</tr>
		<tr>
			<td style="width:30%;">판매액 </td>
			<td style="width:70%"><input type="text" name="I_saleAmt" style="width:99%"></td>
		</tr>
		<tr>
			<td style="width:30%;">판매매니저 </td>
			<td style="width:70%"><input type="text" name="I_saleManager" style="width:99%"></td>
		</tr>
		<tr>
			<td style="width:30%;">등록일 </td>
			<td style="width:70%"><input type="text" name="I_saleRegDate" style="width:99%"></td>
		</tr>
	
	    </table>
    </div><!-- InsertDiv End -->
    
    
    
    <!-- to get space -->
	<div id = "space" style="border:0px solid black;align:center;margin-top: 13px;padding:13px;float:none"></div>
    
    
    <div id="insertButton">	
        <div id="left" style="float:left;margin:5px;"><button id = "b_main" style="font-size:23px">&nbsp;List&nbsp;</button></div>
		<div id="right"style="float:right;margin:5px;"><button id = "b_write" style="font-size:23px">&nbsp;Registration&nbsp;</button></div>
    </div><!-- insertButton End -->
    
    
</div>

<br>
<br>



<script type="text/javascript">


function fn_insertSaleMng(inData)
{
  $.ajax({
	  url : '/saleMng/insertSaleMng',
	  data : inData,
	  method : 'POST',
      beforeSend : function (xhr) {
    	  
      },
      success : function (data, status ,xhr) {    	  
   	     
   	     if(status == 'success')
   	     {
   	    	alert('입력했습니다'); 
   	    	location.href='/saleMng/list';	
   	     }
   	     else
   	     {
   	    	alert('입력하지 못했습니다');
   	     }
      },
	  error : function (xhr) {
		  
	  }
  });
}

$(document).ready(function(){
	
    $('input[name=I_saleDate]').datepicker({dateFormat:'mm/dd/yy'});
    $('input[name=I_saleRegDate]').datepicker({dateFormat:'mm/dd/yy'});
	
	$("#b_write").click(function(){

		var saleDate = $("input[name=I_saleDate]").val();
		var saleSite = $("input[name=I_saleSite]").val();
		var saleItem = $("input[name=I_saleItem]").val();
		var saleAmt = $("input[name=I_saleAmt]").val();
		var saleManager = $("input[name=I_saleManager]").val();
		var saleRegDate = $("input[name=I_saleRegDate]").val();
		
		
		$("input[name=saleDate]").val(saleDate);
		$("input[name=saleSite]").val(saleSite);
		$("input[name=saleItem]").val(saleItem);
		$("input[name=saleAmt]").val(saleAmt);
		$("input[name=saleManager]").val(saleManager);
		$("input[name=saleRegDate]").val(saleRegDate);
		
 	    if(checkValid())
 	    {
 	      var inData = $('#fmSaleMng').serialize();
 	      fn_insertSaleMng(inData);
 	    }
 	    else
 	    {
	
 	    }

		
	});
	
	$("#b_main").click(function(){
		location.href='/saleMng/list';		
	});
});






</script>

<br>
<br>




</body>
</html>

