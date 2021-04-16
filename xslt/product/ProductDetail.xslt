<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ProductDetail">
		<section class="product-detail">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="project-detail-slide">
							<div class="swiper-container gallery-top">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="ProductImages"></xsl:apply-templates>
								</div>
								<div class="nav-arrow-prev"><span class="ri-arrow-left-fill"></span></div>
								<div class="nav-arrow-next"><span class="ri-arrow-right-fill"></span></div>
							</div>
							<div class="swiper-container gallery-thumbs">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="ProductImages" mode="Thumbnail"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6"> 
						<div class="description-detail product-info">
							<div class="title-detail"> 
								<h1><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h1>
							</div>
							<div class="desc-top">
								<div class="content">
									<div class="price">
										<p><xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of></p>
									</div>
									<xsl:if test="OldPrice != ''">
										<div class="discount">
											<p><xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of></p>
										</div>
										<div class="product-promotion sale">
											<xsl:text>-</xsl:text>
											<xsl:value-of select="DiscountPercentage" disable-output-escaping="yes"></xsl:value-of>
											<xsl:text>%</xsl:text>
										</div>
									</xsl:if>
								</div>
								<div class="code">
									<p>Mã sản phẩm: <span>
										<xsl:value-of select="Code" disable-output-escaping="yes"></xsl:value-of>
									</span></p>
								</div>
							</div>
							<div class="tax-price">
								<p>Giá chưa bao gồm Thuế VAT</p>
							</div>
							<div class="desc-table">
								<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
							</div>
							<div class="desc-bottom">
								<div class="content">
									<xsl:if test="/ProductDetail/ProductProperties[EnableShoppingCart='True']">
										<div class="product-attributes">
											<xsl:apply-templates select="/ProductDetail/ProductProperties[EnableShoppingCart='True']"/>
										</div>
									</xsl:if>
									<div class="price">
										<p><xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of></p>
									</div>
								</div>
								<div class="content-cart-number">
									<a class="add-to-card btn-buy" href="#!" id="addtocartdetail" data-action="addcart" data-url='' onclick="AjaxCart.addproducttocart_details(this); return false;">
										<xsl:attribute name="data-productid">
											<xsl:value-of select="ProductId"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="data-title">
											<xsl:value-of select="Title"></xsl:value-of>
										</xsl:attribute>
										<div class="icon"><span class="ri-shopping-cart-2-line"></span></div>
										<span>Thêm vào giỏ hàng</span>
									</a>
								</div>
							</div>
							<div class="share-detail">
								<ul>
									<li>
										<div class="caption">Chia sẻ</div>
									</li>
									<li>
										<a href="#" rel="nofollow noopener" onclick="trackClickout('event', 'clickout', 'Webtools Page - Share Facebook link', 'sharelink', this,  true);" target="_blank">
											<xsl:attribute name="href">
												<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
												<xsl:value-of select="/ProductDetail/FullUrl"></xsl:value-of>
											</xsl:attribute>
											<span class="ri-facebook-fill"></span>
										</a>
									</li>
									<li>
										<a href="#" rel="nofollow noopener" onclick="trackClickout('event', 'clickout', 'Webtools Page - Share Pinterest link', 'sharelink', this,  true);" target="_blank">
											<xsl:attribute name="href">
												<xsl:text disable-output-escaping="yes">https://pinterest.com/pin/create/button/?url=</xsl:text>
												<xsl:value-of select="/ProductDetail/FullUrl"></xsl:value-of>
											</xsl:attribute>
											<span class="ri-pinterest-fill"></span>
										</a>
									</li>
									<li>
										<a href="#" rel="nofollow noopener" onclick="trackClickout('event', 'clickout', 'Webtools Page - Share Twitter link', 'sharelink', this,  true);" target="_blank">
											<xsl:attribute name="href">
												<xsl:text disable-output-escaping="yes">https://twitter.com/intent/tweet?url=</xsl:text>
												<xsl:value-of select="/ProductDetail/FullUrl"></xsl:value-of>
											</xsl:attribute>
											<span class="ri-twitter-fill"></span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="product-detail-2">
			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<div class="tab-product-detail">
							<div class="tab-description">
								<ul class="tab-navigation">
									<xsl:apply-templates select="ProductAttributes[position()&gt;0 and position()&lt;3]" mode="Attr-Tab"></xsl:apply-templates>
								</ul>
							</div>
							<div class="content-description">
								<div class="tab-wrapper">
									<xsl:apply-templates select="ProductAttributes[position()&gt;0 and position()&lt;3]" mode="Attr-Content"></xsl:apply-templates>
									
								</div>
							</div>
						</div>
						<div class="list-infor-wrapper">
							<div class="show-information">
								<div class="card-title">
									<h2>Thông tin dinh dưỡng</h2>
								</div>
								<div class="show-table">
									<xsl:apply-templates select="ProductAttributes[position()&gt;2]" mode="Attr-Full"></xsl:apply-templates>
									
								</div>
								<div class="wrap-button">
									<div class="button-expand"><span>Xem thêm</span><em class="ri-arrow-down-s-fill"></em></div>
									<div class="button-compact"><span>Rút gọn</span><em class="ri-arrow-up-s-fill"></em></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<xsl:if test="count(ProductRelated)&gt;0">
							<div class="title-right">
								<h3>Sản phẩm liên quan</h3>
							</div>
							<xsl:apply-templates select="ProductRelated"></xsl:apply-templates>
						</xsl:if>
						
					</div>
				</div>
			</div>
		</section>
		<xsl:if test="count(ProductOther)&gt;0">
			<section class="product-detail-3"> 
				<div class="container">
					<div class="head-title">
						<h2>Sản phẩm khác</h2>
					</div>
					<div class="product-detail-3-swiper-wrapper">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="ProductOther"></xsl:apply-templates>
							</div>
						</div>
						<div class="nav-wrapper">
							<div class="nav-arrow-prev"><span class="ri-arrow-left-fill"></span></div>
							<div class="nav-arrow-next"><span class="ri-arrow-right-fill"></span></div>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
		<input type="hidden" id="hdProductId">
			<xsl:attribute name="value">
				<xsl:value-of select="ProductId"/>
			</xsl:attribute> 
		</input>
	</xsl:template>

	<xsl:template match="ProductProperties">
		<div class="product-options">  
			<div class="text">
				<xsl:value-of select="Title" disable-output-escaping="yes"/>
			</div>
			<select onchange="AjaxCart.selectproductoption(this);return false;" class="product-option">  
				<xsl:attribute name="name">
					<xsl:text>product_attribute_</xsl:text>
					<xsl:value-of select="/ProductDetail/ProductId"/>
					<xsl:text>_</xsl:text>
					<xsl:value-of select="FieldId"/>
				</xsl:attribute>
				<xsl:attribute name="data-id">
					<xsl:value-of select="FieldId"/> 
				</xsl:attribute>
				<xsl:apply-templates select="Options"/>
			</select>
			<input type="hidden" class="product-option-input">
				<xsl:attribute name="name">
					<xsl:text>product_option_</xsl:text>
				<xsl:value-of select="FieldId"/>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="ActiveOptionId"/>
				</xsl:attribute>
			</input>
		</div>
	</xsl:template>
	<xsl:template match="Options">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="OptionId"/>
			</xsl:attribute> 
			<xsl:value-of select="Title" disable-output-escaping="yes"/>
		</option>
	</xsl:template>
	<xsl:template match="ProductImages">
		<div class="swiper-slide">
			<a class=" " data-fancybox="">
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="ProductImages" mode="Thumbnail">
		<div class="swiper-slide">
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img>
		</div>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="Attr-Tab">
		<li>
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a class="" href="javascript:void(0)">
				<xsl:attribute name="data-type">
					<xsl:text disable-output-escaping="yes">#tab-</xsl:text>
					<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="Attr-Content">
		<div class="tab-item active">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">
				<xsl:text disable-output-escaping="yes">tab-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="fullcontent">
				<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="Attr-Full">
		<div class="table-info">
			<div class="title-heading"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
			<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
			<div class="wrapper-table">
				<div class="view-table-expand"><span>Xem thêm</span><em class="ri-arrow-down-s-fill"></em></div>
				<div class="view-table-compact"><span>Rút gọn</span><em class="ri-arrow-up-s-fill"></em></div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductRelated">
		<div class="product-wrapper">
			<!-- <div class="sale">-10%</div> -->
			<xsl:if test="Percent!=''">
				<div class="product-promotion sale">
					<xsl:text>-</xsl:text>
					<xsl:value-of select="Percent"></xsl:value-of>
					<xsl:text>%</xsl:text>
				</div>
			</xsl:if>
			<div class="card-img">
				<a class="">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div class="title">
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				<a class=" ">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</a>
			</div>
			<div class="block-price">
				<div class="price">
					<p><xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of></p>
				</div>
				<xsl:if test="OldPrice != ''">
					<div class="discount">
						<p><xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of></p>
					</div>
				</xsl:if>
			</div>
			<div class="block-btn">
				<ul>
					<li>
						<a class=" ">
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="target">
								<xsl:value-of select="Target"></xsl:value-of>
							</xsl:attribute>
							Xem thêm
						</a>
					</li>
					<li>
						<a class="add-to-cart" href="#!" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
							<xsl:attribute name="data-productid">
								<xsl:value-of select="ProductId"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							Mua ngay 
						</a>
					</li>
				</ul>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductOther">
		<div class="swiper-slide">
			<div class="product-wrapper">
				<xsl:if test="Percent!=''">
					<div class="product-promotion sale">
						<xsl:text>-</xsl:text>
						<xsl:value-of select="Percent"></xsl:value-of>
						<xsl:text>%</xsl:text>
					</div>
				</xsl:if>
				<div class="card-img">
					<a class="">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="title">
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					<a class=" ">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</a>
				</div>
				<div class="block-price">
					<div class="price">
						<p><xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of></p>
					</div>
					<xsl:if test="OldPrice != ''">

						<div class="discount">
							<p><xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of></p>
						</div>
					</xsl:if>
				</div>
				<div class="block-btn">
					<ul>
						<li>
							<a class=" ">
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="target">
									<xsl:value-of select="Target"></xsl:value-of>
								</xsl:attribute>
								Xem thêm
							</a>
						</li>
						<li>
							<a class="add-to-cart" href="#!" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
								<xsl:attribute name="data-productid">
									<xsl:value-of select="ProductId"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="data-title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								Mua ngay 
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
