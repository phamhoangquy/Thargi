<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="row flex flex-wrap">
			<div class="col-12 col-lg-7 col-xl-8">
				<div class="box-product">
					<h2 class="carttitle">
						Giỏ hàng của bạn (
						<xsl:value-of select="OrderDetail/OrderItemCount"></xsl:value-of> sản phẩm)
					</h2>
					<div class="product-list">
						<xsl:apply-templates select="OrderDetail/OrderItem"></xsl:apply-templates>
					</div>
					<div class="total-payment">
						<p>
							<span>Tổng tiền hàng</span> 
							<span>
								<xsl:value-of select="OrderDetail/OrderSubtotal"/>
							</span>
						</p>
						<p>
							<span>
								Giảm giá phí
							</span>
							<span>
								<xsl:value-of select="OrderDetail/TotalDiscount"/>
							</span>
						</p>
						<p>
							<span>
								Tổng tiền phí vận chuyển
							</span>
							<span>
								<xsl:value-of select="OrderDetail/ShippingTotal"/>
							</span>
						</p>
						<p class="main-total">
							<span>
								Tổng thanh toán
							</span>
							<span>
								<xsl:value-of select="OrderDetail/TotalRevenue"/>
							</span>
						</p>
					</div>
				</div>
			
			</div>
			<div class="col-12 col-lg-5 col-xl-4">
				<div class="box-addrees">
					<h2 class="carttitle">
						Địa chỉ nhận hàng
					</h2>
					<div class="info">
						<p >
							<strong>
								Họ tên
							</strong>
						</p>
						<p class="item">
							<xsl:value-of select="OrderDetail/ReceiverLastName"/>
							<xsl:value-of select="OrderDetail/ReceiverFirstName"/>
						</p>
						<p>
							<strong>
								Địa chỉ
							</strong>
						</p>
						<p class="item">
							<xsl:value-of select="OrderDetail/ReceiverAddress"/>
						</p>
						<p>
							<strong>
								Số điện thoại
							</strong>
						</p>
						<p class="item">
							<xsl:value-of select="OrderDetail/ReceiverPhone"/>
						</p>
						<p>
							<strong>
								Email
							</strong>
						</p>
						<p>
							<xsl:value-of select="OrderDetail/ReceiverEmail"/>
						</p>
					</div>
				</div>
			
			</div>
		</div>

	</xsl:template>
	<xsl:template match="OrderItem">
		<div class="product-item">
			<div class="left">
				<div class="image">
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
					<p>
						<xsl:value-of select="Title"/>
					</p>
				</div>
			</div>
			<div class="amount">
				<xsl:if test="DiscountPercentage !=''">
					<p class="old">
						<xsl:value-of select="OldPrice"></xsl:value-of>
					</p>
				</xsl:if>
				<xsl:if test="DiscountPercentage !=''">
					<p class="sale">
						<xsl:text>-</xsl:text>
						<xsl:value-of select="DiscountPercentage"></xsl:value-of>
						<xsl:text>%</xsl:text>
					</p>
				</xsl:if>
				<p>
					<xsl:value-of select="Price"/>
				</p>
				<p>x
					<xsl:value-of select="Quantity"/>
				</p>
				<p class="total">
					<xsl:value-of select="ItemTotal"/>
				</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
