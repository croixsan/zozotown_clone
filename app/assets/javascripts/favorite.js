$(function(){
    window.onload = function(){
        var itemNumber = $('#item-length').data('id')
        if(itemNumber == 0) {
            $("#js-item-none-content").css('display','block')
        }
        else {
            $("#js-item-content").css('display','block')
        }
    }
})

$(function() {
    $('.tab li').click(function() {
        var tabName = $(this).attr('id')
        var itemNumber = $('#item-length').data('id');
        var blandNumber = $('#bland-length').data('id');
        var shopNumber = $('#shop-length').data('id');
        $('.tab li').removeClass('select');
        $(this).addClass('select');
        $(".content").css('display','none');
        if(tabName == 'js-item' && itemNumber == 0) {
            console.log("js-item")
            tabName = 'js-item-none'
        }
        else if(tabName == 'js-bland' && blandNumber == 0) {
            console.log("js-bland")
            tabName = 'js-bland-none'
        }
        else if(tabName == 'js-shop' && shopNumber == 0) {
            tabName = 'js-shop-none'
        }
        else {
            tabName = $(this).attr('id');
        };
        $("#" + tabName + "-content").css('display','block')
    });
});

$(function(){
    $('#menu li').hover(function(){
        $("ul:not(:animated)", this).slideDown();
    }, function(){
        $("ul.child",this).slideUp();
    });
});
