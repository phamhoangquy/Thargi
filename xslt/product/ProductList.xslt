<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ProductList">
		<div class="product-right ajaxresponse">
			<div class="block-title-sort">
				<div class="title-product">
					<h1><xsl:value-of select="ZoneTitle" disable-output-escaping="yes"></xsl:value-of></h1>
				</div>
				<div class="block-sort">
					<div class="text-sort">Sắp xếp</div>
					<div class="select-sort"> 
						<select class="ajaxsort">
							<xsl:apply-templates select="SortBy"></xsl:apply-templates>
						</select>
					</div>
				</div>
			</div>
			<div class="row ajaxresponsewrap">
				<xsl:apply-templates select="Product"></xsl:apply-templates>
				
			</div>
		</div>
	</xsl:template>
	<xsl:template match="SortBy">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-lg-4">
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
					<xsl:if test="OldPrice!=''">

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
