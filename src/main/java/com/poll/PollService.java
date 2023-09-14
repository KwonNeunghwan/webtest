package com.poll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Vector;

import com.utility.DBClose;
import com.utility.DBOpen;

public class PollService {
	
	
	

	public int getMaxNum() {
		int num = 0;
		num = dao.getMaxNum();

		return num;
	}

	public PollDTO read(int num) {

		return dao.read(num);
	}

	public Vector<PollitemDTO> itemList(int num) {

		return idao.itemList(num);
	}

	private PollDAO dao;
	private PollitemDAO idao;

	public PollService() {
		dao = new PollDAO();
		idao = new PollitemDAO();

	}

	public boolean create(PollDTO dto, PollitemDTO idto) {
		boolean flag = false;
		try {
			dao.create(dto);
			idto.setNum(dao.getMaxNum()); // 등록설문 pk-> 항목의 fk
			int size = idto.getItems().length;
			for (int i = 0; i < size; i++) {
				idto.setItem(idto.getItems()[i]);
				idao.create(idto); // 항목하나하나를 등록한다.
			}
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public int total(String col, String word) {
		int total = 0;

		return total;
	}

	public Vector<PollDTO> getList(Map map) {

		Vector<PollDTO> list = dao.getList(map);

		return list;
	}
	
	
	public boolean updateCount(String[] itemnum) {
		boolean flag = false;
		flag = idao.updateCount(itemnum);
		
		return flag;
	}
	
	public Vector<PollitemDTO>getView(int num){
		Vector<PollitemDTO> list = null;
		
		list = idao.getView(num);
		return list;
	}
	
	public int sumCount(int num) {
		int count = 0;
		count = idao.sumCount(num);
		
		return count;
	}

	
}