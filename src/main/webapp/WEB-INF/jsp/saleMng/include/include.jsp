<%@ page pageEncoding="UTF-8" %>
<!-- Calendar lib -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<form id="fmSaleMng" method="POST">
     <input type = "hidden" name = "saleDate" />
     <input type = "hidden" name = "saleDateOld" />
     <input type = "hidden" name = "saleSite" />
     <input type = "hidden" name = "saleSiteOld" />
     <input type = "hidden" name = "saleItem" />
     <input type = "hidden" name = "saleItemOld" />
     <input type = "hidden" name = "saleAmt" />
     <input type = "hidden" name = "saleAmtOld" />
     <input type = "hidden" name = "saleManager" />
     <input type = "hidden" name = "saleManagerOld" />
     <input type = "hidden" name = "saleRegDate" />
     <input type = "hidden" name = "saleRegDateOld" />
     <input type = "hidden" name = "totCntPerPage"/>
     <input type = "hidden" name = "currPage"/>
     <input type = "hidden" name = "currPage" id = "currPage"/>
     <input type = "hidden" name = "prepage" id = "prepage"/>
     <input type = "hidden" name = "totCntPerPage" id = "totCntPerPage"/>
     <input type = "hidden" name = "linkPageSize" id = "linkPageSize"/>
     <input type = "hidden" name = "srchField" id = "srchField"/>
     <input type = "hidden" name = "srchValue" id = "srchValue"/>
     <input type = "hidden" id = "UI_srchField" />
     <input type = "hidden" id = "UI_srchValue" />
</form>
<script src="/js/common.js"></script>
<script>
function getLogicalName(sField)
{
	if(sField == 'saleDate')
	{
		return '판매일';
	}
	if(sField == 'saleSite')
	{
		return '판매사이트';
	}
	if(sField == 'saleItem')
	{
		return '판매아디템';
	}
	if(sField == 'saleAmt')
	{
		return '판매액';
	}
	if(sField == 'saleManager')
	{
		return '판매매니저';
	}
	if(sField == 'saleRegDate')
	{
		return '등록일';
	}
	else
	{
		return '';
	}
}

function checkValid() {
           
    if(document.getElementsByName('saleDate')[0].value == '')
    {
        alert('\'판매일\'의 값을 입력하세요.');
        return false;
    }
    if(document.getElementsByName('saleSite')[0].value == '')
    {
        alert('\'판매사이트\'의 값을 입력하세요.');
        return false;
    }
    if(document.getElementsByName('saleSite')[0].value.length >= 30)
    {
        alert('\'SALE_SITE\' 필드는 최대 30 바이트까지 입력 가능; 현재 30 바이트가 초과되었습니다');
        return false;
    }
    if(document.getElementsByName('saleItem')[0].value == '')
    {
        alert('\'판매아디템\'의 값을 입력하세요.');
        return false;
    }
    if(document.getElementsByName('saleItem')[0].value.length >= 30)
    {
        alert('\'SALE_ITEM\' 필드는 최대 30 바이트까지 입력 가능; 현재 30 바이트가 초과되었습니다');
        return false;
    }
    if(document.getElementsByName('saleAmt')[0].value == '')
    {
        alert('\'판매액\'의 값을 입력하세요.');
        return false;
    }
    if(document.getElementsByName('saleManager')[0].value == '')
    {
        alert('\'판매매니저\'의 값을 입력하세요.');
        return false;
    }
    if(document.getElementsByName('saleManager')[0].value.length >= 30)
    {
        alert('\'SALE_MANAGER\' 필드는 최대 30 바이트까지 입력 가능; 현재 30 바이트가 초과되었습니다');
        return false;
    }
    if(document.getElementsByName('saleRegDate')[0].value == '')
    {
        alert('\'등록일\'의 값을 입력하세요.');
        return false;
    }
         
    return true;
}


function fromEnterToBr(fromStr)
{
	let text = fromStr;
	let result = text.replace(/\n/g, "<br>");
	result = result.replace(/\r\n/g, "<br>");
	return result;
}


