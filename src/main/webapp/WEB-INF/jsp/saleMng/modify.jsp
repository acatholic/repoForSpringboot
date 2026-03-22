<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/base.css"/>




<%@ include file="./include/include.jsp"%>
</head>
<body>





<div id="wrapper" style="width:85%;padding:5px;margin:0 auto;">		
	
	<div id="contentDiv">
	
		<h2>Modify (Primary Key field cannot be modified)</h2>
	
		<br>
		<br>
			
		<table>
		<tr>
			<td style="width:30%;">판매일 </td>
			<td style="width:70%"><input type="text" name="I_saleDate"  style="width:99%;"></td>
		</tr>
		<tr>
			<td style="width:30%;">판매사이트 </td>
			<td style="width:70%"><input type="text" name="I_saleSite"  style="width:99%;"></td>
		</tr>
		<tr>
			<td style="width:30%;">판매아디템 </td>
			<td style="width:70%"><input type="text" name="I_saleItem"  style="width:99%;"></td>
		</tr>
		<tr>
			<td style="width:30%;">판매액 </td>
			<td style="width:70%"><input type="text" name="I_saleAmt"  style="width:99%;"></td>
		</tr>
		<tr>
			<td style="width:30%;">판매매니저 </td>
			<td style="width:70%"><input type="text" name="I_saleManager"  style="width:99%;"></td>
		</tr>
		<tr>
			<td style="width:30%;">등록일 </td>
			<td style="width:70%"><input type="text" name="I_saleRegDate"  style="width:99%;"></td>
		</tr>
	    
	    </table>
    </div><!-- insertDiv end -->
    
    
    
    <!-- to get space -->
	<div id = "space" style="border:0px solid black;align:center;margin-top: 13px;padding:13px;float:none"></div>
    
    
    <div id="insertButton">	
        <div id="left" style="float:left;margin:5px;"><button id = "b_main" style="font-size:23px">&nbsp;list&nbsp;</button></div>
		<div id="right"style="float:right;margin:5px;"><button id = "b_modify" style="font-size:23px">&nbsp;save&nbsp;</button></div>
    </div><!-- insertButton end -->
    
    
</div>

<br>
<br>



<script type="text/javascript">


var saleDate = '${param.saleDate}';
$("input[name='saleDateOld']").val(saleDate);
var saleSite = '${param.saleSite}';
$("input[name='saleSiteOld']").val(saleSite);
var saleItem = '${param.saleItem}';
$("input[name='saleItemOld']").val(saleItem);
var saleAmt = '${param.saleAmt}';
$("input[name='saleAmtOld']").val(saleAmt);
var saleManager = '${param.saleManager}';
$("input[name='saleManagerOld']").val(saleManager);
var saleRegDate = '${param.saleRegDate}';
$("input[name='saleRegDateOld']").val(saleRegDate);


function fn_updateSaleMng (inData)
{
  $.ajax({
	  url : '/saleMng/updateSaleMng',
	  data : inData,
	  method : 'POST',
      beforeSend : function (xhr) {
    	  
      },
      success : function (data, status ,xhr) {    	  
   	     
   	     if(status == 'success')
   	     {
   	    	alert('수정했습니다'); 
   	    	var srchField = '${param.srchField}';  
   	    	var srchValue = '${param.srchValue}';  
   	    	
   	    	$("input[name='saleDate']").val('');	 
   	    	$("input[name='saleSite']").val('');	 
   	    	$("input[name='saleItem']").val('');	 
   	    	
   	    	$("input[name='srchField']").val(srchField); 
   	    	$("input[name='srchValue']").val(srchValue); 
   	    	$("input[name='" +  srchField  + "']").val(srchValue); 
   	    	
   	    	$("input[name='currPage']").val('${param.currPage}');	 
   	    	$("input[name='totCntPerPage']").val('${param.totCntPerPage}'); 
   	    	
   	    	var inData = $('#fmSaleMng').serialize(); 
   	    	
   	    	
   	    	$('#fmSaleMng').attr('method', 'POST'); 
   	    	$('#fmSaleMng').attr('action', '/saleMng/list'); 
   	    	$('#fmSaleMng').submit(); 
   	    	
   	     }
   	     else
   	     {
   	    	alert('수정하지 못했습니다');
   	     }
      },
	  error : function (xhr) {
		  
	  }
  });
}




$(document).ready(function(){

    $('input[name=I_saleDate]').datepicker({dateFormat:'mm/dd/yy'});
    $('input[name=I_saleRegDate]').datepicker({dateFormat:'mm/dd/yy'});
	
	$("input[name=I_saleDate]").val(saleDate);
	$("input[name=I_saleSite]").val(saleSite);
	$("input[name=I_saleItem]").val(saleItem);
	$("input[name=I_saleAmt]").val(saleAmt);
	$("input[name=I_saleManager]").val(saleManager);
	$("input[name=I_saleRegDate]").val(saleRegDate);
	
	
	$("#b_main").click(function(){
	    var srchField = '${param.srchField}'; 
	    var srchValue = '${param.srchValue}'; 
        $("input[name='currPage']").val('${param.currPage}');
        $("input[name='totCntPerPage']").val('${param.totCntPerPage}');
        $('#fmSaleMng').attr('method', 'POST'); 
        $('#fmSaleMng').attr('action', '/saleMng/list'); 
        $('#fmSaleMng').submit(); 
	});
	
	
	
	
	$("#b_modify").click(function(){

        var srchField = '${param.srchField}';
        var srchValue = '${param.srchValue}';
        $("input[name='srchField']").val(srchField);
        $("input[name='srchValue']").val(srchValue);
        $("input[name='" +  srchField  + "']").val(srchValue);
        $("input[name='currPage']").val('${param.currPage}');
        $("input[name='totCntPerPage']").val('${param.totCntPerPage}');
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

 	    if(checkValid())
 	    {
 	      var inData = $('#fmSaleMng').serialize();
 	      fn_updateSaleMng(inData);
 	    }
 	    else
 	    {
	
 	    }	

	});

});






</script>

<br>
<br>




</body>
</html>


