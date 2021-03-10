<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<section class="home_s-3">
			<div class="container">
				<div class="head-title">
					<h2><xsl:value-of select="ModuleTitle" disable-output-escaping="yes"></xsl:value-of></h2>
				</div>
				<div class="head-menu">
					<ul class="tab-navigation-2">
						<li class="active">
							<a href="javascript:void(0)" data-type="product-0">Tất cả</a>
						</li>
						<xsl:apply-templates select="Zone"></xsl:apply-templates>
					</ul>
				</div>
				<div class="tab-wrapper-2">
					<div class="tab-item-2 active" id="product-0">
						<div class="row">
							<xsl:apply-templates select="Zone/Product"></xsl:apply-templates>
						</div>
						<a class="big-view" href="#">
							<xsl:attribute name="href">
								<xsl:value-of select="Zone/Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Zone/Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="target">
								<xsl:value-of select="Zone/Target"></xsl:value-of>
							</xsl:attribute>
							
							Xem thêm
						</a>
					</div>
					<xsl:apply-templates select="Zone" mode="ZoneContent"></xsl:apply-templates>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Zone">
		<li>
			<a href="javascript:void(0)">
				<xsl:attribute name="data-type">
					<xsl:text disable-output-escaping="yes">product-</xsl:text>
					<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="ZoneContent">
		<div class="tab-item-2">
			<xsl:attribute name="id">
				<xsl:text disable-output-escaping="yes">product-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="row">
				<xsl:apply-templates select="Product"></xsl:apply-templates>
			</div>
			<a class="big-view" href="#">
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
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-lg-3">
			<div class="product-wrapper">
				<xsl:if test="Percent!=''">
					<div class="product-promotion sale">
						<xsl:text>-</xsl:text>
						<xsl:value-of select="Percent"></xsl:value-of>
						<xsl:text>%</xsl:text>
					</div>
				</xsl:if>
				<div class="card-img">
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
							<a href="#!" class="btn-buy" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
								<xsl:attribute name="data-productid">
									<xsl:value-of select="ProductId"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="data-title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<!-- <xsl:attribute name="data-code">
									<xsl:value-of select="Code"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="data-price">
									<xsl:value-of select="PriceTracking"></xsl:value-of>
								</xsl:attribute> -->
								Mua ngay
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
