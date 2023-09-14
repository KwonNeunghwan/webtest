<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_poll.jsp"%>
<jsp:useBean id="service" class="com.poll.PollService" />
 
<%
int num = 0;
 
if (!(request.getParameter("num") == null || request.getParameter("num").equals(""))) {
    num = Integer.parseInt(request.getParameter("num"));
} else {
    num = service.getMaxNum();
}
 
PollDTO dto = service.read(num);
 
Vector<PollitemDTO> vlist = service.itemList(num);

//투표결과 확인------------------------------------------------

   int sum = service.sumCount(num);

   Vector<PollitemDTO> result = service.getView(num);
   
   String[] color = {"bg-success","bg-info","bg-warning","bg-danger","bg-dark","bg-secondary"};
   


%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    .index-margin{
      margin-top:300px;
    }
    .index2-margin{
      margin-top:50px;
    }
    .left-margin{
      margin-left:800px;
    }
    .loginleft-margin{
      margin-left:1730px;
    }
    .container{
      width:5px;
    }
    .right-margin{
      margin-right:50px;
    }
    .top-margin{
       margin-top:30px;
    } 
  </style>
</head>


<script>
  $(function () {
    $('[data-toggle="popover"]').popover();
  });
</script>



<body>
   
   
   <thead>
   <div class="btn-group  container-fluid ">
        <button type="button" class="btn btn-info " onclick="location.href='<%=root%>/index.jsp'">Home</i></button>
        <button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown">공지사항</button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=root%>/notice/list.jsp">공지사항 목록 </a></li>
            <li><a class="dropdown-item" href="<%=root%>/notice/createForm.jsp">공지사항 생성 </a></li>
          </ul>
        <button type="button" class="btn btn-danger" onclick="location.href = '<%=root%>/webgame/webgame.html'">WEB GAME</button>
        
        <button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown">게시판</button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=root%>/bbs/list.jsp">게시판 목록 </a></li>
            <li><a class="dropdown-item" href="<%=root%>/bbs/createForm.jsp">게시판 생성 </a></li>
          </ul>
          
          <button type="button" class="btn btn-dark" onclick="location.href='<%=root%>/poll/list.jsp'">투표</button>
      </div>

      <span>
        <div class = "btn-group">
        <button class = "btn btn-outline-primary loginleft-margin index2-margin" onclick="location.href='/login.html'">로그인</button>
        <button class = "btn btn-outline-primary index2-margin" onclick ="location.href='/new.html'">회원가입</button>
        </div>
      </span>
    </div>
    </thead>
   
   


   <tfloot>
   <button class="btn btn-primary" type="button"
      data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
      aria-controls="offcanvasRight">
   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-text-fill" viewBox="0 0 16 16">
  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM4.5 5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7zm0 2.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7zm0 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4z"/>         
   </svg>
   </button>

   <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
      aria-labelledby="offcanvasRightLabel">
      <div class="offcanvas-header">
         <h5 class="offcanvas-title" id="offcanvasRightLabel"><div>기타 정보확인
          <button type="button" class="btn btn-secondary mt-3 mb-3" data-toggle="popover" data-content="추가 정보" 
          data-placement="bottom">투표현황</button>
           <div class="modal-body">
 
                <ul class="list-group">
                    <li class="list-group-item">Q : <%=dto.getQuestion()%></li>
                    <li class="list-group-item">총 투표자 : <%=sum%>명
                    </li>
                </ul>
 
                <ol class="list-group list-group-numbered">
                    <%
                    if (sum > 0) {
                        for (int i = 0; i < result.size(); i++) {
                            PollitemDTO idtor = result.get(i);
                            String item = idtor.getItem();//아이템 
                            int j = (int) (Math.random() * (color.length - 1) + 0);
                            String hRGB = color[j];
                            double count = idtor.getCount();//투표수
                            int ratio = (int) (Math.ceil(count / sum * 100));
 
                            //System.out.println("radio:" + ratio);
                    %>
 
                    <li class="list-group-item"><%=item%>
                        <div class="progress">
                            <div class="progress-bar <%=hRGB%>" style="width:<%=ratio%>%"></div>
                        </div> (<%=(int) count%>)
                    </li>
                    <%
                        } //for
                        out.println("</ol>");
                    } else {
                        out.println("<ul class='list-group'><li class='list-group-item'>투표를 먼저 해주세요</li></ul>");
                    }
                    %>
            </div>
           

          </div>
         <button type="button" class="btn-close mt -5" data-bs-dismiss="offcanvas"
            aria-label="Close"></button>
         <ul class="nav justify-content-end fixed-bottom">   
         <li class="nav-item"><a href="#" class="nav-link px-2 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
       <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
     </svg></a></li>
     <li class="nav-item"><a href="#" class="nav-link px-2 text-muted "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-youtube" viewBox="0 0 16 16">
       <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
      </svg></a></li>
     <li class="nav-item"><a href="#" class="nav-link px-2 text-muted "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
       <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
     </svg></a></li>
     </ul>
      </div>
   </div>
   </tfloot>
   

   <tbody>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6 left-margin "><h1 style='margin:5rem'>Homepage</h1></div> 
       </div>
      <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link active" href="<%=root%>/index.jsp">Home</a>
        </li>
 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle"
            data-bs-toggle="dropdown"
            href="#"> 게시판</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=root%>/bbs/list.jsp">게시판 목록 </a></li>
            <li><a class="dropdown-item" href="<%=root%>/bbs/createForm.jsp">게시판 생성 </a></li>
          
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            data-bs-toggle="dropdown"
            href="#"
          >
            공지사항</a
          >
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=root%>/notice/list.jsp">공지사항 목록 </a></li>
            <li><a class="dropdown-item" href="<%=root%>/notice/createForm.jsp">공지사항 생성 </a></li>
          
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link" href="<%=root%>/poll/list.jsp">투표</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Menu 3</a></li>
      </ul>
    </div>
    </tbody>
     <div>
       <img src = "/images/3320jpg.jpg" alt ="일러스트" height ="1600" width="1800">
    </div>
   <jsp:include page ="/menu/bottom.jsp"/>
   
    
    </body>
    </html>