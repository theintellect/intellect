package org.intellect.model;

import java.util.ArrayList;

public class Control {

	private DBConnection dbc = new DBConnection();//.getConnection();
	
	public ArrayList<Book> getAllBooks() throws Exception{
		return dbc.listAllBooks();
	}
	
	public ArrayList<Chapter> search(String keyword) throws Exception{
		return dbc.search(keyword);
	}	 
}