package org.intellect.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.intellect.model.Book;
import org.intellect.model.Chapter;
import org.intellect.model.Control;
import org.intellect.model.DBConnection;
import org.intellect.model.Playlist;

@SuppressWarnings("serial")
public class TheIntellectServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// get the search parameter if it exists
		String search = req.getParameter("searchBook");
		String output=search;

		//redirect output to view search.jsp
		req.setAttribute("output", output);
		resp.setContentType("text/json");
		RequestDispatcher view = req.getRequestDispatcher("search.jsp");
		view.forward(req, resp);
			
	}
	
public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// get the search parameter if it exists
		String playlist = req.getParameter("playlist");
		String output = "";
		int chapterID = Integer.parseInt(req.getParameter("chapterID"));
		IntellectController control = new IntellectController();
		Chapter c = new Chapter();
		try {
			control.addChapterToPlaylist(playlist, c.getChapter(chapterID));
		} catch (Exception e) {
			//e.printStackTrace();
			output = e.toString();
		}
		req.setAttribute("output", output);
		RequestDispatcher view = req.getRequestDispatcher("index.jsp");
		view.forward(req, resp);
	}
	
	
}
