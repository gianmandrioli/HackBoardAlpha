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

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require trix

// encerrar todo el javascript dentro del evento turbolinks load

document.addEventListener('turbolinks:load', (e) => {

    // if ($(‘#botonsidebar’).hasClass(‘active’)) {
    //     $(#colsidebar).addClass(‘active’);
    // }

    // $("#botonsidebar").click(function(){
    //     $("#colsidebar").css("active")
    // })

    $('#searchButton').attr('disabled', true);
    $('#searchText').keyup(function () {
        if ($(this).val().length != 0)
            $('#searchButton').attr('disabled', false);
        else
            $('#searchButton').attr('disabled', true);
    })

    $('pre').each(function(i, block){
        hljs.highlightBlock(block);
    });
    $('#labpregunta').click(function () {
        $('#anunciocat').hide();
        $('#ideacat').hide();
        $('#ingresacategoria').hide();
        $('#preguntacat').show();

    })
    $('#labanuncio').click(function () {
        $('#anunciocat').show();
        $('#ingresacategoria').hide();
        $('#ideacat').hide();
        $('#preguntacat').hide();

    })
    $('#labidea').click(function () {
        $('#anunciocat').hide();
        $('#ingresacategoria').hide();
        $('#ideacat').show();
        $('#preguntacat').hide();

    })
    $(document)
        .on('focus.autoExpand', 'textarea.autoExpand', function () {
            var savedValue = this.value;
            this.value = '';
            this.baseScrollHeight = this.scrollHeight;
            this.value = savedValue;
        })
        .on('input.autoExpand', 'textarea.autoExpand', function () {
            var minRows = this.getAttribute('data-min-rows') | 0, rows;
            this.rows = minRows;
            rows = Math.ceil((this.scrollHeight - this.baseScrollHeight) / 16);
            this.rows = minRows + rows;
        });
})