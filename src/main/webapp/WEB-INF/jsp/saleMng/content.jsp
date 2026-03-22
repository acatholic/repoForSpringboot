<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/base.css"/>




</head>
<body>

<%@ include file="./include/include.jsp"%>
<div id="wrapper" style="width:85%;padding:5px;margin:0 auto;">		
	
	<div id="contentDiv">
	
		<h2>Details</h2>
	
		<br>
		<br>	
			
		<table>
		<tr>
			<td style="width:30%;">판매일 </td>
			<td style="width:70%"><input type="text" name="I_saleDate" style="width:99%" disabled></td>
		</tr>
		<tr>
			<td style="width:30%;">판매사이트 </td>
			<td style="width:70%"><input type="text" name="I_saleSite" style="width:99%" disabled></td>
		</tr>
		<tr>
			<td style="width:30%;">판매아디템 </td>
			<td style="width:70%"><input type="text" name="I_saleItem" style="width:99%" disabled></td>
		</tr>
		<tr>
			<td style="width:30%;">판매액 </td>
			<td style="width:70%"><input type="text" name="I_saleAmt" style="width:99%" disabled></td>
		</tr>
		<tr>
			<td style="width:30%;">판매매니저 </td>
			<td style="width:70%"><input type="text" name="I_saleManager" style="width:99%" disabled></td>
		</tr>
		<tr>
			<td style="width:30%;">등록일 </td>
			<td style="width:70%"><input type="text" name="I_saleRegDate" style="width:99%" disabled></td>
		</tr>
	
	    </table>
    </div><!-- insertDiv end -->
    
    
    
    
	<div id = "space" style="border:0px solid black;align:center;margin-top: 13px;padding:13px;float:none"></div>
    
    
    <div id="insertButton">	
        <div id="left" style="float:left;margin:5px;"><button id = "b_back" style="font-size:23px">&nbsp;Back&nbsp;</button></div>
		<div id="right"style="float:right;margin:5px;"><button id = "b_update" style="font-size:23px">&nbsp;Modify&nbsp;</button></div>
		<div id="right"style="float:right;margin:5px;"><button id = "b_delete" style="font-size:23px">&nbsp;Delete&nbsp;</button></div>
    </div>
    
    
</div>

<br>
<br>



<script type="text/javascript">


var saleDate = '${result.SALE_DATE}';
var saleSite = '${result.SALE_SITE}';
var saleItem = '${result.SALE_ITEM}';
var saleAmt = '${result.SALE_AMT}';
var saleManager = '${result.SALE_MANAGER}';
var saleRegDate = '${result.SALE_REG_DATE}';


function fn_deleteSaleMng (inData)
{
  $.ajax({
	  url : '/saleMng/deleteSaleMng',
	  data : inData,
	  method : 'POST',
      beforeSend : function (xhr) {
    	  
      },
      success : function (data, status ,xhr) {    	  
   	     
   	     if(status == 'success')
   	     {
   	    	alert('삭제했습니다'); 
   	    	location.href='/saleMng/list';	
   	     }
   	     else
   	     {
   	    	alert('삭제하지 못했습니다');
   	     }
      },
	  error : function (xhr) {
		  
	  }
  });
}


$(document).ready(function(){

	$("input[name=I_saleDate]").val(saleDate);
	$("input[name=I_saleSite]").val(saleSite);
	$("input[name=I_saleItem]").val(saleItem);
	$("input[name=I_saleAmt]").val(saleAmt);
	$("input[name=I_saleManager]").val(saleManager);
	$("input[name=I_saleRegDate]").val(saleRegDate);
	
	
	$("#b_back").click(function(){		
       initForm();
       $("input[name='currPage']").val('${param.currPage}');
       $("input[name='totCntPerPage']").val('${param.totCntPerPage}');
       var srchField = '${param.srchField}'; 
       var srchValue = '${param.srchValue}'; 
       $("input[name='srchField']").val(srchField);
       $("input[name='srchValue']").val(srchValue);
       $("input[name='" +  srchField  + "']").val(srchValue);
        
       $('#fmSaleMng').attr('method', 'POST');
       $('#fmSaleMng').attr('action', '/saleMng/list');
       $('#fmSaleMng').submit();
        
	});
	
	
	$("#b_update").click(function(){
        var srchField = '${param.srchField}'; 
        var srchValue = '${param.srchValue}';
        $("input[name='srchField']").val(srchField);
        $("input[name='srchValue']").val(srchValue);
        $("input[name='" +  srchField  + "']").val(srchValue);
    
        $("input[name='currPage']").val('${param.currPage}');	
        $("input[name='totCntPerPage']").val('${param.totCntPerPage}');
		$("input[name='saleDate']").val($("input[name='I_saleDate']").val());
		$("input[name='saleSite']").val($("input[name='I_saleSite']").val());
		$("input[name='saleItem']").val($("input[name='I_saleItem']").val());
		$("input[name='saleAmt']").val($("input[name='I_saleAmt']").val());
		$("input[name='saleManager']").val($("input[name='I_saleManager']").val());
		$("input[name='saleRegDate']").val($("input[name='I_saleRegDate']").val());
		$('#fmSaleMng').attr('method', 'POST');
        $('#fmSaleMng').attr('action', '/saleMng/modify');
        $('#fmSaleMng').submit();
	
	});
	
	$("#b_delete").click(function(){
		
		if(confirm("삭제하시겠습니까?")) {

		var saleDate= $("input[name=I_saleDate]").val();
		var saleSite= $("input[name=I_saleSite]").val();
		var saleItem= $("input[name=I_saleItem]").val();
		var saleAmt= $("input[name=I_saleAmt]").val();
		var saleManager= $("input[name=I_saleManager]").val();
		var saleRegDate= $("input[name=I_saleRegDate]").val();
		
		$("input[name=saleDate]").val(saleDate);
		$("input[name=saleSite]").val(saleSite);
		$("input[name=saleItem]").val(saleItem);
		$("input[name=saleAmt]").val(saleAmt);
		$("input[name=saleManager]").val(saleManager);
		$("input[name=saleRegDate]").val(saleRegDate);
			
		var inData = $('#fmSaleMng').serialize();
		fn_deleteSaleMng(inData);
		
	  }
	});

	

});






</script>

<br>
<br>




</body>
</html>


