<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<div class="row">
			<xsl:apply-templates select="News[position()&gt;0 and position()&lt;3]"></xsl:apply-templates>
		</div>
		<div class="row">
			<xsl:apply-templates select="News[position()&gt;2]" mode="News2"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-lg-6">
			<div class="big-news-left">
				<xsl:if test="position()=2">
					<xsl:attribute name="class">
						<xsl:text disable-output-escaping="yes">big-news-right</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<div class="card-img images-zoom">
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
				<div class="content-news">
					<div class="date">
						<time><xsl:value-of select="CreatedDD" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedMM" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedYYYY" disable-output-escaping="yes"></xsl:value-of></time>
					</div>
					<div class="title-news">
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
					<div class="title-zone">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
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
		</div>
	</xsl:template>
	<xsl:template match="News" mode="News2">
		<div class="col-lg-3">
			<div class="small-news">
				<div class="card-img images-zoom">
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
				<div class="content-news">
					<div class="date">
						<time><xsl:value-of select="CreatedDD" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedMM" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedYYYY" disable-output-escaping="yes"></xsl:value-of></time>
					</div>
					<div class="title-news">
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
					<div class="title-zone">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
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
		</div>
	</xsl:template>
</xsl:stylesheet>
