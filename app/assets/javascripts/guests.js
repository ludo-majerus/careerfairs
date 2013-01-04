$(document).ready(function() {
	$("#guest_event_id").change(function() {
	    idEvent = $("#guest_event_id").val();
	    var data = null;
	    $.getJSON('/events/'+idEvent+'.json',function(data)
	    { 
	      $("#eventName").fadeToggle("slow", "linear");    
	      $("#eventName").html(data.event_name); 
	    })  
    })
})
