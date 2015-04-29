<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.intellect.controller.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.intellect.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Intellect</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<style>
body {
	padding-top: 70px;
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
}
</style>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<%
		IntellectController control = new IntellectController();
		ArrayList playlists = control.getAllPlaylists();
		ArrayList books = control.listAllBooks();
		String searchText = request.getAttribute("output").toString();
	%>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="container-float">
				<a id="logo" class="navbar-brand"
					href="http://1-dot-theintellect-908.appspot.com/"><img
					src="fonts/logo2.svg">Intellect</a>
			</div>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<form class="navbar-form navbar-left" role="search"
					action="theintellect" method="GET">
					<div class="form-group">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="searchBook" type="text" class="form-control"
							placeholder="Looking for something?">
					</div>
					<button type="submit" class="btn btn-success">Search</button>
				</form>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Shree
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu" style="color: #333;">
						<li><a href="#">Profile</a></li>
						<li><a href="#">Sign out</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<style>
body {
	background-color: #eee;
}
</style>
	<hr>
	<div class="container-fluid">
		<div class="jumbotron">
			<h2>Chapter List</h2>
		</div>
		<div class="row">
		    <div class="col-sm-2"></div>
		    <div class="col-sm-8">
				<table class="table table-hover">
				  <thead>
			          <tr>
			              <th>#</th>
			              <th>Book</th>
			              <th>Chapter</th>
			              <th>Add to Playlist</th>
			          </tr>
			      </thead>
	      <tbody>
<%
ArrayList<Chapter> chapters = control.search(searchText);																																																																																											
Iterator ic = chapters.iterator();
int i = 1;
while(ic.hasNext()){
	Chapter c = (Chapter) ic.next();
												%>
	      
	          <tr>
			              	<form action="theintellect"  method="POST">
	              <td><%out.println(i);%></td>
	              <td><a href="http://theintellect-908.appspot.com/theintellect?searchBook=<%out.println(c.getISBN());%>"><%out.println(c.getBookName());%></a></td>
	              <td><a href="<%out.println(c.getPath());%>"><%out.println(c.getChapterName());%></a></td>
			              <td>
								<div class="row">
									 <!-- Playlist Selector -->
									 <div class="col-md-3 col-sm-3 col-xs-4">
									     <select name="playlist" class="form-control" >
									     <%for(Object p : playlists) {%>>
									         <option><%out.print(((Playlist)p).getName()); %>
									         </option>
									         <% }%>
									     </select>
									 </div>
									 <input type="hidden" name="chapterID" value=<%out.println(c.getChapterId());%>>
									<!-- Submit button -->
									<div class="col-md-3 col-sm-3 col-xs-4">
									    <input class="btn btn-sm btn-success" type="submit" value="Add">
									</div> 
								</div>                   
			              </td>
	          							</form>
	          </tr>
             
	          
<%i++;} %>	          
	          
	      </tbody>
		</table>
			</div>
			<div class="col-sm-2"></div>
		</div>

			
	</div>
	<div id="push"></div>


	<!-- Footer -->
	<nav class="navbar navbar-inverse navbar-fixed-bottom"
		role="navigation">
	<div class="container-fluid">
		<ul class="list-inline" style="color: #999; padding-top: 10px;">
			<li style="text-align: left;"><strong>Built by</strong>:</li>
			<li>Anuj</li>
			<li>|</li>
			<li>Anushe</li>
			<li>|</li>
			<li>Brad</li>
			<li>|</li>
			<li>Sookyee</li>
			<li>|</li>
			<li>Shree</li>
			<li>|</li>
			<li>Camilo</li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>
			<li style="text-align: right;"><strong><a href="http://intellectbooks.weebly.com/">Report</a></strong></li>
		</ul>
	</div>

	<!-- /.container --> </nav>

	<!-- jQuery Version 1.11.1 -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Intellect JS -->
	<script src="js/intellect.js"></script>

</body>
</html>