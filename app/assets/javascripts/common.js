/**
 * Created by vladmihai on 10/5/13.
 */

$(document).ready(function() {

    var slideHeight = $(window).height() - $('header').height();

    resizeAd(slideHeight);
    setupLabel();

    $('section[data-type="background"]').each(function(){

        var $window = $(window);
        var $bgobj = $(this); // assigning the object

        $(window).scroll(function() {
            var yPos = -($window.scrollTop() / $bgobj.data('speed'));
            var coords = '50% '+ yPos + 'px';

            $bgobj.css({ backgroundPosition: coords });
        });
    });

    $('.options .styled').click(function () {
        setupLabel();
        $(this).click(clearSelection);
    });



    $('#scrollPage').click(function() {
        var y = $(window).scrollTop();
        $('html, body').animate({ scrollTop: y + slideHeight - 90 }, 600);

    })

    $(window).resize(function() {
        resizeAd(slideHeight);
    });

});

function resizeAd(slideHeight) {
    $('.homepageEngine').height(slideHeight);
}

function setupLabel() {
    if ($('.styled').length) {
        $('.options label').each(function () {
            $(this).removeClass('styled-on');
        });
        $('.styled input:checked').each(function () {
            $(this).parent('label').addClass('styled-on');
        });
    };
};

$(function() {

    $(".pnav").on("click", function() {

        var $button = $(this);
        var oldValue = $button.parent().find("input").val();

        if ($button.text() == "+") {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }

        $button.parent().find("input").val(newVal);
        $button.parent().find(".number span").html(newVal);

    });

});