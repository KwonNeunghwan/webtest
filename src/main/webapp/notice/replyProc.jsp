<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="com.notice.NoticeDAO" />
<jsp:useBean id="dto" class="com.notice.NoticeDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	dao.upAnsnum(map); //기존 답변 ansnum 1증가
	boolean flag = dao.createReply(dto); //답변 등록
%>

<!DOCTYPE html>
<html lang="en">
<head>
<script>
	function list(){
		let url = "list.jsp";
		url += "?nowPage=<%=request.getParameter("nowPage")%>";
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		location.href = url;
	}
</script>
<title>게시판 생성</title>
<body>
<jsp:include page="/menu/top.jsp" />
        <div class="container">
       
                        <%
                        if (flag) {
                                out.print("글 답변 성공입니다.");
                        } else {
                                out.print("글 답변 실패입니다.");
                        }
                        %>
                </div>
                <button class="btn btn-light" onclick="location.href='createForm.jsp'">다시
                        등록</button>
                <button type="button" class="btn btn-light"
                        onclick="list()">목록</button>
        </div>
</body>


</html>