<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
	<section class="faqs-list">
		<div class="container">
			<div class="head-title">
				<h1><xsl:value-of select="ZoneTitle" disable-output-escaping="yes"></xsl:value-of></h1>
			</div>
			<div class="faqs">
				<ul class="block-togglefaqs">
					<xsl:apply-templates select="News"></xsl:apply-templates>
					
				</ul>
			</div>
		</div>
	</section>
	</xsl:template>
	<xsl:template match="News">
		<li>
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			<a class="togglefaqs">
				<xsl:if test="position()&lt;10">
					<xsl:text disable-output-escaping="yes">0</xsl:text>
				</xsl:if>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
				<xsl:text disable-output-escaping="yes"> </xsl:text>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
			<div class="content">
				<div class="caption">
					<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</li>
	</xsl:template>
</xsl:stylesheet>
