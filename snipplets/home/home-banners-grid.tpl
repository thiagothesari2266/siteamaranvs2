{% set banner = banner | default(false) %}
{% set banner_promotional = banner_promotional | default(false) %}
{% set banner_news = banner_news | default(false) %}
{% set module = module | default(false) %}

{% set theme_editor = params.preview %}

{% if banner %}
    {% set has_banners = settings.banner and settings.banner is not empty %}
    {% set has_mobile_banners = settings.toggle_banner_mobile and settings.banner_mobile and settings.banner_mobile is not empty %}
    {% set section_banner = mobile ? settings.banner_mobile : settings.banner %}
    {% set section_title = settings.banner_title %}
    {% set section_slider = settings.banner_format_mobile == 'slider' or settings.banner_format_desktop == 'slider' %}
    {% set section_slider_both = settings.banner_format_mobile == 'slider' and settings.banner_format_desktop == 'slider' %}
    {% set section_slider_mobile_only = settings.banner_format_mobile == 'slider' and settings.banner_format_desktop == 'grid' %}
    {% set section_slider_desktop_only = settings.banner_format_desktop == 'slider' and settings.banner_format_mobile == 'grid' %}
    {% set section_slider_desktop = settings.banner_format_desktop == 'slider' %}
    {% set section_id = mobile ? 'banners-mobile' : 'banners' %}
    {% set section_columns_desktop_4 = settings.banner_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_same_size %}
    {% set section_align_center = settings.banner_align == 'center' %}
    {% set section_without_margins = settings.banner_without_margins %}
    {% set section_text_outside = settings.banner_text_outside %}
{% endif %}
{% if banner_promotional %}
    {% set has_banners = settings.banner_promotional and settings.banner_promotional is not empty %}
    {% set has_mobile_banners = settings.toggle_banner_promotional_mobile and settings.banner_promotional_mobile and settings.banner_promotional_mobile is not empty %}
    {% set section_banner = mobile ? settings.banner_promotional_mobile : settings.banner_promotional %}
    {% set section_title = settings.banner_promotional_title %}
    {% set section_slider = settings.banner_promotional_format_mobile == 'slider' or settings.banner_promotional_format_desktop == 'slider' %}
    {% set section_slider_both = settings.banner_promotional_format_mobile == 'slider' and settings.banner_promotional_format_desktop == 'slider' %}
    {% set section_slider_mobile_only = settings.banner_promotional_format_mobile == 'slider' and settings.banner_promotional_format_desktop == 'grid' %}
    {% set section_slider_desktop_only = settings.banner_promotional_format_desktop == 'slider' and settings.banner_promotional_format_mobile == 'grid' %}
    {% set section_slider_desktop = settings.banner_promotional_format_desktop == 'slider' %}
    {% set section_id = mobile ? 'banners-promotional-mobile' : 'banners-promotional' %}
    {% set section_columns_desktop_4 = settings.banner_promotional_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_promotional_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_promotional_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_promotional_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_promotional_same_size %}
    {% set section_align_center = settings.banner_promotional_align == 'center' %}
    {% set section_without_margins = settings.banner_promotional_without_margins %}
    {% set section_text_outside = settings.banner_promotional_text_outside %}
{% endif %}
{% if banner_news %}
    {% set has_banners = settings.banner_news and settings.banner_news is not empty %}
    {% set has_mobile_banners = settings.toggle_banner_news_mobile and settings.banner_news_mobile and settings.banner_news_mobile is not empty %}
    {% set section_banner = mobile ? settings.banner_news_mobile : settings.banner_news %}
    {% set section_title = settings.banner_news_title %}
    {% set section_slider = settings.banner_news_format_mobile == 'slider' or settings.banner_news_format_desktop == 'slider' %}
    {% set section_slider_both = settings.banner_news_format_mobile == 'slider' and settings.banner_news_format_desktop == 'slider' %}
    {% set section_slider_mobile_only = settings.banner_news_format_mobile == 'slider' and settings.banner_news_format_desktop == 'grid' %}
    {% set section_slider_desktop_only = settings.banner_news_format_desktop == 'slider' and settings.banner_news_format_mobile == 'grid' %}
    {% set section_slider_desktop = settings.banner_news_format_desktop == 'slider' %}
    {% set section_id = mobile ? 'banners-news-mobile' : 'banners-news' %}
    {% set section_columns_desktop_4 = settings.banner_news_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_news_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_news_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_news_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_news_same_size %}
    {% set section_align_center = settings.banner_news_align == 'center' %}
    {% set section_without_margins = settings.banner_news_without_margins %}
    {% set section_text_outside = settings.banner_news_text_outside %}
{% endif %}
{% if module %}
    {% set section_banner = settings.module %}
    {% set section_slider = settings.module_slider %}
    {% set section_id = 'modules' %}
    {% set section_same_size = settings.module_same_size %}
    {% set section_text_outside = true %}
{% endif %}

{% set visibility_classes = 
    has_banners and has_mobile_banners ? (mobile ? 'd-md-none' : 'd-none d-md-block') 
    : not has_banners and has_mobile_banners and not mobile ? 'd-none' 
%}

{% set banner_classes = module and not section_slider ? 'mb-md-5 pb-md-3' : not module and section_without_margins ? 'm-0' %}

