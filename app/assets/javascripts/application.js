// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require editor.md/editormd
$(function() {
    var editor = editormd("editormd", {
        path : "/assets/editor.md/lib/" // Autoload modules mode, codemirror, marked... dependents libs path
    });

    /*
    // or
    var editor = editormd({
    id   : "editormd",
    path : "../lib/"
    });
    */
});

$(function(){ $(document).foundation(); });
