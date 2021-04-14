<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<section class="about check-scroll-section" id="section-1">
			<xsl:attribute name="setBackground">
				<xsl:value-of select="Zone[1]/ImageUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="container"> 
				<xsl:apply-templates select="Zone[1]/News" mode="Zone1-News"></xsl:apply-templates>
			</div>
		</section>
		
		<section class="about-2 check-scroll-section" id="section-2">
			<xsl:attribute name="setBackground">
				<xsl:value-of select="Zone[2]/ImageUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="container">
				<div class="head-title">
					<h2><xsl:value-of select="Zone[2]/Title" disable-output-escaping="yes"></xsl:value-of></h2>
				</div>
				<div class="row">
					<xsl:apply-templates select="Zone[2]/News" mode="Zone2-News"></xsl:apply-templates>
					
			
				</div>
			</div>
		</section>
		<div class="background-img">
			<xsl:attribute name="setBackground">
				<xsl:value-of select="Zone[3]/ImageUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<section class="about-3 check-scroll-section" id="section-3">
				<div class="container">
					<div class="head-title">
						<h2><xsl:value-of select="Zone[3]/Title" disable-output-escaping="yes"></xsl:value-of></h2>
					</div>
					<div class="row">
						<xsl:apply-templates select="Zone[3]/News" mode="Zone3-News"></xsl:apply-templates>
						
					</div>
				</div>
			</section>
			<section class="about-4 check-scroll-section" id="section-4">
				<div class="container">
					<div class="row bg-4">
						<xsl:attribute name="setBackground">
							<xsl:value-of select="Zone[4]/ImageUrl" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<div class="col-lg-10">
							<div class="head-title">
								<h2><xsl:value-of select="Zone[4]/Title" disable-output-escaping="yes"></xsl:value-of></h2>
							</div>
							<div class="description">
								<xsl:value-of select="Zone[4]/Description" disable-output-escaping="yes"></xsl:value-of>
							</div>
							<div class="item-about-4">
								<ul>
									<xsl:apply-templates select="Zone[4]/News" mode="Zone4-News"></xsl:apply-templates>
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="about-5 check-scroll-section" id="section-5">
				<div class="container">
					<div class="head-title">
						<h2>
							<xsl:value-of select="Zone[5]/Title" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<div class="row">
						<xsl:apply-templates select="Zone[5]/News" mode="Zone5-News"></xsl:apply-templates>
					</div>
				</div>
			</section>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Zone1-News">
		<div class="row">
			<div class="col-lg-6"> 
				<div class="figure-video media-play">
					<div class="wrapper-video">
						<a data-fancybox="gallery">
							<xsl:attribute name="href">
								<xsl:value-of select="FileUrl" disable-output-escaping="yes"></xsl:value-of>
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
						<div class="fish">
							<img>
								<xsl:attribute name="src">
									<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
							</img>
						</div>
					</div>
					<div class="video">
						<div class="icon"><img src="/Data/Sites/1/media/about/icon-video.png" alt=""/></div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="content-about">
					<div class="head-title">
						<h1><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h1>
					</div>
					<div class="desc"> 
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Zone2-News">
		<div class="col-lg-5">
			<div class="item-about-2"> 
				<div class="card-img">
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<div class="title">
					<h3><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h3>
				</div>
				<div class="caption">
					<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Zone3-News">
		<div class="col-lg-4">
			<div class="item-about-3">
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
				<div class="content-about">
					<div class="title-about">
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
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Zone4-News">
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
	<xsl:template match="News" mode="Zone5-News">
		<div class="col-lg-6">
			<div class="item-about-5">
				<div class="card-img">
					<a class="images-zoom" href="#">
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
				<div class="content-about">
					<div class="date">
						<time>
							<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
						</time>
					</div>
					<div class="title-about">
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
							
						Xem thêm
						<span class="ri-arrow-right-line"></span>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
