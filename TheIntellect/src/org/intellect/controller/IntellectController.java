package org.intellect.controller;

import java.util.ArrayList;

import org.intellect.model.*;

public class IntellectController {

	String userName = "shree";
	String fname = "Shree";
	String lname = "Iyer";
	String email = "shree@cmu.edu";
	
	User user1 = new User(userName, fname, lname, email);
	
	// rename/edit playlist
	public void renamePlaylist(String newName, String oldName) throws Exception{
		Playlist ply = user1.getPlaylistByName(oldName);
		ply.renamePlaylist(newName);
	}
	
	// populate playlist
	public ArrayList<Playlist> getAllPlaylists() throws Exception{
		return user1.listAllPlaylist();
	}
	
	// delete playlist
	public ArrayList<Playlist> deletePlaylist(String name) throws Exception{
		Playlist ply = user1.getPlaylistByName(name);
		ply.deletePlaylist();
		return user1.listAllPlaylist();
	}
	
	// search for a chapter
	public ArrayList<Chapter> search(String keyword) throws Exception{
		Control control = new Control();
		return control.search(keyword);
	}
	
	// add chapter to playlist
	public ArrayList<Playlist> addChapterToPlaylist(String playlistName, Chapter chapter) throws Exception{
		Playlist ply = user1.getPlaylistByName(playlistName);
		ply.addChapterToPlaylist(chapter);
		return user1.listAllPlaylist();
	}
	
	// add playlist
	public ArrayList<Playlist> addPlaylist(String name) throws Exception{
		Playlist ply = new Playlist(name, userName);
		return user1.listAllPlaylist();
	}
	
	// populate all books
	public ArrayList<Book> listAllBooks() throws Exception{
		Control control = new Control();
		return control.getAllBooks();
	}
}