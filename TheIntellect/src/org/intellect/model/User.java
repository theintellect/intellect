package org.intellect.model;

import java.util.ArrayList;

public class User {
	private String userName = "";
	private String fname = "";
	private DBConnection dbc = new DBConnection();//.getConnection();
	private ArrayList<Playlist> userPlaylists = new ArrayList<Playlist>();
	
	public User(String uId, String fname, String lname, String email) {
		this.userName = uId;
		this.fname = fname;
		try{
		userPlaylists.add(new Playlist("Default", userName));
		listAllPlaylist();
		}
		catch (Exception e){
		
		}
	}

	public ArrayList<Playlist> listAllPlaylist() throws Exception{	
		userPlaylists.clear();
		userPlaylists.addAll(dbc.getUserPlaylists(userName));
		return (ArrayList<Playlist>) userPlaylists;
	}
	
	public Playlist getPlaylistByName(String name){
		for(Playlist temp : userPlaylists){
			if(temp.getName().equalsIgnoreCase(name)){
				return temp;
			}
		}
		return null;
	}
	
	public String getFname(){
		return fname;
	}
}