<div class="js-{{ section_id }}{% if not module %} {{ visibility_classes }}{% endif %}">
    <div class="js-banner-container container p-0 px-md-3 position-relative">
        {% if not module %}
            <h2 class="js-banners-section-title js-{{ section_id }}-title section-title text-center h3 mb-4"{% if not section_title %} style="display:none;"{% endif %}>{{ section_title }}</h2>
        {% endif %}
    {% if section_without_margins %}
    </div>
    <div class="js-banner-container container{% if not module %}-fluid{% endif %} p-0 overflow-none">
    {% endif %}

        {% if section_slider %}
            {% set section_slider_classes = section_slider_both ? 'swiper-products-slider flex-nowrap' : section_slider_mobile_only ? 'swiper-mobile-only flex-nowrap flex-md-wrap' : section_slider_desktop_only ? 'swiper-desktop-only flex-wrap flex-md-nowrap ml-md-0' : module and section_slider ? 'swiper-products-slider' %}
            <div class="js-swiper-{{ section_id }} swiper-container">
                <div class="js-banner-row js-banner-wrapper swiper-wrapper {{ section_slider_classes }} {% if not module %}row {% if section_without_margins %}no-gutters{% else %}row-grid{% endif %}{% endif %}">
        {% elseif not module or (module and theme_editor) %}
            <div class="js-banner-row row {% if section_without_margins or module %}no-gutters{% else %}px-2{% endif %}">
        {% endif %}

        {% for slide in section_banner %}

            {% set has_banner_text = slide.title or slide.description or slide.button %}

            {% if not module or (module and (section_slider or theme_editor)) %}
                <div class="js-banner {% if section_slider %}swiper-slide {% endif %}col-grid {% if section_columns_desktop_4 %}col-md-3{% elseif section_columns_desktop_3 %}col-md-4{% elseif section_columns_desktop_2 %}col-md-6{% elseif section_columns_desktop_1 %}col-md-12{% endif %}">
            {% endif %}
                <div class="js-textbanner textbanner {{ banner_classes }}">
                    {% if slide.link %}
                        <a href="{{ slide.link | setting_url }}" class="textbanner-link" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
                    {% endif %}
                    {% if module %}
                            <div class="row no-gutters align-items-center">
                        {% endif %}
                    <div class="js-textbanner-image-container textbanner-image{% if not section_same_size %} p-0{% endif %}{% if module %} col-md-6{% if section_same_size %} textbanner-image-md{% endif %}{% else %}{% if has_banner_text and not section_text_outside %} overlay{% endif %}{% endif %} overflow-none">
                        <img {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %} src="{% if not section_slider %}{{ 'images/empty-placeholder.png' | static_url }}{% endif %}" data-sizes="auto" data-expand="-10" data-srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="js-textbanner-image textbanner-image-effect {% if section_same_size %}textbanner-image-background{% else %}img-fluid d-block w-100{% endif %} lazyautosizes lazyload fade-in" {% if slide.title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                        <div class="placeholder-fade placeholder-banner"></div>
                    {% if section_text_outside %}
                        </div>
                    {% endif %}
                    {% if has_banner_text %}
                        <div class="js-textbanner-text textbanner-text{% if module %} col-md-6 px-3 px-md-5 text-center {% if not section_slider and loop.index is even %}order-md-first{% endif %}{% endif %}{% if section_align_center %} text-center{% endif %} {% if not section_text_outside %} over-image{% endif %} {% if not section_text_outside and slide.color == 'light' %}over-image-invert{% endif %}">
                            {% if slide.title %}
                                <h3 class="{% if section_columns_desktop_4 %}h2-md{% else %}h1-md{% endif %} mb-2 {% if section_columns_desktop_1 %} w-md-50 mx-auto{% endif %} {% if module %}px-md-3{% endif %}">{{ slide.title }}</h3>
                            {% endif %}
                            {% if slide.description %}
                                <div class="textbanner-paragraph font-small font-md-body{% if slide.button and slide.link %} mb-2{% endif %} {% if section_columns_desktop_1 %} w-md-50 mx-auto{% endif %} {% if module %}line-height-initial px-md-3{% endif %}">{{ slide.description }}</div>
                            {% endif %}
                            {% if slide.button and slide.link %}
                                <div class="btn btn-primary btn-small mt-1 mt-md-2">{{ slide.button }}</div>
                            {% endif %}
                        </div>
                    {% endif %}
                    {% if not section_text_outside or module %}
                        </div>
                    {% endif %}
                    {% if slide.link %}
                        </a>
                    {% endif %}
                </div>
            {% if not module or (module and (section_slider or theme_editor)) %}
                </div>
            {% endif %}
        {% endfor %}
        {% if section_slider %}
                </div>
            </div>
            {% if (section_banner and section_banner is not empty and (not module and section_slider_desktop) or (module and section_slider)) or theme_editor %}
                <div class="js-swiper-{{ section_id }}-prev swiper-button-prev d-none d-md-block svg-icon-text {% if section_without_margins %}swiper-button-opacity{% else %}swiper-button-outside{% endif %}">
                    <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
                </div>
                <div class="js-swiper-{{ section_id }}-next swiper-button-next d-none d-md-block svg-icon-text {% if section_without_margins %}swiper-button-opacity{% else %}swiper-button-outside{% endif %}">
                    <svg class="icon-inline icon-lg"><use xlink:href="#chevron"/></svg>
                </div>
            {% endif %}
        {% else %}
            </div>
        {% endif %}
    </div>
</div>
