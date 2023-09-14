<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_notice.jsp"%>
<jsp:useBean id="dao" class="com.notice.NoticeDAO" />
<jsp:useBean id="dto" class="com.notice.NoticeDTO" />
<jsp:setProperty name="dto" property="*" />
<%
int noticeno = Integer.parseInt(request.getParameter("noticeno"));
String passwd = request.getParameter("passwd");
Map map = new HashMap();
map.put("noticeno", noticeno);
map.put("passwd", passwd);
 

boolean flag = false;
boolean pflag = dao.passCheck(map);
if(pflag){
flag = dao.delete(dto.getNoticeno());
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판 삭제</title>
<script>
	function list(){
		let url = "list.jsp";
		url +="?nowPage=<%=request.getParameter("nowPage")%>";
        url +="&col=<%=request.getParameter("col")%>";
        url +="&word=<%=request.getParameter("word")%>";
		location.href = url;
	}
</script>
<meta charset="utf-8">
<body>
<jsp:include page="/menu/top.jsp" />
<div class="container mt-3">
<div class="container p-5 my-5 border">
        <%
         if(!pflag){
             out.print("잘못된 비밀번호 입니다.");
           }else if(flag){
             out.print("글 삭제를 성공했습니다.");
           }else{
           out.print("글 삭제를 실패했습니다.");
           }
         
        %>
</div>
<%
if (!pflag) {
%>
<button class="btn btn-dark" onclick="history.back()">다시시도</button>
<%
}
%>
<button class="btn btn-light" onclick="location.href='createForm.jsp'">다시
        등록</button>
<button type="button" class="btn btn-light"
        onclick="list()">목록</button>
</div>
</body>
</html>