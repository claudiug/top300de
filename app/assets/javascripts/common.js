/**
 * Created by vladmihai on 10/5/13.
 */

$(document).ready(function() {

    setupLabel();

    var slideHeight = $('.homepageEngine').height();

    $('section[data-type="background"]').each(function(){

        var $window = $(window);
        var $bgobj = $(this); // assigning the object

        $(window).scroll(function() {
            var yPos = -($window.scrollTop() / $bgobj.data('speed'));
            var coords = '50% '+ yPos + 'px';

            $bgobj.css({ backgroundPosition: coords });
        });
    });

    $('.options .styled').bind("click", function () {
        setupLabel();
    });

    $('.options #go_hike').bind("click", function() {
        if($('input#go_hike').is(':checked')) {
            $('input#go_mountain').attr("checked","checked");
            setupLabel();
            $('#linked').fadeIn(300).fadeOut(300).fadeIn(300);
        } else {
            $('#linked').fadeOut(300);
        }
    });

    $('#scrollPage').click(function() {
        var y = $(window).scrollTop();
        $('html, body').animate({ scrollTop: y + slideHeight - 90 }, 600);

    })

    $(window).resize(function() {
        resizeAd(slideHeight);
    });

    // List
    $('.trip-item, #hp-trips .trip-item').wookmark({
        align: 'left',
        autoResize: false,
        comparator: null,
        container: $('#trip-list'),
        direction: undefined,
        ignoreInactiveItems: true,
        //itemWidth: 255,
        fillEmptySpace: true,
        flexibleWidth: 0,
        offset: 11,
        onLayoutChanged: undefined,
        outerOffset: 0,
        resizeDelay: 50
    });

});

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