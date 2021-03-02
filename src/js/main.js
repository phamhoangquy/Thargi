$(document).ready(function() {
    mappingMenu();
    toggleShoppingCart();
    toggleMobileMenu();
    setBackgroundElement();
    swiperInit();
    sideNav();
    projectDetailSlide();
    tabActive();
    tabProductActive();
    tabShareActive();
    toggleFaqs();
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

// Toggle
function toggleFaqs() {
    var coll = document.getElementsByClassName("togglefaqs");
    var i;
    for (i = 0; i < coll.length; i++) {
        coll[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.maxHeight) {
                content.style.maxHeight = null;
            } else {
                content.style.maxHeight = content.scrollHeight + "px";
            }
        });
    }
}

function tabActive() {
    $(".tab-navigation-2 li a").on("click", function() {
        $(this)
            .parents(".tab-navigation-2")
            .find("li")
            .removeClass("active");
        $(this)
            .parents("li")
            .addClass("active");

        var display = $(this).attr("data-type");
        $(".tab-item-2").removeClass("active");
        $("#" + display).addClass("active");

        let maxHeight = 400;
        let contentTab = $(".tab-wrapper-2 .tab-item-2.active");
        // console.log(contentTab.height())
        if (contentTab.height() < maxHeight) {
            $(contentTab).find('.btn-view-more').hide()
        }
    });
}

function tabShareActive() {
    $(".tab-navigation-3 li a").on("click", function() {
        $(this)
            .parents(".tab-navigation-3")
            .find("li")
            .removeClass("active");
        $(this)
            .parents("li")
            .addClass("active");

        var display = $(this).attr("data-type");
        $(".tab-item-3").removeClass("active");
        $("#" + display).addClass("active");

        let maxHeight = 400;
        let contentTab = $(".tab-wrapper-3 .tab-item-3.active");
        // console.log(contentTab.height())
        if (contentTab.height() < maxHeight) {
            $(contentTab).find('.btn-view-more').hide()
        }
    });
}

function tabProductActive() {
    $(".tab-navigation li a").on("click", function() {
        $(this)
            .parents(".tab-navigation")
            .find("li")
            .removeClass("active");
        $(this)
            .parents("li")
            .addClass("active");

        var display = $(this).attr("data-type");
        $(".tab-item").removeClass("active");
        $("#" + display).addClass("active");

        let maxHeight = 400;
        let contentTab = $(".tab-wrapper .tab-item.active");
        // console.log(contentTab.height())
        if (contentTab.height() < maxHeight) {
            $(contentTab).find('.btn-view-more').hide()
        }
    });
}

// watch more detail
$(".show-information .button-expand").click(function() {
    $(this).css("display", "none");
    $(".show-information .button-compact").css("display", "flex");
    // $(".show-information show-table").addClass("active");
    $(".show-information show-table").css("max-height", "100%");
});
$(".show-information .button-compact").click(function() {
    $(this).css("display", "none");
    $(".show-information .button-expand").css("display", "flex");
    $(".show-information show-table").removeClass("active");
    let count = 0;
    let totalHeight = 100;
    $(".table-info").each(function(i) {
        if (i < 2) {
            totalHeight += $(this).outerHeight();
            console.log(i + " - " + $(this).outerHeight());
        }
        $(".show-information .show-table").css("max-height", totalHeight);
    });
});

// $(".show-comment .button-expand").click(function() {
//     $(this).css("display", "none");
//     $(".show-comment .button-rut").css("display", "flex");
//     // $(".show-comment .wrap-bl").addClass("active");
//     $(".show-comment .journalItems").css("max-height", "100%");
// });
// $(".show-comment .button-rut").click(function() {
//     $(this).css("display", "none");
//     $(".show-comment .button-expand").css("display", "flex");
//     $(".show-comment .journalItems").removeClass("active");
//     let count = 0;
//     let totalHeight = 0;
//     $(".cmt-item").each(function(i) {
//         if (i < 4) {
//             totalHeight += $(this).outerHeight();
//             console.log(i + " - " + $(this).outerHeight());
//         }
//         $(".show-comment .journalItems").css("max-height", totalHeight);
//     });
// });

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

// Slide project-detail
function projectDetailSlide() {
    var galleryThumbs = new Swiper('.gallery-thumbs', {
        spaceBetween: 10,
        slidesPerView: 5,
        freeMode: true,
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
        breakpoints: {
            375: {
                slidesPerView: 2,
            },
            576: {
                slidesPerView: 3,
            },
            1000: {
                slidesPerView: 5,
            }
        }
    });
    var galleryTop = new Swiper('.gallery-top', {
        thumbs: {
            swiper: galleryThumbs
        },
        navigation: {
            nextEl: '.nav-arrow-next',
            prevEl: '.nav-arrow-prev',
        },
    });
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
    var newsDetailSwiper = new Swiper(".product-detail-3 .swiper-container", {
        // Optional parameters
        speed: 1000,
        spaceBetween: 10,
        breakpointsInverse: true,
        navigation: {
            nextEl: '.product-detail-3 .nav-arrow-next',
            prevEl: '.product-detail-3 .nav-arrow-prev',
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
    var newsHomeSwiper = new Swiper(".home_s-2 .swiper-container", {
        // Optional parameters
        speed: 1000,
        spaceBetween: 10,
        breakpointsInverse: true,
        navigation: {
            nextEl: '.home_s-2 .nav-arrow-next',
            prevEl: '.home_s-2 .nav-arrow-prev',
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