// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap
//= require_tree .


$(document).ready(function(){
    $("#inclunch").click(function(){
        $(":text[id='companytoevent_lunch']").val( Number($(":text[id='companytoevent_lunch']").val()) + 1 );
    });
    $("#declunch").click(function(){
        if($(":text[id='companytoevent_lunch']").val() >0)
             $(":text[id='companytoevent_lunch']").val( Number($(":text[id='companytoevent_lunch']").val()) - 1 );
    });


    $("#incdesk").click(function(){
        $(":text[id='companytoevent_desk']").val( Number($(":text[id='companytoevent_desk']").val()) + 1 );
    });
    $("#decdesk").click(function(){
        if($(":text[id='companytoevent_desk']").val() >0)
            $(":text[id='companytoevent_desk']").val( Number($(":text[id='companytoevent_desk']").val()) - 1 );
    });


    $("#incchair").click(function(){
        $(":text[id='companytoevent_chair']").val( Number($(":text[id='companytoevent_chair']").val()) + 1 );
    });
    $("#decchair").click(function(){
        if($(":text[id='companytoevent_chair']").val() >0)
            $(":text[id='companytoevent_chair']").val( Number($(":text[id='companytoevent_chair']").val()) - 1 );
    });


    $("#inctable").click(function(){
        $(":text[id='companytoevent_table']").val( Number($(":text[id='companytoevent_table']").val()) + 1 );
    });
    $("#dectable").click(function(){
        if($(":text[id='companytoevent_table']").val() >0)
            $(":text[id='companytoevent_table']").val( Number($(":text[id='companytoevent_table']").val()) - 1 );
    });

    $("#inctrash").click(function(){
        $(":text[id='companytoevent_trash']").val( Number($(":text[id='companytoevent_trash']").val()) + 1 );
    });
    $("#dectrash").click(function(){
        if($(":text[id='companytoevent_trash']").val() >0)
            $(":text[id='companytoevent_trash']").val( Number($(":text[id='companytoevent_trash']").val()) - 1 );
    });


    $("#incrack").click(function(){
        $(":text[id='companytoevent_clothesrack']").val( Number($(":text[id='companytoevent_clothesrack']").val()) + 1 );
    });
    $("#decrack").click(function(){
        if($(":text[id='companytoevent_clothesrack']").val() >0)
            $(":text[id='companytoevent_clothesrack']").val( Number($(":text[id='companytoevent_clothesrack']").val()) - 1 );
    });

    $("#incshelf").click(function(){
        $(":text[id='companytoevent_shelf']").val( Number($(":text[id='companytoevent_shelf']").val()) + 1 );
    });
    $("#decshelf").click(function(){
        if($(":text[id='companytoevent_shelf']").val() >0)
            $(":text[id='companytoevent_shelf']").val( Number($(":text[id='companytoevent_shelf']").val()) - 1 );
    });

    $('input.span1').bind('keypress', function(e) { 
        return ( e.which!=8 && e.which!=0 && (e.which<48 || e.which>57)) ? false : true ;
    })


});




