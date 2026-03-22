<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/base.css"/>
<title>SaleMng List</title>




<%@ include file="./include/include.jsp"%>
</head>



<body>

<div id="wrapper" style="width:90%;padding:5px;margin:0 auto;">		
<br>
    <a href="/saleMng/list"><font size='11'>SaleMng List</font></a>

	<br>
	<br>	
		
	<div id="totalCnt" style="float:left;font-size:25px"></div>
	<div style="float:right;margin:5px;">
	
		<select id="html_srchField" style="margin:1px;font-size:29px;width:250px;">
		  <option value="none" selected>선택</option>
		  <option value='saleRegDate'>등록일</option>
		  <option value='saleAmt'>판매액</option>
		  <option value='saleSite'>판매사이트</option>
		  <option value='saleDate'>판매일</option>
		  <option value='saleManager'>판매매니저</option>
		  <option value='saleItem'>판매아디템</option>
		</select>
		
		<input type="text" id="html_srchValue" style="margin:1px;font-size:20px;width:250px;"  >
		<button id = "b_search" style="border:1;margin:1px;font-size:28px;">&nbsp;SEARCH&nbsp;</button>
	</div>
	<div id = "space" style="border:0px solid black;align:center;margin-top: 3px;padding:3px;float:none"></div>
	<br>
	<br>
	
	<div id="contentDiv"></div>
	<br>
	
	<div id ="writeDiv" style="float:right"><button id = "b_write" style="font-size:23px">&nbsp;POSTING&nbsp;</button></div>
	
	<div id = "space" style="border:0px solid black;align:center;margin-top: 3px;padding:3px;float:none"></div>
	<br>
	<div id="pagingDiv" style="text-align:center;a {font-size:20px;}; font-size:25px;"></div>
	
	

 </div>

<br>
<br>



<script type="text/javascript">

var rowStrForTable = '';
var page = '${param.currPage}';
var totCntPerPage = '${param.totCntPerPage}';
var srchField = '${param.srchField}';
var srchValue = '${param.srchValue}';
if(page == '' || page == null)
{
	page = 1; 
}
if(totCntPerPage == '' || totCntPerPage == null)
{
	totCntPerPage = 10; 
}
if(srchField == '' || srchField == null)
{
	srchField = ''; 
}
if(srchValue == '' || srchValue == null)
{
	srchValue = ''; 
}

$("input[name='currPage']").val(page);
$("input[name='totCntPerPage']").val(totCntPerPage);
$("input[name='srchField']").val(srchField); 
$("input[name='srchValue']").val(srchValue); 
$("input[name='" + srchField + "']").val(srchValue);



if(srchField == '' || srchField == null)
{
  srchField = $("#html_srchField option:selected").val();
}
$("#html_srchField").val(srchField);
$("#html_srchValue").val(srchValue);

