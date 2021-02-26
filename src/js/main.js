$(document).ready(function() {
    mappingMenu();
    toggleShoppingCart();
    toggleMobileMenu();
    setBackgroundElement();
    swiperInit();
    sideNav();
    scrollToDiv();
    // $(document).on("click", function(e) {
    //     if (
    //         $(".shopping-cart-toggle").has(e.target).length === 0 &&
    //         $(".shopping-cart-wrapper").has(e.target).length === 0
    //     ) {
    //         $(".shopping-cart-wrapper").removeClass("open");
    //     }
    //     if (
    //         $(".suggestsearch").has(e.target).length === 0
    //     ) {
    //         $(".suggestsearch").fadeOut();
    //     }
    // });
});


// toggle-product-list
function sideNav() {
    let btn = $('.product-list .item-product-list .content ul li .title-zone span');
    let subMenuProduct = $('.product-list .item-product-list .content .sub-product');
    if ($('.product-list .item-product-list .content ul li.has-dropdown').hasClass('active')) {
        $('.product-list .item-product-list .content ul li.has-dropdown.active .sub-product').slideDown();
    }
    btn.on('click', function() {
        if ($(this).parents('.has-dropdown').hasClass('active')) {
            $('.product-list .item-product-list .content ul li.has-dropdown').removeClass('active')
            subMenuProduct.slideUp();
            $(this).parents('.has-dropdown').removeClass('active').find('.sub-product').slideUp();
        } else {
            subMenuProduct.slideUp();
            $(this).parents('.has-dropdown').addClass('active').find('.sub-product').slideDown();
        }
    })
}

function toggleShoppingCart() {
    $(".cart-header").on("click", function(e) {
        $(".shopping-cart-wrapper").toggleClass("open");
        e.stopPropagation();
    });
}

const scrollToDiv = () => {
    $(".banner-scroll").click(function() {
        let sumHed =
            $(".home-banner").outerHeight() - $("header").outerHeight();
        console.log(sumHed);
        $("html,body").animate({
                scrollTop: sumHed,
            },
            "fast"
        );
    });
};

const InsertBd = () => {
    $(".breadcrumb-wrapper").appendTo("#pagebanner .box-text");
};

function height(el) {
    var height = 0;
    $(el).each(function() {
        var thisHeight = $(this).height();
        if (thisHeight > height) {
            height = thisHeight;
        }
        setTimeout(() => {
            $(el).height(height)
        }, 100)
    })
}

let header = {
    scrollActive: function() {
        let height = $('header').height()
        if ($(window).scrollTop() > height) {
            $('header').addClass('active')
        } else {
            $('header').removeClass('active')
        }
    },
}

function toggleMobileMenu() {
    $('.header_btn').click(function() {
        $(this).toggleClass('click');
        $('.menu_mobile').toggleClass('show');
        $('.overlay').toggleClass('show');
        if (mobile.hasClass('show')) {
            $('.mega').removeClass('active')
        };
    });
    $('.overlay').click(function() {
        $(this).toggleClass('click');
        $('.menu_mobile').toggleClass('show');
        $('.overlay').toggleClass('show');
    });
}

function mappingMenu() {
    $('header .header-bottom .header-menu .nav-menu').mapping({
        mobileWrapper: 'header .menu_mobile .mobile-wrapper',
        mobileMethod: 'appendTo',
        desktopWrapper: 'header .header-bottom .header-menu',
        desktopMethod: 'prependTo',
        breakpoint: 1279
    });
    $('header .header-top .header-infor .information .hotline-box').mapping({
        mobileWrapper: 'header .menu_mobile .mobile-wrapper',
        mobileMethod: 'appendTo',
        desktopWrapper: 'header .header-top .header-infor .information',
        desktopMethod: 'prependTo',
        breakpoint: 1279
    });
    $('header .header-top .header-infor .information .searchbox').mapping({
        mobileWrapper: 'header .menu_mobile .mobile-wrapper',
        mobileMethod: 'appendTo',
        desktopWrapper: 'header .header-top .header-infor .information',
        desktopMethod: 'prependTo',
        breakpoint: 1279
    });
    $('header .header-top .header-infor .header-logo').mapping({
        mobileWrapper: 'header .menu_mobile .mobile-wrapper',
        mobileMethod: 'appendTo',
        desktopWrapper: 'header .header-top .header-infor',
        desktopMethod: 'prependTo',
        breakpoint: 1279
    });
}

function swiperInit() {
    var homerSwiper = new Swiper(".home-banner .swiper-container", {
        // Optional parameters
        speed: 1205,
        slidesPerView: 1,
        autoplay: {
            delay: 3000
        },
        pagination: {
            el: ".home-banner-pagination",
            type: "bullets",
            clickable: "true"
        }
    });
    var newsDetailSwiper = new Swiper(".other-news-detail .swiper-container", {
        // Optional parameters
        speed: 1000,
        spaceBetween: 10,
        breakpointsInverse: true,
        navigation: {
            nextEl: '.other-news-detail .nav-arrow-next',
            prevEl: '.other-news-detail .nav-arrow-prev',
        },
        breakpoints: {
            320: {
                slidesPerView: 1,
            },
            400: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            768: {
                slidesPerView: 3,
            },
            1025: {
                slidesPerView: 4,
            },
            1440: {
                slidesPerView: 4,
            },
        },
    });
}

function setBackgroundElement() {
    $('[setBackground]').each(function() {
        var background = $(this).attr('setBackground')
        $(this).css({
            "background-image": "url(" + background + ")",
            "background-size": "cover",
            "background-position": "center center"
        });
    });
    $('[setBackgroundRepeat]').each(function() {
        var background = $(this).attr('setBackgroundRepeat')
        $(this).css({
            "background-image": "url(" + background + ")",
            "background-repeat": "repeat"
        });
    });
}

$(document).on('scroll', function() {
    header.scrollActive()
});