function getPagingStr(jspFileName,now_page,arrStr)
{
	if(arrStr != '')
	{
		if(arrStr.indexOf('&') != -1)
		{
			var arr = arrStr.split('&');
			for(let obj in arr)
			{
			  var inArr = arr[obj];
			  if(inArr.indexOf('=') != -1)
              {
                var arrNew = inArr.split('=');
                var inKey = arrNew[0];
                var inValue = arrNew[1];
		        $('input[name="'+ inKey  + '"]').val(inValue );
              }
			}
		}
	}
	$("input[name='currPage']").val(now_page);
    var inData = $('#fmSaleMng').serialize();
    getList(inData);
}


function initForm()
{
   $("input[name='saleDate']").val('');
   $("input[name='saleSite']").val('');
   $("input[name='saleItem']").val('');
   $("input[name='saleAmt']").val('');
   $("input[name='saleManager']").val('');
   $("input[name='saleRegDate']").val('');
}



