package one.page;

public class PageModule {

	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp){
		
		
		//총페이지 수 구하기
		int totalPage= (totalCnt/listSize)+1;
		if(totalCnt%listSize==0)totalPage--;
		
		//페이지 나누기
		int userGroup = cp/pageSize;
		if(cp%pageSize==0)userGroup--;
	
	
		StringBuffer sb= new StringBuffer();
				
		if(userGroup!=0){
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp=(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>[◀]</a>");
			//%><a href="pageTest.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><% //왼쪽 화살표
		}
	
	
		for(int i=(userGroup*pageSize+1) ; i<=(userGroup*pageSize+pageSize); i++){
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			// %>&nbsp;&nbsp;<a href="pageTest.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
			
			if(i==totalPage)break;
		}
	
	
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int tmmp=(userGroup+1)*pageSize+1;
			sb.append(tmmp);
			sb.append("'>[▶]</a>");
			//%><a href="pageTest.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a><% //오른쪽 화살표
		}
		//System.out.println(sb.toString());
		return sb.toString();
		
		
	}
}