function getList(inData)
{
  $.ajax({
	  url : '/saleMng/selectSaleMngList',
	  data : inData,
	  method : 'POST',
      beforeSend : function (xhr) {
    	  
      },
      success : function (data, status ,xhr) {
    	  
    	  
    	  $('#contentDiv').text('');
		  $('#pagingDiv').text('');
    	  
    	  var totalCnt ;
    	  var paging ;
    	  
    	  rowStrForTable = "<table style='border:1px;width:100%'>";
    	  rowStrForTable = rowStrForTable + "<tr>";
    	  rowStrForTable = rowStrForTable + "<th>NO</th>";
    	  rowStrForTable = rowStrForTable + "<th>판매일</th>";
    	  rowStrForTable = rowStrForTable + "<th>판매사이트</th>";
    	  rowStrForTable = rowStrForTable + "<th>판매아디템</th>";
    	  rowStrForTable = rowStrForTable + "<th>판매액</th>";
    	  rowStrForTable = rowStrForTable + "<th>판매매니저</th>";
    	  rowStrForTable = rowStrForTable + "<th>등록일</th>";
    	  rowStrForTable = rowStrForTable + "</tr>";
    	  
    	  var totalSu = data.totalCnt;
    	  
    	  if(totalSu == 0)
    	  {
    		 rowStrForTable = rowStrForTable + "<tr>";
    		 rowStrForTable = rowStrForTable + "<td colspan='7'>NO DATA</td>";
    		 rowStrForTable = rowStrForTable + "</tr>";
    	  }
    	  else
    	  {
    	  
    	      totalCnt = data.totalCnt;
    	      paging = data.pagingStr;
    	      page = data.paramStr.currPage;
    	      totCntPerPage = data.paramStr.totCntPerPage;
    	      $("input[name='currPage']").val(page);
    	      $("input[name='totCntPerPage']").val(totCntPerPage);
	    	  $.each(data.result ,  function(idx, content){
	    		  
	    		  
	    		  var vNo = '';
	    		  if(content.NEW_RNUM != null)
	    		  {
	                  var newPage  = page - 1;
	                  vNo = totalCnt - (newPage * 10) - idx;
		    		  var vSaleDate = content.SALE_DATE;
                      if(vSaleDate == undefined ) { vSaleDate = ''; }
		    		  var vSaleSite = content.SALE_SITE;
                      if(vSaleSite == undefined ) { vSaleSite = ''; }
		    		  var vSaleItem = content.SALE_ITEM;
                      if(vSaleItem == undefined ) { vSaleItem = ''; }
		    		  var vSaleAmt = content.SALE_AMT;
                      if(vSaleAmt == undefined ) { vSaleAmt = ''; }
		    		  var vSaleManager = content.SALE_MANAGER;
                      if(vSaleManager == undefined ) { vSaleManager = ''; }
		    		  var vSaleRegDate = content.SALE_REG_DATE;
                      if(vSaleRegDate == undefined ) { vSaleRegDate = ''; }
		    	      
		    	      rowStrForTable = rowStrForTable 
		    	      + "<tr style=\"cursor:pointer\" onClick=\"viewContent('"+ page + "' , '" + totCntPerPage +  "','" +  vSaleDate +  "','" +  vSaleSite +  "','" +  vSaleItem +  "','" +  vSaleAmt +  "','" +  vSaleManager +  "','" +  vSaleRegDate +  "')\">";
		    	                                            
		    	      rowStrForTable = rowStrForTable + "<td class=\"tdStyle1\">" + vNo +  "</td>";
		    	      rowStrForTable = rowStrForTable + "<td class=\"tdStyle1\">" + vSaleDate +  "</td>";
		    	      rowStrForTable = rowStrForTable + "<td class=\"tdStyle1\">" + vSaleSite +  "</td>";
		    	      rowStrForTable = rowStrForTable + "<td class=\"tdStyle1\">" + vSaleItem +  "</td>";
		    	      rowStrForTable = rowStrForTable + "<td class=\"tdStyle1\">" + vSaleAmt +  "</td>";
		    	      rowStrForTable = rowStrForTable + "<td class=\"tdStyle1\">" + vSaleManager +  "</td>";
		    	      rowStrForTable = rowStrForTable + "<td class=\"tdStyle1\">" + vSaleRegDate +  "</td>";
		    	      rowStrForTable = rowStrForTable + "</tr>";
	    		  }
	    	  });
	    	  

    	  }
    	  
    	  
    	  rowStrForTable = rowStrForTable  + "</table>";   
    	  $('#contentDiv').append(rowStrForTable);
    	  
    	  if(totalSu > 0)
    	  {
    		  $('#totalCnt').text("total : " + totalCnt);
    		  $('#totalCnt').css("style=font-size:30px;size:30");
	          $('#pagingDiv').append(paging);
    	  }
    	  else 
    	  {
    	      $('#totalCnt').text("total : " + 0);
    	      $('#totalCnt').css("style=font-size:30px;size:30");
    	      $('#pagingDiv').append('');
    	  }
    	  
    	   
    	  if(srchValue != null && srchValue != '')
    	  { 
    	    $("#html_srchValue").val($("#html_srchValue").val());
    	  }
    	  if(srchField != null && srchField != '')
    	  { 
    	    $("#html_srchField").val($("#html_srchField option:selected").val());
    	  }
    	  
      },
	  error : function (xhr) {
		  
	  }
  });
}


var inData = $('#fmSaleMng').serialize();
getList(inData);


