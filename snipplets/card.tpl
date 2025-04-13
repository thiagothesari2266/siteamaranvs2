{# /*============================================================================
  #Card
==============================================================================*/

#Head
    // Block - card_head
#Body
    // Block - card_body
#Footer
    // Block - card_footer

#}


<div class="{% if card_collapse %}js-card-collapse {% endif %}card {{ card_custom_class }} {% if card_active %}active{% endif %}">
    <div class="{% if card_collapse %}js-card-header-collapse card-header-collapse {% endif %}card-header">
        {% block card_head %}{% endblock %}
        {% if card_collapse %}
            <span class="js-card-collapse-toggle card-collapse-toggle {% if card_active %}active{% endif %}">
                <svg class="js-card-collapse-icon icon-inline icon-w-14 icon-lg"><use xlink:href="#plus"/></svg>
                <svg class="js-card-collapse-icon icon-inline icon-w-14 icon-lg" style="display: none;"><use xlink:href="#minus"/></svg>
            </span>
        {% endif %}
    </div>
    <div class="card-body {{ card_custom_body_class }}">
        {% block card_body %}{% endblock %}
    </div>
    {% if card_footer %}
        <div class="card-footer {{ card_custom_footer_class }}">
            {% block card_foot %}{% endblock %}
        </div>
    {% endif %}
</div>