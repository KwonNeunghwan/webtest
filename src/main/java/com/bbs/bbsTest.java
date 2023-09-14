package com.bbs;

public class bbsTest {
	 
	  public static void main(String[] args) {
	    BbsDAO dao = new BbsDAO();
	    create(dao);
	 
	  }
	 
	  private static void create(BbsDAO dao) {
	    BbsDTO dto = new BbsDTO();
	    dto.setWname("김길동");
	    dto.setTitle("게시판 제목");
	    dto.setContent("게시판 내용");
	    dto.setPasswd("1234");
	    if (dao.create(dto)) {
	      p("성공");
	 
	    } else {
	      p("실패");
	    }
	 
	  }
	 
	  private static void p(String string) {
	    System.out.println(string);
	 
	  }
	 
	}