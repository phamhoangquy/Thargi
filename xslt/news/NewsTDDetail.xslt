<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/NewsDetail">
		<section class="recruitment-detail">
			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<div class="card-title">
							<h1>
								<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h1>
						</div>
						<div class="info-hr-detail">
							<div class="card-img">
								<xsl:apply-templates select="NewsImages[1]"></xsl:apply-templates>
							</div>
							<div class="card-body-hr-detail">
								<xsl:apply-templates select="NewsAttributes[1]"></xsl:apply-templates>

							</div>
						</div>
						<div class="hr-list-content">
							<xsl:apply-templates select="NewsAttributes[position()&gt;1]" mode="NewsAttributes1"></xsl:apply-templates>

						</div>
						<div class="form-apply-detail">
							<div class="apply-form">
								<div class="btn button-apply">
									<a href="javascript:void(0)" data-fancybox="" data-src="#form-apply">Ứng tuyển</a>
								</div>
								<div class="text">Hoặc</div>
								<div class="btn button-download">
									<a href="" download="">
										<xsl:attribute name="href">
											<xsl:value-of select="FileUrl"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="title">
											<xsl:value-of select="Title"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="target">
											<xsl:value-of select="Target"></xsl:value-of>
										</xsl:attribute>
										Tải hồ sơ mẫu
									</a>
								</div>
							
							</div>
							<div class="form-apply" id="form-apply" style="display: none">
								<iframe>
									<xsl:attribute name="src">
										<xsl:value-of select="ApplyUrl"></xsl:value-of>
									</xsl:attribute>
								</iframe>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<xsl:if test="count(NewsOther)&gt;0">
							<div class="card-title-right">
								<h2>Tuyển dụng khác</h2>
							</div>
							<div class="card-body-right">
								<xsl:apply-templates select="NewsOther"></xsl:apply-templates>

							</div>
						</xsl:if>
					</div>
				</div>
			</div>
		</section>

	</xsl:template>
	<xsl:template match="NewsImages">
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
		</img>
	</xsl:template>
	<xsl:template match="NewsAttributes">
		<div class="title-zone">
			<h2>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</h2>
		</div>
		<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
	</xsl:template>
	<xsl:template match="NewsAttributes" mode="NewsAttributes1">
		<div class="hr-detail-content">
			<h3>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</h3>
		</div>
		<div class="text">
			<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
		</div>
	</xsl:template>
	<xsl:template match="NewsOther">
		<div class="content">
			<div class="title-detail">
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
			<div class="desc-detail">
				<xsl:if test="SubTitle != ''">
					<div class="city-detail">
						<div class="icon">
							<span class="ri-map-pin-2-fill"></span>
						</div>
						<div class="text">
							<xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
						</div>
					</div>
				</xsl:if>
				<div class="date">
					<div class="icon">
						<span class="ri-calendar-check-fill"></span>
					</div>
					<time>
						<xsl:value-of select="EndDate" disable-output-escaping="yes"></xsl:value-of>
					</time>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
