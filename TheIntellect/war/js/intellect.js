


var main = function() {
	// New playlist
	var plNum = 4;
	//HTML tag to insert a new playlist. Right now it is hard coded to create a MDT playlist each time
	$('#newP').click(function() {
		newPlHTML = "<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><form class='form-inline'><div class='form-group'><div class='input-group'><input type='text' class='form-control' id='exampleInputAmount' placeholder='Name your playlist'></div></div><button type='submit' class='btn btn-primary' id='newPlBut'>Create</button></form></div></div>";
		$(newPlHTML).insertAfter('.insertPl');
	});	


	// Edit playlist name
	$('.glyphicon-pencil').click(function() {
		newPlTitle = prompt("Enter new Playlist name:");
		console.log($(this).parent().parent().find('.plTitle').replaceWith("<a data-toggle='collapse' data-parent='#accordionP' href='#collapseOne' id='plTitle1' class='plTitle'><span class='glyphicon glyphicon-bookmark'></span>"+newPlTitle+"</a>"));
	});

	// Remove an item (either playlist or chapter from a playlist)
	$('.glyphicon-remove').click(function() {
		$(event.target).closest('.item').remove();
	})
}


$( document ).ready(main());
