$(document).ready(function() {
	$("#guest_event_id").change(function() {
	    idEvent = $("#guest_event_id").val();
	    $.getJSON('/events/'+idEvent+'.json',function(data)
	    { 
	      $("#eventLabel").effect( "bounce", "slow" )
   		  $("#eventName").html(data.event_name); 
	    })  
    })
})
$(document).ready(function() {
	$("#status").change(function() {
	    idStatus = $("#status").val();
	    idEvent = $("#idevent").val();
	    $.ajax('/events/'+idEvent+'/guests.js?status='+idStatus);	        	   
    })
})