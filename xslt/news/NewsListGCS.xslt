<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<section class="shared-corner">
			<div class="container">
				<div class="head-title">
					<h1>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h1>
				</div>
				<div class="main-tabslet" data-toggle="tabslet">
					<div class="head-menu">
						<ul class="tabslet-tab">
							<xsl:apply-templates select="Zone[IsActive='true']/Zone" mode="Zone-Nav"></xsl:apply-templates>
						</ul>
					</div>
					<xsl:apply-templates select="Zone[IsActive='true']/Zone" mode="Zone-Content"></xsl:apply-templates>
					
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone-Nav">
		<li>
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a class=" ">
				<xsl:attribute name="href">
					<!-- <xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of> -->
					<xsl:text disable-output-escaping="yes">#tab-</xsl:text>
					<xsl:value-of select="position()"></xsl:value-of>
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
	<xsl:template match="Zone" mode="Zone-Content">
		<div class="tabslet-content">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">tabslet-content active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">
				<xsl:text disable-output-escaping="yes">tab-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="row">
				<div class="col-lg-6">
					<xsl:apply-templates select="News[1]" mode="News1"></xsl:apply-templates>

				</div>
				<div class="col-lg-6">
					<xsl:apply-templates select="News[position()&gt;1 and position()&lt;4]" mode="News2"></xsl:apply-templates>

				</div>
			</div>
			<div class="row">
				<xsl:apply-templates select="News[position()&gt;3]" mode="News3"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="News1">
		<div class="big-share">
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
			<div class="content-share">
				<div class="date">
					<time>
						<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
					</time>
				</div>
				<div class="title-share">
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
					<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="News2">
		<div class="row border">
			<div class="col-lg-6">
				<div class="share-right">
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
				</div>
			</div>
			<div class="col-lg-6">
				<div class="content">
					<div class="date">
						<time>
							<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
						</time>
					</div>
					<div class="title-share">
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
						Xem thêm
						<span class="ri-arrow-right-line"></span>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="News3">
		<div class="col-lg-3">
			<div class="small-share">
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
				<div class="content-share">
					<div class="date">
						<time><xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of></time>
					</div>
					<div class="title-share">
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
						<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
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
