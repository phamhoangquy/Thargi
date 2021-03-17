<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<section class="home_s-4" data-aos="fade-up">
			<div class="container">
				<xsl:apply-templates select="Zone"></xsl:apply-templates>
			
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="row bg-4" setBackground="/Data/Sites/1/media/about/bg-4.png" alt="">
			<div class="col-lg-10">
				<div class="head-title">
					<h2><xsl:value-of select="/ZoneList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of></h2>
				</div>
				<div class="description">
					<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<a class="view-more" href="#">
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
				<div class="item-about">
					<ul>
						<xsl:apply-templates select="News"></xsl:apply-templates>
						
						
					</ul>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<li>
			<div class="img-logo">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<div class="text-logo">
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</li>
	</xsl:template>
</xsl:stylesheet>
