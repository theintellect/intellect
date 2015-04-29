package org.intellect.model;

import java.util.ArrayList;

public class Playlist {
	private int playlistId = 20;
	private String name = "";
	private String userId = "";
	private ArrayList<Chapter> chapters = new ArrayList<Chapter>();
	private DBConnection dbc = new DBConnection();//.getConnection();
	
	public Playlist(String name, String userId){
		this.name = name;
		this.userId = userId;
		try {
			playlistId = dbc.maxPlaylistId() + 1;
			dbc.createNewPlaylist(new Playlist(name,userId,playlistId));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Playlist(String name, String userId, int playlistId){
		this.name = name;
		this.userId = userId;
		this.playlistId = playlistId;
	}
	
	public Playlist(int playlistId, String name, String userId,
			ArrayList<Chapter> chapters) {
		this.name = name;
		this.userId = userId;
		this.playlistId = playlistId;
		this.chapters = chapters;
	}

	public boolean addChapterToPlaylist(Chapter chapter) throws Exception{
			dbc.addChapterToPlaylist(playlistId, chapter);
		return chapters.add(chapter);
	}
	
	public ArrayList<Chapter> removeChapter(Chapter chapter) throws Exception{
		dbc.removeChapter(playlistId, chapter);
		listAllChapters();
		return (ArrayList<Chapter>) chapters;
	}
	
	public void renamePlaylist(String newName) throws Exception{
		dbc.renamePlaylist(newName, new Playlist(name,userId,playlistId));
		this.name = newName;
	}
	
	public ArrayList<Chapter> listAllChapters() throws Exception{
		chapters.clear();
		chapters.addAll(dbc.getAllChapters(playlistId));
		return (ArrayList<Chapter>) chapters;
	}

	public boolean addBook(Book book) throws Exception{
		for(Chapter ch : book.listAllChapters()){
			dbc.addChapterToPlaylist(playlistId, ch);
		}
		return chapters.addAll(book.listAllChapters());
	}
	
	public void deletePlaylist() throws Exception{
		dbc.deletePlaylist(new Playlist(name,userId,playlistId));
	}
	
	public String getName() {
		return name;
	}
	
	public int getPlaylistId(){
		return playlistId;
	}
	
	public String getUserId(){
		return userId;
	}
}