<div class="pt-md-3{% if not home_main_product %} px-md-3{% endif %}">

    {# Product name and breadcrumbs for product page #}

    {% if home_main_product %}
        {# Product name #}
        <h2 class="mb-3">{{ product.name }}</h2>
    {% else %}
        {% embed "snipplets/page-header.tpl" with {container: false, padding: false, page_header_title_class: 'js-product-name mb-3 nome-produto'} %}
            {% block page_header_text %}{{ product.name }}{% endblock page_header_text %}
        {% endembed %}
    {% endif %}

    {# Product SKU #}

    {% if settings.product_sku and product.sku %}
        <div class="font-small opacity-60 mb-3">
            {{ "SKU" | translate }}: <span class="js-product-sku">{{ product.sku }}</span>
        </div>
    {% endif %}

    {# Product price #}

    <div class="price-container" data-store="product-price-{{ product.id }}">
        <div class="mb-3">
            <span class="d-inline-block mr-1">
            	<div class="js-price-display h3" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %} data-product-price="{{ product.price }}">{% if product.display_price %}{{ product.price | money }}{% endif %}</div>
            </span>
            {% include 'snipplets/labels.tpl' with {product_detail: true} %}
            <span class="d-block font-big title-font-family mt-1">
               <div id="compare_price_display" class="js-compare-price-display price-compare {% if settings.payment_discount_price %}font-body{% endif %}" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{% if product.compare_at_price and product.display_price %}{{ product.compare_at_price | money }}{% endif %}</div>
            </span>

            {{ component('payment-discount-price', {
                    visibility_condition: settings.payment_discount_price,
                    location: 'product',
                    container_classes: "h6 font-weight-normal mt-2",
                    text_classes: {
                        price: 'h5 text-accent font-weight-bold',
                    },
                })
            }}
        </div>


{#INFORMACAO DE PARCELAMENTO#}
        {% set installments_info = product.installments_info_from_any_variant %}
		
        {% set hasDiscount = product.maxPaymentDiscount.value > 0 %}
        {% set show_payments_info = settings.product_detail_installments and product.show_installments and product.display_price and installments_info %}
        {% set showDiscount = hasDiscount and product.showMaxPaymentDiscount %}
        {% set discountContainerStyle = not (showDiscount) ? "display: none" %}

        {% if not home_main_product and (show_payments_info or showDiscount) %}
            <div {% if installments_info %}data-toggle="#installments-modal" data-modal-url="modal-fullscreen-payments"{% endif %} class="{% if installments_info %} js-modal-open js-fullscreen-modal-open{% endif %} js-product-payments-container mb-3 {% if not home_main_product %}col-md-8{% endif %} px-0" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
        {% endif %}
        {% if show_payments_info %}
            {{ component('installments', {'location' : 'product_detail', container_classes: { installment: "parcelamento-produto"}}) }}
        {% endif %}
            <div class="js-product-discount-container mb-2 font-small" style="{{ discountContainerStyle }}">
                <span class="text-accent">{{ product.maxPaymentDiscount.value }}% {{'de descuento' | translate }}</span> {{'pagando con' | translate }} {{ product.maxPaymentDiscount.paymentProviderName }}
                {% set discountDisclaimerStyle = not product.showMaxPaymentDiscountNotCombinableDisclaimer ? "display: none" %}
                    <div class="js-product-discount-disclaimer font-small mt-1 opacity-60" style="{{ discountDisclaimerStyle }}">
                        {{ "No acumulable con otras promociones" | translate }}
                    </div>
            </div>
        {% if not home_main_product and (show_payments_info or hasDiscount) %}
                <a id="btn-installments" class="font-small" href="#" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                    <svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#credit-card"/></svg>
                    {% if not hasDiscount and not settings.product_detail_installments %}
                        {{ "Ver medios de pago" | translate }}
                    {% else %}
                        {{ "Ver más detalles" | translate }}
                    {% endif %}
                </a>
            </div>
        {% endif %}

        {# Product availability #}

        {% set show_product_quantity = product.available and product.display_price %}

        {# Free shipping minimum message #}
        {% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}
        {% set has_product_free_shipping = product.free_shipping %}

        {% if not product.is_non_shippable and show_product_quantity and (has_free_shipping or has_product_free_shipping) %}
            <div class="free-shipping-message mb-4">
                <span class="float-left mr-1">
                    <svg class="icon-inline svg-icon-accent icon-lg"><use xlink:href="#truck"/></svg>
                </span>
                <span class="font-small">
                    <span class="text-accent">{{ "Envío gratis" | translate }}</span>
                    <span {% if has_product_free_shipping %}style="display: none;"{% else %}class="js-shipping-minimum-label"{% endif %}>
                        {{ "superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
                    </span>
                </span>
                {% if not has_product_free_shipping %}
                    <div class="js-free-shipping-discount-not-combinable font-small opacity-60 mt-1">
                        {{ "No acumulable con otras promociones" | translate }}
                    </div>
                {% endif %}
            </div>
        {% endif %}
    </div>

    {{ component('promotions-details', {
        promotions_details_classes: {
            container: 'js-product-promo-container px-0 mb-2' ~ (not home_main_product ? ' col-md-8' : ''),
            promotion_title: 'mb-1 mt-4 text-accent',
            valid_scopes: 'font-small mb-0',
            categories_combinable: 'font-small mb-0',
            not_combinable: 'font-small opacity-60 mb-0',
            progressive_discounts_table: 'table mb-2 mt-3',
            progressive_discounts_hidden_table: 'table-body-inverted',
            progressive_discounts_show_more_link: 'btn-link btn-link-primary mb-4',
            progressive_discounts_show_more_icon: 'icon-inline',
            progressive_discounts_hide_icon: 'icon-inline icon-flip-vertical',
            progressive_discounts_promotion_quantity: 'font-weight-light text-lowercase'
        },
        accordion_show_svg_id: 'chevron-down',
        accordion_hide_svg_id: 'chevron-down',
    }) }}


    {# Product form, includes: Variants, CTA and Shipping calculator #}

     <form id="product_form" class="js-product-form mt-4" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
        <input type="hidden" name="add_to_cart" value="{{product.id}}" />
        {% if template == "product" %}
            {% set show_size_guide = true %}
        {% endif %}
        {% if product.variations %}
            {% include "snipplets/product/product-variants.tpl" with {show_size_guide: show_size_guide} %}
        {% endif %}

        {% if settings.last_product and show_product_quantity %}
            <div class="{% if product.variations %}js-last-product{% endif %} text-accent mb-3"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
                {{ settings.last_product_text }}
            </div>
        {% endif %}

        <div class="row no-gutters mb-4 {% if settings.product_stock %}mb-md-3{% endif %}">
            {% set product_quantity_home_product_value = home_main_product ? true : false %}
            {% if show_product_quantity %}
                {% include "snipplets/product/product-quantity.tpl" with {home_main_product: product_quantity_home_product_value} %}
            {% endif %}
            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
            <div class="{% if show_product_quantity %}col-8 {% if not home_main_product %}col-md-9{% endif %}{% else %}col-12{% endif %}">

                {# Add to cart CTA #}

                <input type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big btn-block {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>

                {# Fake add to cart CTA visible during add to cart event #}

                {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-big"} %}

            </div>

            {% if settings.ajax_cart %}
                <div class="col-12">
                    <div class="js-added-to-cart-product-message font-small my-3" style="display: none;">
                        <svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#check"/></svg>
                        <span>
                            {{'Ya agregaste este producto.' | translate }}<a href="#" class="js-modal-open js-open-cart js-fullscreen-modal-open btn-link font-small ml-1" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                        </span>
                    </div>
                </div>
            {% endif %}

            {# Free shipping visibility message #}

            {% set free_shipping_minimum_label_changes_visibility = has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

            {% set include_product_free_shipping_min_wording = cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

            {% if not product.is_non_shippable and show_product_quantity and has_free_shipping and not has_product_free_shipping %}

                {# Free shipping add to cart message #}

                {% if include_product_free_shipping_min_wording %}

                    {% include "snipplets/shipping/shipping-free-rest.tpl" with {'product_detail': true} %}

                {% endif %}

                {# Free shipping achieved message #}

                <div class="{% if free_shipping_minimum_label_changes_visibility %}js-free-shipping-message{% endif %} text-accent font-weight-bold my-2 pt-1 h6" {% if not cart.free_shipping.cart_has_free_shipping %}style="display: none;"{% endif %}>
                    {{ "¡Genial! Tenés envío gratis" | translate }}
                </div>

            {% endif %}
        </div>

        {% if template == 'product' %}

            {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

            {% if show_product_fulfillment %}
                <div class="mb-4 pb-2">
                    {# Shipping calculator and branch link #}

                    <div id="product-shipping-container" class="product-shipping-calculator list" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
                        {% if store.has_shipping %}
                            {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                        {% endif %}
                    </div>

                    {% if store.branches %}
                        {# Link for branches #}
                        {% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
                    {% endif %}
                </div>

            {% endif %}
        {% endif %}
     </form>
</div>

{% if not home_main_product %}
   {# Product payments details #}
    {% include 'snipplets/product/product-payment-details.tpl' %}
{% endif %}
