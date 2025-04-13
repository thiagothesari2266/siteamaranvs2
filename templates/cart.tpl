<div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}" data-store="cart-page">
    {% embed "snipplets/page-header.tpl" with {'breadcrumbs': true} %}
        {% block page_header_text %}{{ "Carrito de compras" | translate }}{% endblock page_header_text %}
    {% endembed %}
    
    <form action="{{ store.cart_url }}" method="post" class="visible-when-content-ready container mb-5" data-store="cart-form" data-component="cart">

        {# Cart alerts #}

        {% if error.add %}
            <div class="alert alert-warning">
                {{ component('alert', {
                    'type': 'warning',
                    'message': 'our_components.cart.error_messages.' ~ error.add
                }) }}
            </div>
        {% endif %}
        {% for error in error.update %}
            <div class="alert alert-warning">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
        {% endfor %}
        {% if cart.items %}

            {# Cart header #}
            
            <div class="cart-row font-smallest mb-3 d-none d-md-block">
                <div class="row no-gutters">
                    <div class="cart-img-col-title">
                        <span class="js-cart-products-heading-plural" {% if cart.items_count == 1 %}style="display: none;"{% endif %}>{{ 'Productos' | translate }}</span>
                        <span class="js-cart-products-heading-singular" {% if cart.items_count > 1 %}style="display: none;"{% endif %}>{{ 'Producto' | translate }}</span>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4"></div>
                            <div class="cart-qty-col-title text-center ml-2">{{ 'Cantidad' | translate }}</div>
                            <div class="col-3 text-center ">{{ 'Precio' | translate }}</div>
                            <div class="col-3 text-center">{{ 'Subtotal' | translate }}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="js-ajax-cart-list">

                {# Cart items #}

                {% if cart.items %}
                  {% for item in cart.items %}
                    {% include "snipplets/cart-item-ajax.tpl" with {'cart_page': true} %}
                  {% endfor %}
                {% endif %}
            </div>
            <div class="row justify-content-between mt-4">
                <div class="col-md-3">
                    {% include "snipplets/shipping/cart-fulfillment.tpl" with {'cart_page': true} %}
                </div>
                <div class="col-md-3">
                    {% include "snipplets/cart-totals.tpl" with {'cart_page': true} %}
                </div>
            </div>
        {% else %}

            {#  Empty cart  #}

            {% if not error %}
                {{ component('alert', {
                    'type': 'info',
                    'message': ('El carrito de compras está vacío.' | translate),
                    'class': 'text-center',
                }) }}
            {% endif %}
        {% endif %}
        <div id="error-ajax-stock" class="alert alert-warning mb-3" style="display: none;"> 
            {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1 font-small">{{ "ver otros acá" | translate }}</a>
        </div>
    </form>
    <div id="store-curr" class="hidden">{{ cart.currency }}</div>
</div>

