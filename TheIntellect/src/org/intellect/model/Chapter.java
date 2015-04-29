package org.intellect.model;

public class Chapter {
	private int chapterId = 0;
	private int bookId = 0;
	private String bookName = "";
	private String isbn = "";
	private String chapterName = "";
	private String pathInFileSystem = "";
	private DBConnection dbc = new DBConnection();
	
	public Chapter() {
	}
	
	public Chapter(int chapterId, int bookId, String name, String path, String bookName, String isbn){
		this.bookId = bookId;
		this.chapterName = name;
		this.pathInFileSystem = path;
		this.chapterId = chapterId;
		this.bookName = bookName;
		this.isbn = isbn;
	}
	
	public Chapter getChapter(int bookId, String chapterName) throws Exception{
		Chapter temp = dbc.getChapter(bookId, chapterName);
		this.chapterName = temp.chapterName;
		this.chapterId = temp.chapterId;
		this.bookId = temp.bookId;
		this.pathInFileSystem = temp.pathInFileSystem;
		this.bookName = temp.bookName;
		this.isbn = temp.isbn;
		return this;
	}
	
	public String getPath(){
		return pathInFileSystem;
	}

	public String getChapterName() {
		return chapterName;
	}
	 
	public int getChapterId(){
		return chapterId;
	}
	
	public int getBookId(){
		return bookId;
	}

	public String getBookName(){
		return bookName;
	}

	public String getISBN(){
		return isbn;
	}
	
	public String toString(){
		return chapterId+"\t"+chapterName+"\t"+bookId+"\t"+pathInFileSystem+"\n";
	}

	public Chapter getChapter(int chapterID) throws Exception {
		Chapter temp = dbc.getChapter(chapterID);
		this.chapterName = temp.chapterName;
		this.chapterId = temp.chapterId;
		this.bookId = temp.bookId;
		this.pathInFileSystem = temp.pathInFileSystem;
		this.bookName = temp.bookName;
		this.isbn = temp.isbn;
		return this;
	}
}