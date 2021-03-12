<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/BannerList">
		<section class="home-banner">
			<div class="container-fuild">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="Banner"></xsl:apply-templates>
						
					</div>
				</div>
				<div class="banner-scroll">
					<div class="icon-banner"><span class="ri-arrow-down-s-line"></span></div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="swiper-slide">
			<div class="wrapper">
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
			<div class="caption container" setBackground="/Data/Sites/1/media/home/bg-text-banner.png">
				<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
