<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/ssi/ssi_notice.jsp" %>
<jsp:useBean id = "dao" class = "com.notice.NoticeDAO"/>

<%
	//검색부분
	String col = Utility.chechNull(request.getParameter("col"));
	String word = Utility.chechNull(request.getParameter("word"));
	
	if(col.equals("total")){
		word = "";
	}
	
	//페이지 처리
	int nowPage = 1; //현재 페이지
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerpage = 3; //한페이지당 보여줄 레코드 갯수 -> 디비에서 가져올 갯수
	
	int sno = (nowPage-1)*recordPerpage; //디비에서 가져올 시작 레코드 순번	
	
	
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno",sno);
	map.put("eno",recordPerpage);
	
 	List<NoticeDTO> list = dao.list(map);
 	
 	int total = dao.total(col,word);
 	
 	String url = "list.jsp";
 	
 	String paging = Utility.paging(total, nowPage, recordPerpage, col, word, url);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <script>
  function read(noticeno){
	  let url = "read.jsp";
	  url+="?noticeno=" +noticeno;
	  url += "&nowPage=<%=nowPage%>";
	  url += "&col=<%=col%>";
	  url += "&word=<%=word%>";
	  
	  location.href = url;
  }
  </script>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page ="/menu/top.jsp"/>

  <h2>공지사항 목록</h2>   
 
   <form action="list.jsp">
   <div class = "row mb-3 mt-3"> 
   	<div class = "col">
   		<select class="form-select" id="sel1" name="col">
      		<option value = "wname" 
      		<%if(col.equals("wname")) out.print("selected");%>
      		>성명</option>
      		<option value = "title"
      		<%if(col.equals("title")) out.print("selected");%>>제목</option>
      		<option value = "content"
      		<%if(col.equals("content")) out.print("selected");%>>내용</option>
      		<option value = "title_content"
      		<%if(col.equals("title_content")) out.print("selected");%>>제목+내용</option>
      		<option value = "total"
      		<%if(col.equals("total")) out.print("selected");%>>전체출력</option>
   		</select>
    	</div>
    <div class="col">
      <input type="search" class="form-control" name="word" required = "required" value="<%=word%>">
    </div>
    <div class="col">
    <button type="submit" class="btn btn-primary">검색</button>
    <button type="submit" class="btn btn-primary" onclick = "location.href='createForm.jsp'">등록</button>
  	</div>
 	</div>
 	</form>
 	<table class = "table table-boarder">
    <thead>
      <tr>
        <th>번호 </th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>등록날짜</th>
        <th>grpno</th>
        <th>indent</th>
        <th>ansnum</th>
      </tr>
    </thead>
    <tbody>
    <%if(list.size()==0){ %>
    	<tr><td colspan = '8'> 등록된 글이 없습니다. </td></tr>
    <%} else{
    	
    	for(int i = 0; i<list.size(); i++){
    		NoticeDTO dto = list.get(i);
    %>
    	<tr>
    		<td><%=dto.getNoticeno() %> </td>
    		<td>
    		<%
    			for(int r=0; r<dto.getIndent(); r++){
    				out.print("&nbsp;&nbsp");
    			}
    			if(dto.getIndent()>0){
    				out.print("<img src = '../images/(0)re.jpg'>");
    			}
    		%>
    		<a href="javascript:read('<%=dto.getNoticeno()%>')"> <%=dto.getTitle()%> </a>
    		<% if(Utility.compareDay(dto.getRdate())){
    			out.print("<img src = '../images/new.gif'>");
    		}%>
    		</td>
    		<td><%=dto.getWname() %> </td>
    		<td><%=dto.getCnt() %> </td>
    		<td><%=dto.getRdate() %> </td>
    		<td><%=dto.getGrpno() %> </td>
    		<td><%=dto.getIndent() %> </td>
    		<td><%=dto.getAnsnum() %> </td>
    		
     	</tr>
 <%
	 }
    } 
 %>
  </table>
  <%=paging %>

</body>
</html>




