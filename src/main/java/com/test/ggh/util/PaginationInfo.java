package com.test.ggh.util ;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class PaginationInfo {

	public int currentPageNo;
	public int recordCountPerPage;
	public int pageSize;

	public int firstIndex;
	public int lastIndex;
	public int totalPage;

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPageCount(int totalCnt, int cntPerPage) {
		int totalPageCount = ((totalCnt - 1) / cntPerPage) + 1;
		return totalPageCount;
	}

	public int getFirstPageNo() {
		return 1;
	}

	public int getLastPageNo(int totalCnt, int cntPerPage) {
		return getTotalPageCount(totalCnt, cntPerPage);
	}

	public int getTotalBlock(int totalCnt, int cntPerPage) {
		int totalPageCount = ((totalCnt - 1) / cntPerPage) + 1;
		return (int) Math.ceil(totalPageCount / cntPerPage);
	}

	public int getCurrentBlock(int cntPerPage, int currentPage) {
		return (int) Math.ceil(currentPage / cntPerPage);
	}

	public int getFirstRecordIndex(int currentPage, int cntPerPage) {
		int firstRecordIndex = ((currentPage - 1) * cntPerPage) + 1;
		return firstRecordIndex;
	}

	public int getLastRecordIndex(int firstRecordIndex , int currentPage, int cntPerPage, int totalCnt) {
		int lastRecordIndex = currentPage * cntPerPage;
		if (totalCnt >= lastRecordIndex) {

		} else {
			lastRecordIndex = firstRecordIndex + (totalCnt - ((currentPage - 1) * cntPerPage));
		}
		return lastRecordIndex;
	}
	
	
	@SuppressWarnings("rawtypes")
	public String pagingInfoStr(
			int total_page
			, int now_page 
			, int record_count_per_page
			, String jspFileName
			, HashMap<String, Object> param) throws Exception
	{
		String retVal = "";
		
		StringBuffer sb = new StringBuffer("");
		Set eSet = param.entrySet ( ) ;
	    Iterator it = eSet.iterator ( ) ;
	    while ( it.hasNext ( ) )
	    {
	      Map.Entry e = ( Map.Entry ) it.next ( ) ;
	      Object key = e.getKey ( ) ;
	      Object value = e.getValue ( ) ;

	      sb.append(key).append("=").append(value).append("&");
	    }
		
	    String query = sb.toString();
		int total_block=(int)Math.ceil(total_page/Double.parseDouble(String.valueOf(record_count_per_page)));
		int current_block=(int)Math.ceil(now_page/Double.parseDouble(String.valueOf(record_count_per_page)));

		if(current_block>=total_block&&current_block!=1)
		{
	
			int firstPageOfCurrentBlock = (current_block - 1) * record_count_per_page;
			int lastPageOfCurrentBlock = total_page;
			retVal = retVal + "&nbsp;&nbsp;" +  "<a href='javascript:getPagingStr(\"" + jspFileName + "\", \"1\" ,\"" + query+ "\")'>[1]</a>...<a href='javascript:getPagingStr(\"" + jspFileName + "\", \"" +  (firstPageOfCurrentBlock) + "\",\"" + query+ "\")'>[pre]</a>";
			
			for (int i = (firstPageOfCurrentBlock + 1); i <= lastPageOfCurrentBlock; i++) {
				if (i == now_page) {
					retVal = retVal + "&nbsp;&nbsp;" + "<font size='20px'><b>" + i + "</b></font>";
				} else {
					retVal = retVal + "&nbsp;&nbsp;" + "<a href='javascript:getPagingStr(\"" + jspFileName + "\", \"" + i + "\" ,\"" + query+ "\")'>[" + i + "]</a>";
				}
			}  

			
			
			

		}

		if(current_block<total_block&&current_block>1)
		{

			int firstPageOfCurrentBlock = (current_block - 1) * record_count_per_page;
			int lastPageOfCurrentBlock = current_block * record_count_per_page;
			
	        retVal = retVal + "&nbsp;&nbsp;" +  "<a href='javascript:getPagingStr(\"" + jspFileName + "\", \"1\" ,\"" + query+ "\")'>[1]</a>...<a href='javascript:getPagingStr(\"" + jspFileName + "\", \"" +  (firstPageOfCurrentBlock) + "\",\"" + query+ "\")'>[pre]</a>";

			for (int i = (firstPageOfCurrentBlock + 1); i <= lastPageOfCurrentBlock; i++) {
				if (i == now_page) {
					retVal = retVal + "&nbsp;&nbsp;" + "<font size='20px'><b>" + i + "</b></font>";
				} else {
					retVal = retVal + "&nbsp;&nbsp;" + "<a href='javascript:getPagingStr(\"" + jspFileName +  "\", \"" +  i  + "\", \""  + query + "\")'>[" + i + "]</a>";
				}
			}

			retVal = retVal + "&nbsp;&nbsp;" + "<a href='javascript:getPagingStr(\"" + jspFileName + "\", \"" +  (lastPageOfCurrentBlock + 1) + "\", \"" +  query + "\")'>[next]</a>...<a href='javascript:getPagingStr(\"" + jspFileName +  "\",\"" +  total_page +  "\",\"" + query + "\")'>[" 	+ total_page + "]</a>";

		}

		if (current_block == 1) {
			if (current_block >= total_block) {
				int firstPageOfCurrentBlock = (current_block - 1) * record_count_per_page;
				int lastPageOfCurrentBlock = current_block * record_count_per_page;

				for (int i = (firstPageOfCurrentBlock + 1); i <= lastPageOfCurrentBlock; i++) {
					if (i == now_page) {
						retVal = retVal + "&nbsp;&nbsp;" + "<font size='20px'><b>" + i + "</b></font>";
						if (i == total_page) {
							break;
						}
					} else {
		                     retVal = retVal + "&nbsp;&nbsp;" + "<a href='javascript:getPagingStr(\"" + jspFileName +  "\", \"" +   i +  "\", \"" + query +  "\")'>[" + i + "]</a>";
						if (i == total_page) {
							break;
						}

					}
				}  
			}  

			else {
				int firstPageOfCurrentBlock = (current_block - 1) * record_count_per_page;
				int lastPageOfCurrentBlock = current_block * record_count_per_page;

				for (int i = (firstPageOfCurrentBlock + 1); i <= lastPageOfCurrentBlock; i++) {
					if (i == now_page) {
						retVal = retVal + "&nbsp;&nbsp;" + "<font size='20px'><b>" + i + "</b></font>";
					} else {
						retVal = retVal + "&nbsp;&nbsp;" + "<a href='javascript:getPagingStr(\"" + jspFileName + "\", \"" + i  +  "\", \"" + query + "\")'>[" + i + "]</a>";
					}
				}  

				      retVal = retVal + "&nbsp;&nbsp;" + "<a href='javascript:getPagingStr(\"" + jspFileName  + "\", \"" +  (lastPageOfCurrentBlock + 1) + "\", \"" + query + "\")'>[next]</a>...<a href='javascript:getPagingStr(\"" + jspFileName + "\", \"" + total_page + "\", \"" + query + "\")'>[" + total_page + "]</a>";
			}

		}  

		return retVal;
	}

	
}