function viewContent( page  , totCntPerPage
	, saleDate	, saleSite	, saleItem	, saleAmt	, saleManager	, saleRegDate  )
{
    $("input[name='currPage']").val(page);
    $("input[name='totCntPerPage']").val(totCntPerPage);
    $("input[name='saleDate']").val(saleDate);
    $("input[name='saleSite']").val(saleSite);
    $("input[name='saleItem']").val(saleItem);
    $("input[name='saleAmt']").val(saleAmt);
    $("input[name='saleManager']").val(saleManager);
    $("input[name='saleRegDate']").val(saleRegDate);
    var fieldStr = $("#html_srchField option:selected").val();
    var searchStr = $("#html_srchValue").val();
    $("#UI_srchField").val(fieldStr);
    $("#UI_srchValue").val(searchStr);
    $("input[name='srchField']").val(fieldStr);
    $("input[name='srchValue']").val(searchStr);

    $("#fmSaleMng").attr('action', '/saleMng/selectSaleMng');
    $("#fmSaleMng").submit();

}

$(document).ready(function(){
	
	
	$('#html_srchValue').on('keypress', function(e){
		  if(e.keyCode == '13'){
		  	$('#b_search').click();
		  }
	});
    
	
	$("#b_write").click(function(){
	   location.href='/saleMng/create';
	});

	
    $("#b_search").click(function(){
	       
        initForm();  
    	var fieldStr = $("#html_srchField option:selected").val();
        var searchStr = $("#html_srchValue").val();
    
        
        
        $("input[name='totCntPerPage']").val(totCntPerPage);
        $("input[name='currPage']").val(page);
        
        if(searchStr == 'undefined' ||
        		searchStr == 'null' ||
        		searchStr == '')
        {
        	if(fieldStr != 'none' && fieldStr != '')
        	{
        		alert('검색어를 입력해 주십시오');
            	return;
        	}
        	initForm();
        	
        	$("input[name=totCntPerPage]").val('10');
        	$("input[name=currPage]").val('1');
        	$("input[name=linkPageSize]").val('10');
        	$("input[name='srchField']").val(fieldStr);
        	$("input[name='srchValue']").val(searchStr);
        	$("input[name='" +  fieldStr + "']").val(searchStr);
        	
        }
        else
        {

            if(fieldStr == 'saleDate')
            {
            	$("input[name='saleDate']").val(searchStr);
            	$("#UI_srchField").val(fieldStr);
            	$("#UI_srchValue").val(searchStr);
            	$("input[name='srchField']").val(fieldStr);
            	$("input[name='srchValue']").val(searchStr);
            }
            if(fieldStr == 'saleSite')
            {
            	$("input[name='saleSite']").val(searchStr);
            	$("#UI_srchField").val(fieldStr);
            	$("#UI_srchValue").val(searchStr);
            	$("input[name='srchField']").val(fieldStr);
            	$("input[name='srchValue']").val(searchStr);
            }
            if(fieldStr == 'saleItem')
            {
            	$("input[name='saleItem']").val(searchStr);
            	$("#UI_srchField").val(fieldStr);
            	$("#UI_srchValue").val(searchStr);
            	$("input[name='srchField']").val(fieldStr);
            	$("input[name='srchValue']").val(searchStr);
            }
            if(fieldStr == 'saleAmt')
            {
            	$("input[name='saleAmt']").val(searchStr);
            	$("#UI_srchField").val(fieldStr);
            	$("#UI_srchValue").val(searchStr);
            	$("input[name='srchField']").val(fieldStr);
            	$("input[name='srchValue']").val(searchStr);
            }
            if(fieldStr == 'saleManager')
            {
            	$("input[name='saleManager']").val(searchStr);
            	$("#UI_srchField").val(fieldStr);
            	$("#UI_srchValue").val(searchStr);
            	$("input[name='srchField']").val(fieldStr);
            	$("input[name='srchValue']").val(searchStr);
            }
            if(fieldStr == 'saleRegDate')
            {
            	$("input[name='saleRegDate']").val(searchStr);
            	$("#UI_srchField").val(fieldStr);
            	$("#UI_srchValue").val(searchStr);
            	$("input[name='srchField']").val(fieldStr);
            	$("input[name='srchValue']").val(searchStr);
            }
            if(fieldStr == 'none' || fieldStr == '')
            {
            	alert('검색 필드를 선택해 주십시오');
            	return;
            }
        }
        
        if('${param.srchValue}' == $('#html_srchValue').val())
        {
        	$("input[name='currPage']").val(page);
        }
        else
        {
        	$("input[name='currPage']").val(1);
        }
        
        $("input[name='totCntPerPage']").val(totCntPerPage);
        var inData = $('#fmSaleMng').serialize();
        getList(inData);


    });

      


    
});






</script>

<br>
<br>




</body>
</html>

