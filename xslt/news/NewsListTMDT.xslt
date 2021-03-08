<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<div class="row">
			<div class="col-lg-6">
				<div class="item-shop-tmdt">
					<ul>
						<xsl:apply-templates select="News"></xsl:apply-templates>
						
					</ul>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<li>
			<div class="tmdt">
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
		</li>
	</xsl:template>
</xsl:stylesheet>
