<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<section class="home_s-2" setBackground="/Data/Sites/1/media/home/bg-news-home.png" alt="">
			<xsl:apply-templates select="Zone"></xsl:apply-templates>
		</section>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 pg">
					<div class="head-title">
						<h2><xsl:value-of select="/ZoneList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of></h2>
					</div>
					<div class="description">
						<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<a class="view-all" href="#">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						
						Xem tất cả
					</a>
				</div>
				<div class="col-lg-6">
					<xsl:apply-templates select="News[1]"></xsl:apply-templates>
					
				</div>
				<div class="col-lg-3 pg">
					<xsl:apply-templates select="News[position()&gt;1 and position()&lt;5]" mode="News2"></xsl:apply-templates>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="news-home-swiper-wrapper">
				<div class="nav-arrow-prev">
					<span class="ri-arrow-left-fill"></span>
				</div>
				<div class="nav-arrow-next">
					<span class="ri-arrow-right-fill"></span>
				</div>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="News[position()&gt;4]" mode="News3"></xsl:apply-templates>
						
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
		<div class="big-promotion images-zoom">
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
	</xsl:template>
	<xsl:template match="News" mode="News2">
		<div class="content">
			<div class="date">
				<time><xsl:value-of select="CreatedDD" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedMM" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedYYYY" disable-output-escaping="yes"></xsl:value-of></time>
			</div>
			<div class="title-promotion">
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
			<a class="view-more" href="">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				
				Xem chi tiết
				<span class="ri-arrow-right-line"></span>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="News3">
		<div class="swiper-slide">
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			<div class="small-promotion images-zoom">
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
		</div>
	</xsl:template>
</xsl:stylesheet>
