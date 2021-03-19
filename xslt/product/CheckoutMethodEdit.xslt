<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<section class="payment-info clearfix">
			<xsl:if test="count(/CheckoutMethod/Shipping)>0">
				<div class="box-shipping">
					<h3 class="carttitle">Phương thức vận chuyển</h3>
					<div class="cart-form clearfix">
						<xsl:apply-templates select="/CheckoutMethod/Shipping"></xsl:apply-templates>
					</div>
				</div>
			</xsl:if>
			<xsl:if test="count(/CheckoutMethod/Payment)>0">
				<div class="box-payment">
					<h3 class="carttitle">Phương thức thanh toán</h3>
					<div class="cart-form clearfix">
						<xsl:apply-templates select="/CheckoutMethod/Payment"></xsl:apply-templates>
					</div>
				</div>
			</xsl:if>
			<div class="cart-button clearfix">
				<a class="btn-back">
					<xsl:attribute name="href">
						<xsl:text>/cart</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<xsl:text>Quay lại</xsl:text>
				</a>
				<button type="submit" id="checkout" name="checkout" class="hvr-sweep-to-right btn-continue">
					<xsl:attribute name="onclick">
						<xsl:text>AjaxCheckout.saveorder(true, '</xsl:text>
						<xsl:value-of select="/CheckoutMethod/NextPageUrl"></xsl:value-of>
						<xsl:text>');return false;</xsl:text>
					</xsl:attribute>
					<xsl:text>Đặt hàng</xsl:text>
				</button>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Shipping">
		<div class="form-group select-group">
			<input type="radio" name="ShippingMethod" onchange="AjaxCheckout.getshippingtotal(this)">
				<xsl:if test="position()=1">
					<xsl:attribute name="checked">
						<xsl:text>checked</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="value">
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>shipping</xsl:text>
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
			</input>
			<label>
				<xsl:attribute name="for">
					<xsl:text>shipping</xsl:text>
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title"></xsl:value-of>
			</label>
			<xsl:if test="Description!=''">
				<div class="des">
					<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</xsl:if>
			<xsl:if test="count(Service)>0">
				<div class="services">
					<select name="GHNServiceID" onchange="AjaxCheckout.getshippingtotalSelect(this)">
						<xsl:apply-templates select="Service"></xsl:apply-templates>
					</select>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="Service">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="Value"/>
			</xsl:attribute>
			<xsl:value-of select="Name"/>
		</option>
	</xsl:template>
	<xsl:template match="Payment">
		<div class="payment-method">
			<div class="select-group">
				<input type="radio" name="PaymentMethod">
					<xsl:attribute name="id">
						<xsl:value-of select="Id"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="Id"></xsl:value-of>
					</xsl:attribute>
					<xsl:if test="position()=1">
						<xsl:attribute name="checked">
							<xsl:text>checked</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="Id"></xsl:value-of>
						</xsl:attribute>
					</xsl:if>
				</input>
				<label>
					<xsl:attribute name="for">
						<xsl:value-of select="Id"></xsl:value-of>
					</xsl:attribute>
					<div class="method-info">
						<xsl:if test="Description!=''">
							<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
						</xsl:if>
					</div>
				</label>
				<xsl:if test="Id=3">
					<div class="agree">
						<h3 class="title">
							Quy định về việc sử dụng trang web
							<a href="javascript:void(0)" title="Quy định về việc sử dụng trang web">
								<em class="ri-information-line"></em>
							</a>
						</h3>
						<input id="PaymentAgree" type="checkbox" checked="checked" name="PaymentAgree" />
						<label for="PaymentAgree">Tôi đã đọc và đồng ý điều khoản trên</label>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
