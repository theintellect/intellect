package org.intellect.model;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.appengine.api.utils.SystemProperty;

import java.sql.*;

public class DBConnection {

	/**
	 * 
	 * @return
	 */
	public DBConnection getConnection() {
		return new DBConnection();
	}

	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public Connection createConnection() throws Exception {

		String url = null;
		if (SystemProperty.environment.value() == SystemProperty.Environment.Value.Production) {
			Class.forName("com.mysql.jdbc.GoogleDriver");
			url = "jdbc:google:mysql://theintellect-908:intellectdb/intellectdb?user=root";
		} else {
			Class.forName("com.mysql.jdbc.Driver");
			url = "jdbc:mysql://173.194.83.108:3306?user=root";
		}

		Connection conn = DriverManager.getConnection(url);
		return conn;
	}

	/**
	 * 
	 * @param iSBN
	 * @return
	 * @throws Exception
	 */
	public ArrayList<Chapter> getAllChapters(String iSBN) throws Exception {
		Connection conn = createConnection();
		ResultSet rs = conn
				.createStatement()
				.executeQuery(
						"select c.chapterId, c.bookId, c.chapterName, c.chapterLink from chapters c, books b where b.bookId = c.bookId and ISBN =\'"
								+ iSBN + "\';");
		ArrayList<Chapter> chapters = new ArrayList<Chapter>();
		while (rs.next()) {
			Chapter chapter = new Chapter(rs.getInt("chapterId"),
					rs.getInt("bookId"), rs.getString("chapterName"),
					rs.getString("chapterLink"),null,null);
			chapters.add(chapter);
			System.out.println(chapter.toString());
		}
		conn.close();
		return chapters;
	}

	/**
	 * 
	 * @param bookId
	 * @param chapterName
	 * @return
	 * @throws Exception
	 */
	public Chapter getChapter(int bookId, String chapterName) throws Exception {
		Connection conn = createConnection();
		ResultSet rs = conn
				.createStatement()
				.executeQuery(
						"select c.chapterId, c.bookId, c.chapterName, c.chapterLink from books b inner join chapters c on b.bookId = c.bookId where b.bookId = "
								+ bookId
								+ " and chapterName = \'"
								+ chapterName
								+ "\';");
		Chapter chapter = null;
		while (rs.next()) {
			chapter = new Chapter(rs.getInt("chapterId"), rs.getInt("bookId"),
					rs.getString("chapterName"), rs.getString("chapterLink"),null,null);
		}
		conn.close();
		return chapter;
	}

	/**
	 * 
	 * @param playlistId
	 * @param chapter
	 * @throws Exception
	 */
	public void addChapterToPlaylist(int playlistId, Chapter chapter)
			throws Exception {
		Connection conn = createConnection();
		PreparedStatement preparedStatement = null;
		String query = "insert into playlistDetails values(" + playlistId + ","
				+ chapter.getChapterId() + ");";
		preparedStatement = conn.prepareStatement(query);
		preparedStatement.executeUpdate();
		conn.close();
	}

	/**
	 * 
	 * @param playlistId
	 * @param title
	 * @throws SQLException
	 */
	public void removeChapter(int playlistId, Chapter chapter) throws Exception {
		Connection conn = createConnection();
		conn.createStatement().executeQuery(
				"Delete from playlistDetails where playlistId =" + playlistId
						+ "and chapterId =" + chapter.getChapterId() + ";");
		conn.close();
	}

	/**
	 * 
	 * @param playlistId
	 * @return
	 * @throws Exception
	 */
	public ArrayList<Chapter> getAllChapters(int playlistId) throws Exception {
		Connection conn = createConnection();

		ResultSet rs = conn
				.createStatement()
				.executeQuery(
						"select c.chapterId, c.bookId, c.chapterName, c.chapterLink  from playlist p inner join playlistDetails pd on p.playlistId = pd.playlistId inner join chapters c on pd.chapterId = c.chapterId where pd.playlistId ="
								+ playlistId + ";");
		ArrayList<Chapter> chapters = new ArrayList<Chapter>();
		while (rs.next()) {
			Chapter chapter = new Chapter(rs.getInt("chapterId"),
					rs.getInt("bookId"), rs.getString("chapterName"),
					rs.getString("chapterLink"),null,null);
			chapters.add(chapter);
			System.out.println(chapter.toString());
		}
		conn.close();
		return chapters;
	}

	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public ArrayList<Playlist> getUserPlaylists(String userName) throws Exception {
		Connection conn = createConnection();
		ResultSet rs = conn.createStatement().executeQuery(
				"select playlistId, playlistName, p.userId from playlist p, users u where p.userId = u.userId and username = \'"
						+ userName + "\';");
		ArrayList<Playlist> playlists = new ArrayList<Playlist>();
		while (rs.next()) {
			Playlist playlist = new Playlist(rs.getInt("playlistId"),
					rs.getString("playlistName"), rs.getString("userId"),
					getAllChapters(rs.getInt("playlistId")));
			playlists.add(playlist);
			System.out.println(playlist.toString());
		}
		conn.close();
		return playlists;
	}

	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public int maxPlaylistId() throws Exception {
		Connection conn = createConnection();
		ResultSet rs = conn.createStatement().executeQuery(
				"select max(playlistId) as max_id from  playlist;");
		int id = 0;
		while (rs.next()) {
			id = rs.getInt("playlistId");
		}
		conn.close();
		return id;
	}

