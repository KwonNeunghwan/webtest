<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="com.bbs.BbsDAO" />
<jsp:useBean id="dto" class="com.bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" />
<%
boolean flag = dao.create(dto);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판 생성</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
       <jsp:include page="/menu/top.jsp" />
      
                <div class=" p-5 my-5 border">
                        <%
                        if (flag) {
                                out.print("글 등록 성공입니다.");
                        } else {
                                out.print("글 등록 실패입니다.");
                        }
                        %>
                </div>
                <button class="btn btn-light" onclick="location.href='createForm.jsp'">다시
                        등록</button>
                <button type="button" class="btn btn-light"
                        onclick="location.href='list.jsp'">목록</button>
   
</body>
</html>