/**
 * Created by vladmihai on 10/5/13.
 */


$(document).ready(function() {
    resizeAd();

    $(window).resize(function() {
        resizeAd();
    });

});

function resizeAd() {
    var slideHeight = $(window).height() - $('header').height();
    $('.homepageEngine').height(slideHeight);
}