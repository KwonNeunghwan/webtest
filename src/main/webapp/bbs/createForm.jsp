<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>homepage</title>
<meta charset="utf-8">
</head>
<body>
        <jsp:include page="/menu/top.jsp" />
        
                <h3>게시판 생성</h3>
                <form action="createProc.jsp" method="post">
 
                        <div class="mb-3 mt-3">
                                <label for="wname">이름:</label> <input type="text"
                                        class="form-control" id="wname" placeholder="Enter wname"
                                        name="wname">
                        </div>
                        <div class="mb-3 mt-3">
                                <label for="title">제목:</label> <input type="text"
                                        class="form-control" id="title" placeholder="Enter title"
                                        name="title">
                        </div>
                        <div class="mb-3 mt-3">
                                <label for="content">내용:</label>
                                <textarea class="form-control" rows="5" id="content" name="content"></textarea>
                        </div>
                        <div class="mb-3 mt-3">
                                <label for="pw">비밀번호:</label> <input type="password"
                                        class="form-control" id="passwd" placeholder="Enter passwd"
                                        name="passwd">
                        </div>
 
                        <button type="submit" class="btn btn-primary">Submit</button>
 
                </form>
      
</body>
</html>