function fromBrToEnter(fromStr)
{
	let text = fromStr;
	let result = text.replace(/<br>/g, "\r\n");
	result = result.replace(/<br>/g, "\n");
	return result;
}



</script>
<%


String srchField = "";
String srchValue = "";

String sSrchField = String.valueOf(request.getParameter("html_srchField"));
if("null".equals(sSrchField) || "NULL".equals(sSrchField) ||"".equals(sSrchField) || sSrchField == null)
{
	sSrchField = String.valueOf(request.getAttribute("srchField")) ;
	if("null".equals(sSrchField) || "NULL".equals(sSrchField) ||"".equals(sSrchField) || sSrchField == null)
	{
		srchField = "";
	}
	else
	{
		srchField = sSrchField;
	}
	
}
else
{
	 srchField = sSrchField;
}


String sSrchValue = String.valueOf(request.getParameter("html_srchValue"));
if("null".equals(sSrchValue) || "NULL".equals(sSrchValue) ||"".equals(sSrchValue) || sSrchValue == null)
{
	sSrchValue = String.valueOf(request.getAttribute("srchValue")) ;
	if("null".equals(sSrchValue) || "NULL".equals(sSrchValue) ||"".equals(sSrchValue) || sSrchValue == null)
	{
		srchValue = "";
	}
	else
	{
		srchValue = sSrchValue;
	}
}
else
{
	 srchValue = sSrchValue;
}



String sCurrPage = String.valueOf(request.getParameter("currPage"));
if("null".equals(sCurrPage) || "NULL".equals(sCurrPage) ||"".equals(sCurrPage) || sCurrPage == null)
{
	sCurrPage = String.valueOf(request.getAttribute("currPage")) ;
	if("null".equals(sCurrPage) || "NULL".equals(sCurrPage) ||"".equals(sCurrPage) || sCurrPage == null)
	{
		sCurrPage = "1";
	}
	else
	{
			
	}
	
}
else
{
	
}


String sPrepage = String.valueOf(request.getParameter("prePage"));
if("null".equals(sPrepage) || "NULL".equals(sPrepage) ||"".equals(sPrepage))
{
	sPrepage = "";
}
else
{
	
}



String sTotCntPerPage = String.valueOf(request.getParameter("totCntPerPage"));
if("null".equals(sTotCntPerPage) || "NULL".equals(sTotCntPerPage) ||"".equals(sTotCntPerPage))
{
	sTotCntPerPage = "10";
}
else
{
	
}


String sSaleDate = String.valueOf(request.getParameter("saleDate"));
if("null".equals(sSaleDate) || "NULL".equals(sSaleDate) ||"".equals(sSaleDate))
{
	sSaleDate = "";
}
else
{
	
}


String sSaleSite = String.valueOf(request.getParameter("saleSite"));
if("null".equals(sSaleSite) || "NULL".equals(sSaleSite) ||"".equals(sSaleSite))
{
	sSaleSite = "";
}
else
{
	
}


String sSaleItem = String.valueOf(request.getParameter("saleItem"));
if("null".equals(sSaleItem) || "NULL".equals(sSaleItem) ||"".equals(sSaleItem))
{
	sSaleItem = "";
}
else
{
	
}


String sSaleAmt = String.valueOf(request.getParameter("saleAmt"));
if("null".equals(sSaleAmt) || "NULL".equals(sSaleAmt) ||"".equals(sSaleAmt))
{
	sSaleAmt = "";
}
else
{
	
}


String sSaleManager = String.valueOf(request.getParameter("saleManager"));
if("null".equals(sSaleManager) || "NULL".equals(sSaleManager) ||"".equals(sSaleManager))
{
	sSaleManager = "";
}
else
{
	
}


String sSaleRegDate = String.valueOf(request.getParameter("saleRegDate"));
if("null".equals(sSaleRegDate) || "NULL".equals(sSaleRegDate) ||"".equals(sSaleRegDate))
{
	sSaleRegDate = "";
}
else
{
	
}




%>