	/**
	 * 
	 * @param playlist
	 * @throws Exception
	 */
	public void createNewPlaylist(Playlist playlist) throws Exception {
		Connection conn = createConnection();
		conn.createStatement().executeQuery(
				"Insert into playlist values(" + playlist.getPlaylistId() + ",\'"
						+ playlist.getName() + "\'," + playlist.getUserId()
						+ ");");
		conn.close();
	}

	/**
	 * 
	 * @param newName
	 * @param playlist
	 */
	public void renamePlaylist(String newName, Playlist playlist)
			throws Exception {
		Connection conn = createConnection();
		conn.createStatement().executeQuery(
				"update playlist set playlistName = \'" + newName
						+ "\' where playlistId = " + playlist.getPlaylistId()
						+ ";");
		conn.close();
	}

	/**
	 * 
	 * @param name
	 * @return
	 */
	public void deletePlaylist(Playlist playlist) throws Exception {
		Connection conn = createConnection();
		conn.createStatement().executeQuery(
				"delete from playlist where playlistId = "
						+ playlist.getPlaylistId() + ";");
		conn.close();
	}

	/**
	 * 
	 * @param keyword
	 * @return
	 */
	public ArrayList<Chapter> search(String keyword) throws Exception {
		Connection conn = createConnection();
		ResultSet rs = conn
				.createStatement()
				.executeQuery(
						"select c.chapterId, c.bookId, c.chapterName, c.chapterLink, b.bookTitle, b.isbn from chapters c inner join books b on b.bookId = c.bookId where bookTitle like\'%"
								+ keyword
								+ "%\' or chapterName like\'%"
								+ keyword
								+ "%\' or isbn like\'%"
								+ keyword + "%\';");
		ArrayList<Chapter> chapters = new ArrayList<Chapter>();
		while (rs.next()) {
			Chapter chapter = new Chapter(rs.getInt("chapterId"),
					rs.getInt("bookId"), rs.getString("chapterName"),
					rs.getString("chapterLink"),
					rs.getString("bookTitle"),
					rs.getString("isbn"));
			chapters.add(chapter);
			System.out.println(chapter.toString());
		}
		conn.close();
		return chapters;
	}

	public ArrayList<Book> listAllBooks() throws Exception {
		Connection conn = createConnection();
		ResultSet rs = conn
				.createStatement()
				.executeQuery(
						"select bookId, isbn, bookTitle, authorName, category from books;");
		ArrayList<Book> books = new ArrayList<Book>();

		while (rs.next()) {
			Book book = new Book(rs.getInt("bookId"), rs.getString("isbn"),
					rs.getString("bookTitle"), rs.getString("authorName"),
					rs.getString("category"), 
					getAllChapters(rs.getString("isbn")));
			books.add(book);
			System.out.println(book.toString());
		}
		conn.close();
		return books;
	}

	public Chapter getChapter(int chapterID) throws Exception {
		Connection conn = createConnection();
		
		ResultSet rs = conn
				.createStatement()
				.executeQuery(
						"select c.chapterId, c.bookId, c.chapterName, c.chapterLink, b.bookTitle, b.isbn from chapters c, books b "
						+ "where b.bookId = c.bookId and c.chapterId ="
								+ chapterID + ";");
		Chapter chapter = new Chapter();
		while (rs.next()) {
			chapter = new Chapter(rs.getInt("chapterId"),
					rs.getInt("bookId"), rs.getString("chapterName"),
					rs.getString("chapterLink"),
					rs.getString("bookTitle"),
					rs.getString("isbn"));
			System.out.println(chapter.toString());
		}
		conn.close();
		return chapter;
	}
}