<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<section class="recruitment-2">
			<div class="container">
				<div class="head-title">
					<h2><xsl:value-of select="ModuleTitle" disable-output-escaping="yes"></xsl:value-of></h2>
				</div>
				<div class="row">
					<xsl:apply-templates select="News"></xsl:apply-templates>
				</div>
				<xsl:if test="count(News)&gt;6">
					<a class="big-view" href="javascript:;">
						Xem thêm
						<span class="ri-arrow-down-line"></span>
					</a>
				</xsl:if>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-lg-6">
			<div class="content-jobs-list">
				<div class="title-jobs">
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
				<xsl:if test="SubTitle != ''">
					<div class="city-jobs">
						<div class="icon-jobs"><span class="ri-map-pin-2-fill"></span></div>
						<div class="title-zone-city"><xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of></div>
					</div>
				</xsl:if>
				<div class="agree-jobs">
					<div class="date">
						<div class="icon"><span class="ri-calendar-check-fill"></span></div>
						<time><xsl:value-of select="EndDate" disable-output-escaping="yes"></xsl:value-of></time>
					</div>
					<div class="view-detail">
						<a href="#">
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
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
