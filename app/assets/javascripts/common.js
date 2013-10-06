/**
 * Created by vladmihai on 10/5/13.
 */


$(document).ready(function() {
    resizeAd();
    setupLabel();

    $('.options .styled').click(function () {
        setupLabel();
        $(this).click(clearSelection);
    });

    $(window).resize(function() {
        resizeAd();
    });

});

function resizeAd() {
    var slideHeight = $(window).height() - $('header').height();
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