{# /* Style tokens */ #}

:root {

  {#/*============================================================================
    #Colors
  ==============================================================================*/#}

  {#### Colors settings #}

  {# Main colors #}

  {% set main_background = settings.background_color %}
  {% set main_foreground = settings.text_color %}

  {% set accent_color = settings.accent_color %}

  {% set button_background = settings.button_background_color %}
  {% set button_foreground = settings.button_foreground_color %}
  
  {% set label_background = settings.label_background_color %}
  {% set label_foreground = settings.label_foreground_color %}

  {# Optional colors #}

  {% set addbar_background = settings.adbar_colors ? settings.adbar_background_color : main_background %}
  {% set addbar_foreground = settings.adbar_colors ? settings.adbar_foreground_color : main_foreground %}

  {% set header_background = settings.header_colors ? settings.header_background_color : main_background %}
  {% set header_foreground = settings.header_colors ? settings.header_foreground_color : main_foreground %}
  {% set header_badge_background = settings.header_colors ? settings.header_badge_background_color : main_background %}
  {% set header_badge_foreground = settings.header_colors ? settings.header_badge_foreground_color : main_foreground %}

  {% set nav_desktop_background = settings.desktop_nav_colors ? settings.desktop_nav_background_color : settings.header_colors ? settings.header_background_color : main_background %}
  {% set nav_desktop_foreground = settings.desktop_nav_colors ? settings.desktop_nav_foreground_color : settings.header_colors ? settings.header_foreground_color : main_foreground %}

  {% set header_featured_link_foreground = settings.featured_link_color ? settings.featured_link_foreground_color : header_foreground %}

  {% set topbar_background = settings.topbar_colors ? settings.topbar_background_color : main_background %}
  {% set topbar_foreground = settings.topbar_colors ? settings.topbar_foreground_color : main_foreground %}

  {% set footer_background = settings.footer_colors ? settings.footer_background_color : main_background %}
  {% set footer_foreground = settings.footer_colors ? settings.footer_foreground_color : main_foreground %}

  {% set main_categories_background = settings.main_categories_colors ? settings.main_categories_background_color : 'main_background' %}
  {% set main_categories_foreground = settings.main_categories_colors ? settings.main_categories_foreground_color : 'main_foreground' %}

  {% set brands_background = settings.brands_colors ? settings.brands_background_color : '' %}
  {% set brands_foreground = settings.brands_colors ? settings.brands_foreground_color : '' %}

  {% set featured_products_background = settings.featured_product_background_color %}
  {% set featured_products_foreground = settings.featured_product_foreground_color %}

  {% set new_products_background = settings.new_product_background_color %}
  {% set new_products_foreground = settings.new_product_foreground_color %}

  {% set sale_products_background = settings.sale_product_background_color %}
  {% set sale_products_foreground = settings.sale_product_foreground_color %}

  {% set promotion_products_background = settings.promotion_product_background_color %}
  {% set promotion_products_foreground = settings.promotion_product_foreground_color %}

  {% set best_seller_products_background = settings.best_seller_product_background_color %}
  {% set best_seller_products_foreground = settings.best_seller_product_foreground_color %}

  {% set newsletter_home_background = settings.home_news_background_color %}
  {% set newsletter_home_foreground = settings.home_news_foreground_color %}

  {% set newsletter_background = settings.news_colors ? settings.news_background_color : accent_color %}
  {% set newsletter_foreground = settings.news_colors ? settings.news_foreground_color : main_background %}

  {% set welcome_background = settings.welcome_colors ? settings.welcome_background_color : '' %}
  {% set welcome_foreground = settings.welcome_colors ? settings.welcome_foreground_color : '' %}

  {% set institutional_background = settings.institutional_colors ? settings.institutional_background_color : '' %}
  {% set institutional_foreground = settings.institutional_colors ? settings.institutional_foreground_color : '' %}

  {% set video_foreground = settings.video_color %}

  {% set banner_services_background = settings.banner_services_colors ? settings.banner_services_background_color : main_background %}
  {% set banner_services_foreground = settings.banner_services_colors ? settings.banner_services_foreground_color : main_foreground %}

  {#### CSS Colors #}

  {# Main colors #}

  --main-foreground: {{ main_foreground }};
  --main-background: {{ main_background }};

  --accent-color: {{ accent_color }};

  --button-background: {{ button_background }};
  --button-foreground: {{ button_foreground }};

  --label-background: {{ label_background }};
  --label-foreground: {{ label_foreground }};

  {# Optional colors #}

  --adbar-background: {{ addbar_background }};
  --adbar-foreground: {{ addbar_foreground }};

  --header-background: {{ header_background }};
  --header-foreground: {{ header_foreground }};
  --header-badge-background: {{ header_badge_background }};
  --header-badge-foreground: {{ header_badge_foreground }};
  --nav-desktop-background: {{ nav_desktop_background }};
  --nav-desktop-foreground: {{ nav_desktop_foreground }};
  --header-featured-link-foreground: {{ header_featured_link_foreground }};

  --topbar-background: {{ topbar_background }};
  --topbar-foreground: {{ topbar_foreground }};

  --footer-background: {{ footer_background }};
  --footer-foreground: {{ footer_foreground }};

  --main-categories-background: {{ main_categories_background }};
  --main-categories-foreground: {{ main_categories_foreground }};

  --brands-background: {{ brands_background }};
  --brands-foreground: {{ brands_foreground }};

  --featured-background: {{ featured_products_background }};
  --featured-foreground: {{ featured_products_foreground }};

  --new-background: {{ new_products_background }};
  --new-foreground: {{ new_products_foreground }};

  --sale-background: {{ sale_products_background }};
  --sale-foreground: {{ sale_products_foreground }};

  --promotion-background: {{ promotion_products_background }};
  --promotion-foreground: {{ promotion_products_foreground }};

  --best-seller-background: {{ best_seller_products_background }};
  --best-seller-foreground: {{ best_seller_products_foreground }};

  --newsletter-home-background: {{ newsletter_home_background }};
  --newsletter-home-foreground: {{ newsletter_home_foreground }};

  --newsletter-background: {{ newsletter_background }};
  --newsletter-foreground: {{ newsletter_foreground }};

  --welcome-background: {{ welcome_background }};
  --welcome-foreground: {{ welcome_foreground }};

  --institutional-background: {{ institutional_background }};
  --institutional-foreground: {{ institutional_foreground }};

  --video-foreground: {{ video_foreground }};

  --banner-services-background: {{ banner_services_background }};
  --banner-services-foreground: {{ banner_services_foreground }};

  {# Color shades #}

  {# Opacity hex levels #}

  {% set opacity_03 = '08' %}
  {% set opacity_05 = '0D' %}
  {% set opacity_08 = '14' %}
  {% set opacity_10 = '1A' %}
  {% set opacity_20 = '33' %}
  {% set opacity_30 = '4D' %}
  {% set opacity_40 = '66' %}
  {% set opacity_50 = '80' %}
  {% set opacity_60 = '99' %}
  {% set opacity_70 = 'B3' %}
  {% set opacity_80 = 'CC' %}
  {% set opacity_90 = 'E6' %}
  {% set opacity_95 = 'F2' %}

  --main-foreground-opacity-03: {{ main_foreground }}{{ opacity_03 }};
  --main-foreground-opacity-05: {{ main_foreground }}{{ opacity_05 }};
  --main-foreground-opacity-08: {{ main_foreground }}{{ opacity_08 }};
  --main-foreground-opacity-10: {{ main_foreground }}{{ opacity_10 }};
  --main-foreground-opacity-20: {{ main_foreground }}{{ opacity_20 }};
  --main-foreground-opacity-30: {{ main_foreground }}{{ opacity_30 }};
  --main-foreground-opacity-40: {{ main_foreground }}{{ opacity_40 }};
  --main-foreground-opacity-50: {{ main_foreground }}{{ opacity_50 }};
  --main-foreground-opacity-60: {{ main_foreground }}{{ opacity_60 }};

  --main-background-opacity-30: {{ main_background }}{{ opacity_30 }};
  --main-background-opacity-40: {{ main_background }}{{ opacity_40 }};
  --main-background-opacity-50: {{ main_background }}{{ opacity_50 }};
  --main-background-opacity-80: {{ main_background }}{{ opacity_80 }};
  --main-background-opacity-90: {{ main_background }}{{ opacity_90 }};

  --header-foreground-opacity-10: {{ header_foreground }}{{ opacity_10 }};
  --header-foreground-opacity-20: {{ header_foreground }}{{ opacity_20 }};
  --header-foreground-opacity-50: {{ header_foreground }}{{ opacity_50 }};

  --nav-desktop-foreground-opacity-10: {{ nav_desktop_foreground }}{{ opacity_10 }};
  --header-badge-foreground-opacity-20: {{ header_badge_foreground }}{{ opacity_20 }};

  --adbar-foreground-opacity-10: {{ addbar_foreground }}{{ opacity_10 }};

  --main-categories-foreground-opacity-20: {{ main_categories_foreground }}{{ opacity_20 }};

  --brands-foreground-opacity-10: {{ brands_foreground }}{{ opacity_10 }};

  --welcome-foreground-opacity-90: {{ welcome_foreground }}{{ opacity_90 }};

  --institutional-foreground-opacity-90: {{ institutional_foreground }}{{ opacity_90 }};

  --news-home-foreground-opacity-80: {{ newsletter_home_foreground }}{{ opacity_80 }};

  --news-foreground-opacity-30: {{ newsletter_foreground }}{{ opacity_30 }};
  --news-foreground-opacity-50: {{ newsletter_foreground }}{{ opacity_50 }};

  --footer-foreground-opacity-10: {{ footer_foreground }}{{ opacity_10 }};
  --footer-foreground-opacity-20: {{ footer_foreground }}{{ opacity_20 }};
  --footer-foreground-opacity-50: {{ footer_foreground }}{{ opacity_50 }};
  --footer-foreground-opacity-60: {{ footer_foreground }}{{ opacity_60 }};
  --footer-foreground-opacity-80: {{ footer_foreground }}{{ opacity_80 }};

  {# Alert colors CSS #}

  --success: #4bb98c;
  --danger: #dd7774;
  --warning: #dc8f38;

  {#/*============================================================================
    #Fonts
  ==============================================================================*/#}

  {# Font families #}

  --heading-font: {{ settings.font_headings | raw }};
  --body-font: {{ settings.font_rest | raw }};

  {# Font sizes #}

  --h1: 28px;
  --h1-huge: 30px;
  --h1-huge-md: 40px;
  --h2: 24px;
  --h3: 20px;
  --h4: 18px;
  --h5: 16px;
  --h6: 14px;
 
  --font-big: 16px;
  --font-base: 14px;
  --font-small: 12px;
  --font-smallest: 10px;

  {#/*============================================================================
    #Spacing
  ==============================================================================*/#}

  {# Gutters #}

  --gutter: 15px;
  --gutter-container: 15px;
  --gutter-container-md: 80px;
  --gutter-negative: calc(var(--gutter) * -1);
  --gutter-half: calc(var(--gutter) / 2);
  --gutter-half-negative: calc(var(--gutter) * -1 / 2);
  --gutter-double: calc(var(--gutter) * 2);

  {#/*============================================================================
    #Misc
  ==============================================================================*/#}

  {# Borders #}

  --border-radius: 4px;
  --border-radius-full: 100%;
  --border-radius-half: calc(var(--border-radius) / 2);
  --border-radius-quarter: calc(var(--border-radius) / 4);
  --border-solid: 1px solid;
  --border-dashed: 1px dashed;

  {# Shadows #}

  --shadow-distance: 0 0 5px;

  {# Sections #}

  --section-distance: 30px;
  --section-negative-distance: calc(var(--section-distance) * -1);

}