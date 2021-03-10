<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ProductFilter">
		<div class="item-checkbox">
			<div class="ajaxfilterresponse">
				<xsl:apply-templates select="Group"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Group">
		<div class="checkbox-list">
			<div class="title">
				<h2><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h2>
			</div>
			<div class="content-checkbox">
				<ul>
					<xsl:apply-templates select="Option"></xsl:apply-templates>
				</ul>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Option">
		<li class="checkbox">
			<a class="ajaxlink">
				<xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>ajaxlink active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>
