$(document).ready(function () {
	AOS.init({
		duration: 1500,
		easing: 'ease-in-sine',
	})
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
	watchMoreDetail();
	watchTableDetail();
	linkAbout();
	scrollToDiv();
	changeIframe();
	checkFormCart();
	filterCate();
	linkToPageAbout();
	showBackToTop();
	showMore();
	if($('.cartpage .cart-login .select-group ul li:first-child span').hasClass('active')){
		$('.cart-page-step-2 .cart-login .login-form .wrap').hide();
	}else{
		$('.cart-page-step-2 .cart-login .login-form .wrap').show();
	}
	$(document).on("click", function (e) {

		if (
			$(".shopping-cart-toggle").has(e.target).length === 0 &&
			$(".shopping-cart-ab").has(e.target).length === 0
		) {
			$(".shopping-cart-ab").removeClass("open");
		}
	});

	// watch more
	let totalHeight = 30;
	$(".table-info").each(function (i) {
		if (i < 2) {
			totalHeight += $(this).outerHeight();
		}
	});
	$(".list-infor-wrapper .show-information .show-table").css("max-height", totalHeight);
	// End watch more

	// watch table
	let totalTableHeight = 65;
	$("table td").each(function (i) {
		if (i < 3) {
			totalTableHeight += $(this).outerHeight();
		}
	});
	$(".wrapper-table-inner").css("max-height", totalTableHeight);
	// End watch table

	setTimeout(() => {
		$('#l_0').trigger("click")
	}, 100);
	
	
});

function linkToPageAbout() {
	var path = window.location.href;
	let Ketqua = path.substr(path.indexOf("#") + 1);
	if (path.indexOf("#") != -1) {
		let offset = $("header").outerHeight();
		$(this).parent().addClass("active").siblings().removeClass("active");
		$("html, body").animate({
				scrollTop: $("#" + Ketqua).offset().top - offset,
			},
			800,
		);
	}
}

function filterCate() {
	$('.tool-product').prependTo('.product-list-page main .product-list .container');
	var cate_menu = $('.item-product-list')
	var filter_menu = $('.item-checkbox')
	var tool = $('.tool-product')
	var cate = $('.tool-product .btn-cate')
	var filter = $('.tool-product .btn-filter')
	var close = $('#cls_filter')
	var close_2 = $('#cls_filter-2')
	setTimeout(() => {
		var header = $("header").outerHeight();
		cate_menu.css("top", header);
		filter_menu.css("top", header);
	}, 100);
	cate.on('click', function () {
		cate_menu.toggleClass('active')
		filter_menu.removeClass('active')
	});
	filter.on('click', function () {
		filter_menu.toggleClass('active')
		cate_menu.removeClass('active')
	});
	close.on('click', function () {
		cate_menu.removeClass('active')
	});
	close_2.on('click', function () {
		filter_menu.removeClass('active')
	});
}

function checkFormCart() {
	$('input[id="ttmh"]').click(function () {
		if ($(this).prop("checked") == true) {
			$(".cart-page-step-3 .receive-address .user-info").slideDown();
		} else if ($(this).prop("checked") == false) {
			$(".cart-page-step-3 .receive-address .user-info").slideUp();
		}
	});
	$('input[id="Invoice_Required"]').click(function () {
		if ($(this).prop("checked") == true) {
			$(".cart-page-step-3 .export-bill .bill-form").slideDown();
		} else if ($(this).prop("checked") == false) {
			$(".cart-page-step-3 .export-bill .bill-form").slideUp();
		}
	});
}

// function quantityNumber() {
//     $(".btn-dec").click(function() {
//         let minus = $(this).parents('.input-number').find('input').val();
//         if (minus > 0) {
//             $(this).parents('.input-number').find('input').val(minus - 1);
//         } else {
//             $(this).parents('.input-number').find('input').val(0);
//         }
//     });
//     $(".btn-inc").on("click", function() {
//         let plus = Number($(this).parents('.input-number').find('input').val());
//         $(this).parents('.input-number').find('input').val(plus + 1);
//     });
// }

function changeIframe() {
	$(document).on('click', 'ul li', function () {
		var data = $(this).attr('data-iframe')
		$('#custom-maps iframe').attr('src', data)
	})
}

// const InsertBd = () => {
//     $(".breadcrumb-wrapper").appendTo("#pagebanner .box-text");
// };

