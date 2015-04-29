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
			ArrayList playlists =control.getAllPlaylists();
			ArrayList books = control.listAllBooks();
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
				<a id="logo" class="navbar-brand" href="http://intellectbooks.weebly.com/"><img
					src="fonts/logo2.svg">Intellect</a>
			</div>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<form class="navbar-form navbar-left" role="search" action="theintellect" method="GET">
					<div class="form-group">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="searchBook"
							type="text" class="form-control"
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

	<!-- Carousel -->
	<div id="carousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="container">
					<h2 style="color: white;"> Recommended </h2>
				</div>
				<div class="row">
					<div class="col-sm-2 col-xs-1"></div>
					<div class="col-sm-3 col-xs-3">
						<a href="http://theintellect-908.appspot.com/theintellect?searchBook=978-0-93424-3">
						<img src="images/varian.jpg" alt="Image" class="img-responsive"></a>
					</div>
					<div class="col-sm-3 col-xs-4">
						<a href="http://theintellect-908.appspot.com/theintellect?searchBook=813-1-71840-9">
						<img src="images/DS.jpg" alt="Image" class="img-responsive"></a>
					</div>
					<div class="col-sm-3 col-xs-3">
						<a
							href="http://theintellect-908.appspot.com/theintellect?searchBook=052-1-76633-8">
							<img src="images/datamining.jpg" alt="Image" class="img-responsive"></a>
					</div>
					<div class="col-sm-1 col-xs-1"></div>
				</div>
			</div>
			<!-- item -->
			<div class="item">
				<div class="container">
					<h2 style="color: white;"> New </h2>
				</div>
				<div class="row">
					<div class="col-sm-2 col-xs-1"></div>
					<div class="col-sm-3 col-xs-3">
						<a href="http://theintellect-908.appspot.com/theintellect?searchBook=978-0-93424-3">
						<img src="images/varian.jpg" alt="Image" class="img-responsive"></a>
					</div>
					<div class="col-sm-3 col-xs-4">
						<a href="http://theintellect-908.appspot.com/theintellect?searchBook=111-8-12604-1">
						<img src="images/dataminingforBI.jpg" alt="Image" class="img-responsive"></a>
					</div>
					<div class="col-sm-3 col-xs-3">
						<a href="http://theintellect-908.appspot.com/theintellect?searchBook=012-3-81480-4">
						<img src="images/datamining.jpg" alt="Image" class="img-responsive"></a>
					</div>
					<div class="col-sm-1 col-xs-1"></div>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- .End of Carousel -->
	<!-- Sidebar option 2 -->
	<hr>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6 pull-left">
				<div class="panel panel-group" id="main">
					<div class="panel-body">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#main" href="#accordionP"><span
									class="glyphicon glyphicon-bookmark"></span> Playlists </a><a
									href="#" id="newP"><span
									class="glyphicon glyphicon-plus pull-right"
									style="color: #5cb85c;"> New</span></a>
							</h4>
						</div>
						<div class="panel-collapse collapse panel-scroll" id="accordionP">
							<div class="insertPl"></div>
							<%
								Iterator i = playlists.iterator();
																																															int j=0;
																																										                                    	while(i.hasNext()) {
																																										                                    		Playlist p = (Playlist)i.next();
							%>
							<div class="panel panel-default item">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordionP"
											href="#collapse<%out.print(j);%>" class="plTitle" id="plTitle1"><span
											class="glyphicon glyphicon-bookmark"></span> <%
 	out.println(p.getName());
 %> </a><a href="#"><span class="glyphicon glyphicon-remove pull-right"
											style="color: #d9534f;"></span></a><a href="#"><span
											class="glyphicon glyphicon-pencil pull-right"> &nbsp;
										</span>
									</h4>
								</div>
								<div id="collapse<%out.print(j);%>"
									class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table">
											<tbody>
												<%
													ArrayList<Chapter> chapters = p.listAllChapters();
																																																																																											Iterator ic = chapters.iterator(); 
																																																																																											while(ic.hasNext()){
																																																																																												Chapter c = (Chapter) ic.next();
												%>
												<tr class="item">
													<td><a href="<%out.println(c.getPath());%>"><span
															class="glyphicon glyphicon-book"></span> <%
 	out.println(c.getChapterName());
 %> </a><a href="#"><span class="glyphicon glyphicon-remove pull-right"
															style="color: #d9534f;"></span></a></td>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<%
								j++;}
							%>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordionP"
											href="#collapseX" class="plTitle"><span
											class="glyphicon glyphicon-bookmark"></span> Default</a>
									</h4>
								</div>
								<div id="collapseX" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table">
											<tbody>
												<tr>
													<td><a href="#"><span
															class="glyphicon glyphicon-book"></span> </a><a href="#"><span
															class="glyphicon glyphicon-remove pull-right"
															style="color: #d9534f;"></span></a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Books section -->

			<div class="col-sm-6 pull-left">
				<div class="panel panel-group" id="books">
					<div class="panel-body">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#books"
									href="#accordionB"><span class="glyphicon glyphicon-book"></span>
									Books</a>
							</h4>
						</div>

						<div class="panel-collapse collapse panel-scroll" id="accordionB">
							<!-- Books section -->
							<div class="panel panel-default">
							<%
								Iterator ib = books.iterator();
								int m=0;
								while(ib.hasNext()) {
								Book b = (Book)ib.next();
							%>
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordionB"
											href="#collapsea<%out.print(m);%>"><spanclass="glyphiconglyphicon-book">
											</span><%out.print(b.getTitle());%></a>
									</h4>
								</div>
								<div id="collapsea<%out.print(m);%>"
									class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table">
											<tbody>
												<%ArrayList<Chapter> chaps = b.listAllChapters();
													Iterator ibc = chaps.iterator(); 
													while(ibc.hasNext()){
													Chapter chap = (Chapter) ibc.next();
												%>
												<tr>
													<td><a href="<%out.print(chap.getPath());%>"><spanclass="glyphiconglyphicon-file">
															</span><%out.print(chap.getChapterName());%></a></td>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
								</div><% m++;}
							%>
							<!-- Books section -->
						</div>

					</div>
				</div>
			</div>

			<!--section
            <div id="main-wrapper" class="col-md-9 col-sm-9 pull-right">
                <div id="main">

                    <div class="row">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <!-- /.container -->
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

