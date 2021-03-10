<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<div class="item-product-list">
			<div class="sub-title-product">
				<h2>
					<xsl:value-of select="ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
				</h2>
			</div>
			<div class="content">
				<ul>
					<xsl:apply-templates select="Zone[IsActive='true']/Zone"></xsl:apply-templates>
				</ul>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone">
		<li class="has-dropdown">
			<xsl:if test="IsActive = 'true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">has-dropdown active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<div class="title-zone">
				<a class="ajaxlink">
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
				<xsl:if test="count(Zone)&gt;0">
					<span class="ri-arrow-right-s-fill"></span>
				</xsl:if>
			</div>
			<xsl:if test="count(Zone)&gt;0">
				<ul class="sub-product">
					<xsl:apply-templates select="Zone" mode="ZoneChild"></xsl:apply-templates>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="ZoneChild">
		<li class="sub-has-dropdown">
			<xsl:if test="IsActive = 'true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">sub-has-dropdown active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a class="ajaxlink">
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
		</li>
	</xsl:template>
</xsl:stylesheet>
