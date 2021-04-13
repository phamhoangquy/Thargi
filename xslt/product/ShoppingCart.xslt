<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
			<xsl:choose>
				<xsl:when test="count(/ShoppingCart/CartItem)=0">
					<section class="cart-page cart-step-1 clearfix">
						<h2 class="carttitle">
							<i class="fa fa-cart-arrow-down"></i>
							<xsl:text> </xsl:text>
							<xsl:value-of select="/ShoppingCart/CartEmptyText"></xsl:value-of>
						</h2>
						<section class="cart-button clearfix">
							<a href="/" class="btn-back">
								<xsl:value-of select="/ShoppingCart/BackText"></xsl:value-of>
							</a>
						</section>
					</section>
				</xsl:when>
				<xsl:otherwise>
					<section class="cart-page cart-step-1 clearfix">
						<h1 class="carttitle">
							<xsl:value-of select="/ShoppingCart/YourCartText"></xsl:value-of>
							(
							<strong>
								<xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
								<xsl:text> </xsl:text>
							</strong>
							<xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>)
						</h1>
						<div class="body-cart">
							<table class="cart-table">
								<thead>
									<tr>
										<th>
											<xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>
										</th>
										<th>
											<xsl:value-of select="/ShoppingCart/QuantityText"></xsl:value-of>
										</th>
										<th>
											<xsl:value-of select="/ShoppingCart/TotalCartText"></xsl:value-of>
										</th>
										<!-- <th>
											<xsl:value-of select="/ShoppingCart/ItemTotalText"></xsl:value-of>
										</th> -->
									</tr>
								</thead>
								<tbody>
									<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
								</tbody>
							</table>
						</div>
					</section>
					<section class="cart-step-1-bottom">
						<div class="btn-wrap clearfix">
							<div class="btn-left">
								<a class="btn-back hidden-sm-down">
									<xsl:attribute name="href">
										<xsl:value-of select="/ShoppingCart/ContinueShoppingUrl"></xsl:value-of>
									</xsl:attribute>
									<xsl:value-of select="/ShoppingCart/ContinueShoppingText"></xsl:value-of>
								</a>
							</div>
							<div class="btn-right">
								<div class="totalamount">
									<!-- <xsl:apply-templates select="/ShoppingCart/NotionalPriceText"></xsl:apply-templates> -->
									Tạm tính
									<xsl:text>: </xsl:text>
									<strong>
										<xsl:value-of select="/ShoppingCart/Total"></xsl:value-of>
									</strong>
								</div>
								<div class="payment-des">
									<!-- <xsl:value-of select="/ShoppingCart/PriceHasIncludedVATText"></xsl:value-of> -->
									Giá chưa bao gồm thuế VAT
								</div>
								<a href="#!" class="hvr-sweep-to-right btn-continue">
									<xsl:attribute name="onclick">
										<xsl:text>setLocation('</xsl:text>
										<xsl:value-of select="/ShoppingCart/CheckoutUrl"></xsl:value-of>
										<xsl:text>');return false;</xsl:text>
									</xsl:attribute>
									<xsl:value-of select="/ShoppingCart/CheckoutProcessText"></xsl:value-of>
								</a>
							</div>
						</div>
					</section>
				</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	<xsl:template match="CartItem">
		<tr>
			<td class="product">
				<figure>
					<a class="product-img">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</a>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					<figcaption>
						<h3 class="product-name">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</a>
						</h3>
						<xsl:apply-templates select="Attributes"></xsl:apply-templates>
						<a href="#" class="removeproduct" onclick="AjaxCart.removefromcart(this);return false;">
							<xsl:attribute name="data-itemguid">
								<xsl:value-of select="ItemGuid"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-productid">
								<xsl:value-of select="ProductId"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-code">
								<xsl:value-of select="Code"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-price">
								<xsl:value-of select="PriceTracking"></xsl:value-of>
							</xsl:attribute>
							<em class="ri-delete-bin-fill" aria-hidden="true"></em>
							<xsl:value-of select="DeleteProductText"></xsl:value-of>
						</a>
					</figcaption>
				</figure>
			</td>
			<td class="amount">
				<div class="input-number">
					<div class="btn-spin btn-dec spin-btn" data-spin="dec">-</div>
					<input type="text" maxlength="10" class="qty-input amount" onchange="AjaxCart.updatecart();return false;">
						<xsl:attribute name="name">
							<xsl:text>itemquantity</xsl:text>
							<xsl:value-of select="ItemGuid"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="Quantity"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="data-productid">
							<xsl:value-of select="ProductId"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="data-title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="data-code">
							<xsl:value-of select="Code"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="data-price">
							<xsl:value-of select="PriceTracking"></xsl:value-of>
						</xsl:attribute>
					</input>
					<div class="btn-spin btn-inc spin-btn" data-spin="inc">+</div>
				</div>
			</td>
			<td class="price">
				<div class="top">
					<xsl:if test="DiscountPercentage !=''">
						<div class="old">
							<xsl:value-of select="OldPrice"></xsl:value-of>
						</div>
					</xsl:if>
					<xsl:if test="DiscountPercentage !=''">
						<div class="sale">
							<xsl:text>-</xsl:text>
							<xsl:value-of select="DiscountPercentage"></xsl:value-of>
							<xsl:text>%</xsl:text>
						</div>
					</xsl:if>
					<div class="new">
						<xsl:value-of select="Price"></xsl:value-of>
					</div>
				</div>
				<div class="mid">
					<xsl:text disable-output-escaping="yes">x</xsl:text>
					<xsl:value-of select="Quantity"></xsl:value-of>
				</div>
				<div class="bottom">
					<xsl:value-of select="ItemSubTotal"></xsl:value-of>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="CartItem" mode="Gifts">
		<xsl:if test="GiftDescription!=''">
			<div class="row flex flex-wrap">
				<xsl:value-of select="GiftDescription" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Quantities">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="Quantity"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Quantity"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Attributes">
		<div class="productsize">
			<xsl:value-of select="Title"></xsl:value-of>
			<xsl:text>: </xsl:text>
			<span>
				<xsl:apply-templates select="Options"></xsl:apply-templates>
			</span>
		</div>
	</xsl:template>
	<xsl:template match="Options">
		<xsl:if test="IsActive='true'">
			<xsl:value-of select="Title"></xsl:value-of>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
