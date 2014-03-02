/**
 * Created by vladmihai on 10/5/13.
 */

//blocksit define
$(window).load( function() {
    $('#trip-list, #trip-list-second').BlocksIt({
        numOfCol: 3,
        offsetX: 8,
        offsetY: 8,
        blockElement: 'article'
    });

    initialize();
});

$(document).ready(function() {


    $(".tab-content").not(":first").hide();
    $("#tab-switch li:first").addClass("active").show();

    $("#tab-switch li").click(function() {
        $("#tab-switch li.active").removeClass("active");
        $(this).addClass("active");
        $(".tab-content").hide();
        $($('a',this).attr("href")).show();

        return false;
    });

    $.validate({
        form : '#feedback-form',
    });

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

    /* Side nav */
    $('.side_nav a').each(function() {
        $(this).click(function() {

            var target = $(this).attr('rel');

            $('.side_nav a').removeClass('selected');
            $(this).addClass('selected');

            $('html,body').animate({scrollTop: $("#" + target).offset().top - 80},'slow');
            return false;
        });
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
    $('#show-feedback').click(function() {

        showModals(this, $('#wat-feedback'));
        return false;
    });

    /* Hide events */
    $('div.close').click(function() {
        hideModals($(this).parent('div').parent('.wat-modal'));
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

function showModals(el, target) {
    /* Animate modals */

        if ($(el).hasClass("selected") ) {
            $(el).removeClass('selected');
            $(target).animate({top:'15px', opacity:'0'}, 80).hide();
            $('.overlay').fadeOut(200);

        } else {

            $(el).addClass('selected');
            $('.overlay').fadeIn(200);
            $(target).show().animate({top:'26px', opacity:'1'}, 80);

        }
        return false;
}
function hideModals(target) {
    /* Hide events */
        $('.modal-trigger').removeClass('selected');
        $('.overlay').fadeOut(60);
        $(target).animate({top:'15px', opacity:'0'}, 80).hide();
}