package org.intellect.model;

import java.util.ArrayList;

public class Book {
	private int bookId = 0;
	private String ISBN = "";
	private String title = "";
	private String category = "";
	private String author = "";
	private ArrayList<Chapter> chapters = new ArrayList<Chapter>();
	private DBConnection dbc = new DBConnection();
	
	public Book(String isbn, String title, String category, String author){
		this.ISBN = isbn;
		this.title = title;
		this.category = category;
		this.author = author;
	}
	
	public Book(String isbn, String title, String category, String author, Chapter chapter){
		this.ISBN = isbn;
		this.title = title;
		this.author = author;
		this.category = category;
		chapters.add(chapter);
	}
	
	public Book(String isbn, String title, String category, String author, ArrayList<Chapter> chapters){
		this.ISBN = isbn;
		this.title = title;
		this.category = category;
		this.author = author;
		chapters.addAll(chapters);
	}
	
	public Book(int bookId, String isbn, String title, String category, String author, ArrayList<Chapter> chapters){
		this.bookId = bookId;
		this.ISBN = isbn;
		this.title = title;
		this.category = category;
		this.author = author;
		chapters.addAll(chapters);
	}

	public ArrayList<Chapter> listAllChapters() throws Exception{
		chapters.addAll(dbc.getAllChapters(ISBN));
		return (ArrayList<Chapter>) chapters;
	}

	public String getTitle() {
		return title;
	}

	public String getCategory() {
		return category;
	}

	public String getAuthor() {
		return author;
	}
	public String toString(){
		return bookId+"\t"+ISBN+"\t"+title+"\t"+category+"\t"+author+"\n";
	}
}