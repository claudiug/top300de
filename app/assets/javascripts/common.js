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

    });

    $("a[href='#top']").click(function() {
        $("html, body").animate({ scrollTop: 0 }, "slow");
        return false;
    });
    $("a[href='#remove']").click(function() {
        $(".tutorialBlock").animate({ height: 0 }, "slow");
        return false;
    });

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

    $("#left-trip-filters").pin({
        containerSelector: ".trip-data"
    });

    /* suggestion engine
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
     */

    $('input#location').keyup(function() {
        $('#wat-no-location').fadeOut(80);
    });

    /* Animate modals
    $('#show-feedback').click(function() {
        showModals(this, $('#wat-feedback'), true);
        return false;
    });
     */
    $('#show-menu').click(function() {
        showModals(this, $('#wat-menu'), false);

        var close_icon = "wi-times"
        var list_icon  = "wi-bars"

        if($(this).hasClass(close_icon)) {
            $(this).removeClass(close_icon);
            $(this).addClass(list_icon);
        } else {
            $(this).removeClass(list_icon);
            $(this).addClass(close_icon);
        }
        return false;
    });

    /* Hide events */
    $('div.close').click(function() {
        hideModals($(this).parent('div').parent('.wat-modal'));
    })


    /* Change button value on submit */
    $('.submit-go').click(function() {
        if($("#find_place").val() == "en") 
            $(this).val('Searching...');
        else
            $(this).val('Suchen...');
    });

    $(document).on('change', '#trip_zip_code', function(){
        zip_val = $(this).val();
        $(".ger_zip_code").val(zip_val);
    });

    $(document).on('change', '#trip_population', function(){
        pop_val = $(this).val();
        $(".ger_population").val(pop_val);
    });

    $(document).on('change', '#trip_latitude', function(){
        lat_val = $(this).val();
        $(".ger_latitude").val(lat_val);
    });

    $(document).on('change', '#trip_longitude', function(){
        long_val = $(this).val();
        $(".ger_longitude").val(long_val);
    });

    $(document).on('change', '#trip_is_active', function(){
        act_val = $(this).is(':checked')
        if(act_val == true) {
          $(".ger_active").prop('checked', true);
        }
    });

    $(document).on('change', '#trip_popular', function(){
        popular_val = $(this).is(':checked')
        if(popular_val == true) {
          $(".ger_popular").prop('checked', true);
        }
    });

  
    
    // $(document).on('change', '#category_10', function(){
    //     long_val = $(this).val();
    //     $(".ger_longitude").val(long_val);
    // });

    // $(document).on('change', '#category_11', function(){
    //     long_val = $(this).val();
    //     $(".ger_longitude").val(long_val);
    // });

    // $(document).on('change', '#category_12', function(){
    //     long_val = $(this).val();
    //     $(".ger_longitude").val(long_val);
    // });

    // $(document).on('change', '#category_13', function(){
    //     long_val = $(this).val();
    //     $(".ger_longitude").val(long_val);
    // });

    // $(document).on('change', '#category_14', function(){
    //     long_val = $(this).val();
    //     $(".ger_longitude").val(long_val);
    // });

    // $(document).on('change', '#category_15', function(){
    //     long_val = $(this).val();
    //     $(".ger_longitude").val(long_val);
    // });

    $(document).on('change', '#trip_paintings_attributes_0_image', function(){
        img = $(this).val();
        $(".ger_image").val(img);
    });



    //I'm not doing anything else, so just leave
    if(!navigator.geolocation) return;

    navigator.geolocation.getCurrentPosition(function(pos) {
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
        geocoder.geocode({'latLng': latlng}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                //Check result 0
                var result = results[0];
                //look for locality tag and administrative_area_level_1
                var city = "";
                var state = "";
                for(var i=0, len=result.address_components.length; i<len; i++) {
                    var ac = result.address_components[i];
                    if(ac.types.indexOf("locality") >= 0) city = ac.long_name;
                    if(ac.types.indexOf("administrative_area_level_1") >= 0) state = ac.long_name;
                }
                //only report if we got Good Stuff
                if(city != '' && state != '') {
                    $("#location").val(city);
                    $("#det-location").text(city);
                }
            }
        });

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

function showModals(el, target, overlay) {
    /* Animate modals */

        if ($(el).hasClass("selected") ) {
            $(el).removeClass('selected');
            $(target).animate({top:'35px', opacity:'0'}, 80).hide();
            $('.overlay').fadeOut(200);

        } else {
            $('.wat-modal').animate({opacity:'0'}, 80).hide();
            $('.overlay').fadeOut(200);
            $(el).addClass('selected');
            if(overlay == true) { $('.overlay').fadeIn(200); }
            $(target).show().animate({top:'46px', opacity:'1'}, 80);

        }
        return false;
}
function hideModals(target) {
    /* Hide events */
        $('.modal-trigger').removeClass('selected');
        $('.overlay').fadeOut(60);
        $(target).animate({top:'35px', opacity:'0'}, 80).hide();
}