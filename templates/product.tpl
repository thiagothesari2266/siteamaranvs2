<div id="single-product" class="js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container pb-4 pt-md-4 pb-md-3" data-variants="{{product.variants_object | json_encode }}" data-store="product-detail">
    <div class="container pt-md-1">
        <div class="row">
            <div class="col-md-7 pb-4">
                {% include 'snipplets/product/product-image.tpl' %}
            </div>
            <div class="col" data-store="product-info-{{ product.id }}">
                {% include 'snipplets/product/product-form.tpl' %}
                {% if not settings.full_width_description %}
                    {% include 'snipplets/product/product-description.tpl' %}
                {% endif %}
            </div>
        </div>
    </div>

    {# Product description full width #}

    {% if settings.full_width_description %}
        {% include 'snipplets/product/product-description.tpl' %}
    {% endif %}
</div>

{# Related products #}
{% include 'snipplets/product/product-related.tpl' %}