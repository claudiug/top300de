/**
 * Created by vladmihai on 10/5/13.
 */

$(document).ready(function() {

    /* let's make the input elements nicer :) */
    setupLabel();

    /* self explanatory */
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

    /* triggers the labels nice behaviour */
    $('.options .styled').bind("click", function () {
        setupLabel();
    });

    /* connects the hiking to the mountains */
    $('.options #go_hike').bind("click", function() {
        if($('input#go_hike').is(':checked')) {
            $('input#go_mountain').attr("checked","checked");
            setupLabel();
            $('#linked').fadeIn(300).fadeOut(300).fadeIn(300);
        } else {
            $('#linked').fadeOut(300);
        }
    });

    /* scrolls down the page to the next section - homepage in this case */
    $('#scrollPage').click(function() {
        var y = $(window).scrollTop();
        $('html, body').animate({ scrollTop: y + slideHeight - 90 }, 600);

    })

    /* changes the slide height on resize
    $(window).resize(function() {
        resizeAd(slideHeight);
    });
     */

    /* this is the gallery grid style */
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

    /* suggestion engine */
    $('.addSugg span').click(function() {
       $(this).toggleClass('danke');
        return false;
    });
    $('#add-new-dest').click(function() {
       $('#new-dest').fadeToggle(50).find('input').focus();
    });
    $('#sd').click(function() {
        $('#new-dest').fadeOut(50);
    });

    $('#get-suggestion').click(function() {

        var el = $('#new-name');

        if(el.val()) {
                var new_el = '<span title="' + el.val() + '" class="danke">' + el.val() + '</span> ';
                $('.suggestions-set').append(new_el);
                $(el).val('').attr('placeholder', 'Thank you!').focus();

        } else {
            $(el).attr('placeholder', 'Forgot something?').focus();
        }

    });

    /* Animate modals */
    $('.modal-trigger').click(function() {

        if ($(this).hasClass("selected") ) {
            $(this).removeClass('selected');
            $('.wat-modal').animate({top:'15px', opacity:'0'}, 80);
        } else {

            $(this).addClass('selected');
            $('.wat-modal').animate({top:'26px', opacity:'1'}, 80);

        }
        return false;
    });

    /* Hide events */
    $('.rb_overlayer, .rb_req_audit .cross_close').click(function() {
        $('.rb_top_audit').removeClass('selected');
        $('.rb_overlayer').fadeOut(60);
        $('.rb_req_audit').animate({top:'50px', opacity:'0'}, 160);
    })


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