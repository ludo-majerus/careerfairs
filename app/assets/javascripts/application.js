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


$(function(){
    $("#inclunch").click(function(){
        $(":text[name='qtlunch']").val( Number($(":text[name='qtlunch']").val()) + 1 );
    });
    $("#declunch").click(function(){
        if($(":text[name='qtlunch']").val() >0)
            $(":text[name='qtlunch']").val( Number($(":text[name='qtlunch']").val()) - 1 );
    });
});

$(function(){
    $("#incdesk").click(function(){
        $(":text[name='qtdesk']").val( Number($(":text[name='qtdesk']").val()) + 1 );
    });
    $("#decdesk").click(function(){
        if($(":text[name='qtdesk']").val() >0)
            $(":text[name='qtdesk']").val( Number($(":text[name='qtdesk']").val()) - 1 );
    });
});

$(function(){
    $("#incchair").click(function(){
        $(":text[name='qtchair']").val( Number($(":text[name='qtchair']").val()) + 1 );
    });
    $("#decchair").click(function(){
        if($(":text[name='qtchair']").val() >0)
            $(":text[name='qtchair']").val( Number($(":text[name='qtchair']").val()) - 1 );
    });
});

$(function(){
    $("#inctable").click(function(){
        $(":text[name='qttable']").val( Number($(":text[name='qttable']").val()) + 1 );
    });
    $("#dectable").click(function(){
        if($(":text[name='qttable']").val() >0)
            $(":text[name='qttable']").val( Number($(":text[name='qttable']").val()) - 1 );
    });
});

$(function(){
    $("#inctrash").click(function(){
        $(":text[name='qttrash']").val( Number($(":text[name='qttrash']").val()) + 1 );
    });
    $("#dectrash").click(function(){
        if($(":text[name='qttrash']").val() >0)
            $(":text[name='qttrash']").val( Number($(":text[name='qttrash']").val()) - 1 );
    });
});


$(function(){
    $("#incrack").click(function(){
        $(":text[name='qtrack']").val( Number($(":text[name='qtrack']").val()) + 1 );
    });
    $("#decrack").click(function(){
        if($(":text[name='qtrack']").val() >0)
            $(":text[name='qtrack']").val( Number($(":text[name='qtrack']").val()) - 1 );
    });
});


$(function(){
    $("#incshelf").click(function(){
        $(":text[name='qtshelf']").val( Number($(":text[name='qtshelf']").val()) + 1 );
    });
    $("#decshelf").click(function(){
        if($(":text[name='qtshelf']").val() >0)
            $(":text[name='qtshelf']").val( Number($(":text[name='qtshelf']").val()) - 1 );
    });
});