function height(el) {
	var height = 0;
	$(el).each(function () {
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
	headerScroll: () => {
		let heightHeader = $('header').height();
		$(window).scrollTop() > heightHeader ? $('header').addClass('header-scroll') : $('header').removeClass('header-scroll');
	}
}

function linkAbout() {
	$(".sub-menu li a").on("click", function (event) {
		if (this.hash !== "") {
			let offset = $("header").outerHeight();
			var hash = this.hash;
			$(this).parent().addClass('active').siblings().removeClass("active")
			$("html, body").animate({
					scrollTop: $(hash).offset().top - offset,
				},
				800,
				function () {
					window.location.hash = hash;
				}
			);
		} // End if
	});
}

// Toggle Faqs
function toggleFaqs() {
	// var coll = document.getElementsByClassName("togglefaqs");
	// var i;
	// for (i = 0; i < coll.length; i++) {
	//     coll[i].addEventListener("click", function() {
	//         this.classList.toggle("active");
	//         var content = this.nextElementSibling;
	//         if (content.style.maxHeight) {
	//             content.style.maxHeight = null;
	//         } else {
	//             content.style.maxHeight = content.scrollHeight + "px";
	//         }
	//     });
	//     // console.log(this)
	// }
	$('.togglefaqs').click(function (e) {
		e.preventDefault();
		$('.togglefaqs').removeClass('click');

		var $this = $(this);
		if ($this.next().hasClass('show')) {
			$this.next().removeClass('show');
			$this.next().slideUp(350);
		} else {
			$this.parent().parent().find('li .content').removeClass('show');
			$this.parent().parent().find('li .content').slideUp(350);
			$this.toggleClass('click');
			$this.next().toggleClass('show');
			$this.next().slideToggle(350);
		}
	});
}


function toggleShoppingCart() {
	$(".cart-header").on("click", function (e) {
		$(".shopping-cart-ab").toggleClass("open");
		e.stopPropagation();
	});
}

// toggle-product-list
function sideNav() {
	let btn = $('.product-list .item-product-list .content ul li .title-zone span');
	let subMenuProduct = $('.product-list .item-product-list .content .sub-product');
	if ($('.product-list .item-product-list .content ul li.has-dropdown').hasClass('active')) {
		$('.product-list .item-product-list .content ul li.has-dropdown.active .sub-product').slideDown();
	}
	btn.on('click', function () {
		if ($(this).parents('.has-dropdown').hasClass('active')) {
			$('.product-list .item-product-list .content ul li.has-dropdown').removeClass('active')
			subMenuProduct.slideUp();
			$(this).parents('.has-dropdown').removeClass('active').find('.sub-product').slideUp();
		} else {
			subMenuProduct.slideUp();
			$(this).parents('.has-dropdown').addClass('active').find('.sub-product').slideDown();
		}
	});

	let linkNoActive = $('.product-list .item-product-list .content ul li .title-zone a');
	linkNoActive.on('click', function(){
		linkNoActive.removeClass('active');
		$(this).addClass('active');
		if($(window).width() <= 768){
			$('.product-list .item-product-list').removeClass('active')
		}
	});
}

// Tab-Active
function tabActive() {
	$(".tab-navigation-2 li a").on("click", function () {
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
	$(".tab-navigation-3 li a").on("click", function () {
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
<<<<<<< HEAD
    $(".tab-navigation li a").on("click", function() {
        $(this)
            .parents(".tab-navigation")
            .find("li")
            .removeClass("active");
        $(this)
            .parents("li")
            .addClass("active");
        var display = $(this).attr("data-type");
        console.log(display)
        $(".tab-item").removeClass("active");
        $("#" + display).addClass("active");

        // let maxHeight = 400;
        let contentTab = $(".tab-wrapper .tab-item.active");
        // console.log(contentTab.height())
        if (contentTab.height() < maxHeight) {
            $(contentTab).find('.btn-view-more').hide()
        }
    });
=======
	$(".tab-navigation li a").on("click", function () {
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
>>>>>>> 37551e51a9ba35a3b706e3ec9d0a5eb023a89eb0
}
// End-Tab-Active


// watch more detail
const watchMoreDetail = () => {
	$(".list-infor-wrapper .button-expand").click(function () {
		$(this).css("display", "none");
		$(".list-infor-wrapper .button-compact").css("display", "flex");
		// $(".show-information show-table").addClass("active");
		$(".list-infor-wrapper .show-information .show-table").css("max-height", "100%");
	});
	$(".list-infor-wrapper .button-compact").click(function () {
		$(this).css("display", "none");
		$(".list-infor-wrapper .button-expand").css("display", "flex");
		// $(".show-information show-table").removeClass("active");
		let totalHeight = 100;
		$(".table-info").each(function (i) {
			if (i < 2) {
				totalHeight += $(this).outerHeight();
				console.log(i + " - " + $(this).outerHeight());
			}
		});
		$(".list-infor-wrapper .show-information .show-table").css("max-height", totalHeight);
	});
}

const watchTableDetail = () => {
	if ($(".product-detail-2").length == 1) {
		$("table").wrap("<div class='wrapper-table-inner'></div>");
	}
	$(".show-table .view-table-expand").click(function () {
		$(this).css("display", "none");
		$(this).next().css("display", "flex");
		$(this).closest(".table-info").find(".wrapper-table-inner").css("max-height", "100%");
	});
	$(".show-table .view-table-compact").click(function () {
		$(this).css("display", "none");
		$(this).prev().css("display", "flex");
		let totalTableHeight = 65;
		$("table td").each(function (i) {
			if (i < 3) {
				totalTableHeight += $(this).outerHeight();
				// console.log(i + " - " + $(this).outerHeight());
			}
		});
		$(this).closest(".table-info").find(".wrapper-table-inner").css("max-height", totalTableHeight);
	});
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

const scrollToDiv = () => {
	$(".banner-scroll").click(function () {
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

// Menu header
function toggleMobileMenu() {
	$('.header_btn').click(function () {
		$(this).toggleClass('click');
		$('.menu_mobile').toggleClass('show');
		$('.overlay').toggleClass('show');
		if (mobile.hasClass('show')) {
			$('.mega').removeClass('active')
		};
	});
	$('.overlay').click(function () {
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
	$('header .header-top .header-infor .information .Module.Module-207').mapping({
		mobileWrapper: 'header .menu_mobile .mobile-wrapper',
		mobileMethod: 'appendTo',
		desktopWrapper: 'header .header-top .header-infor .information',
		desktopMethod: 'prependTo',
		breakpoint: 1279
	});
	$('header .header-top .header-infor .information .Module.Module-208 .hotline-box').mapping({
		mobileWrapper: 'header .menu_mobile .mobile-wrapper',
		mobileMethod: 'appendTo',
		desktopWrapper: 'header .header-top .header-infor .information .Module.Module-208',
		desktopMethod: 'prependTo',
		breakpoint: 1279
	});
}
// End-Menu header

function swiperInit() {
	var homerSwiper = new Swiper(".home-banner .swiper-container", {
		// Optional parameters
		speed: 1205,
		slidesPerView: 1,
		effect: 'fade',
		autoplay: {
			delay: 3000
		},
		pagination: {
			el: ".home-banner-pagination",
			type: "bullets",
			clickable: "true"
		}
	});
	var oterNews = new Swiper(".other-news-detail .swiper-container", {
		// Optional parameters
		speed: 1000,
		spaceBetween: 30,
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
	var productDetailSwiper = new Swiper(".product-detail-3 .swiper-container", {
		// Optional parameters
		speed: 1000,
		spaceBetween: 30,
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
	var productLastviewSwiper = new Swiper(".product-lastview .swiper-container", {
		// Optional parameters
		speed: 1000,
		spaceBetween: 10,
		breakpointsInverse: true,
		navigation: {
			nextEl: '.product-lastview .swiper-button-next',
			prevEl: '.product-lastview .swiper-button-prev',
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
	var newsDetailSwiper = new Swiper(".test .swiper-container", {
		// Optional parameters
		speed: 1000,
		spaceBetween: 10,
		breakpointsInverse: true,
		// navigation: {
		//     nextEl: '.product-lastview .swiper-button-next',
		//     prevEl: '.product-lastview .swiper-button-prev',
		// },
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
	var shopTMDTSwiper = new Swiper(".shop-tmdt .swiper-container", {
		// Optional parameters
		breakpointsInverse: true,
		slidesPerColumn: 2,
		slidesPerColumnFill: 'row',
		spaceBetween: 30,
		navigation: {
			nextEl: '.shop-tmdt .nav-arrow-next',
			prevEl: '.shop-tmdt .nav-arrow-prev',
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
				slidesPerView: 2,
			},
			1025: {
				slidesPerView: 3,
			},
			1440: {
				slidesPerView: 3,
			},
		},
	});
}

function setBackgroundElement() {
	$('[setBackground]').each(function () {
		var background = $(this).attr('setBackground')
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-size": "cover",
			"background-position": "center center"
		});
	});
	$('[setBackgroundRepeat]').each(function () {
		var background = $(this).attr('setBackgroundRepeat')
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-repeat": "repeat"
		});
	});
}

function showBackToTop() {
	$(window).scroll(function () {
		if ($(this).scrollTop() > 0) {
			$('#back-to-top').addClass('active');
		} else {
			$('#back-to-top').removeClass('active');
		}
	});

	$("#back-to-top").on("click", function (e) {
		e.preventDefault();
		$("html,body").animate({
			scrollTop: 0
		})
	})
}

$(document).on('scroll', function () {
	header.headerScroll()
});


$(window).scroll(function () {
	var scrollDistance = $(window).scrollTop();
	$(".check-scroll-section").each(function (i) {
		if ($(this).position().top - $("header").outerHeight() - 1 <= scrollDistance) {
			$(".sub-menu-list .sub-menu ul li").removeClass("active")
			$(".sub-menu-list .sub-menu ul li").eq(i).addClass("active")
			// if(i >= 3){

			// }
			// const offsetLeftScroll = $('.sub-menu-list .sub-menu ul li.active').position().left + (i*100);
			// $('.sub-menu-list .sub-menu ul').scrollLeft(offsetLeftScroll)
		}
	});
	// scrollLeftAbout();
}).scroll();

// function scrollLeftAbout(){
// 	$('.sub-menu-list .sub-menu ul li.active').scrollLeft(70)
// }

function showMore(){
	let heightInfoDetail = $('.product-detail-2 .list-infor-wrapper').outerHeight();
	console.log(heightInfoDetail);
	heightInfoDetail > 900 ? $('.product-detail-2 .list-infor-wrapper .wrap-button').show() : $('.product-detail-2 .list-infor-wrapper .wrap-button').hide()
}
