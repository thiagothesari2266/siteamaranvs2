{% if home_main_product %}
	{% set has_multiple_slides = product.images_count > 1 %}
{% else %}
	{% set has_multiple_slides = product.images_count > 1 or product.video_url %}
{% endif %}

<div class="row" data-store="product-image-{{ product.id }}"> 
	{% if has_multiple_slides %}
		<div class="{% if home_main_product %}d-none d-md-block{% else %} order-last order-md-0{% endif %} col-md-auto pr-md-0 mt-3 mt-md-0">
			<div class="product-thumbs-container position-relative">
				<div class="text-center d-none d-md-block">
					<div class="js-swiper-product-thumbs-prev swiper-button-prev swiper-product-thumb-control  svg-icon-text">
						<svg class="icon-inline icon-lg icon-flip-vertical"><use xlink:href="#chevron-down"/></svg>
					</div>
				</div>
				<div class="js-swiper-product-thumbs swiper-product-thumb"> 
					<div class="swiper-wrapper">
						{% for image in product.images %}
							<div class="swiper-slide w-auto">
								{% include 'snipplets/product/product-image-thumb.tpl' %}
							</div>
						{% endfor %}
						{% if not home_main_product %}
							{# Video thumb #}
							<div class="swiper-slide w-auto">
								{% include 'snipplets/product/product-video.tpl' with {thumb: true} %}
							</div>
						{% endif %}
					</div>
				</div>
				<div class="text-center d-none d-md-block">
					<div class="js-swiper-product-thumbs-next swiper-button-next swiper-product-thumb-control  svg-icon-text">
						<svg class="icon-inline icon-lg"><use xlink:href="#chevron-down"/></svg>
					</div>
				</div>
			</div>
		</div>
	{% endif %}
	{% if product.images_count > 0 %}
		<div class="col-md {% if not has_multiple_slides %}product-with-one-image pr-md-3{% else %}p-0 px-md-3{% endif %}">
			<div class="js-swiper-product swiper-container product-detail-slider" style="visibility:hidden; height:0;" data-product-images-amount="{{ product.images_count }}">
                {% include 'snipplets/labels.tpl' with {product_detail: true, labels_floating: true} %}
				<div class="swiper-wrapper">
					{% for image in product.images %}
					 <div class="js-product-slide w-100 swiper-slide product-slide{% if home_main_product %}-small{% endif %} slider-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}">
						{% if home_main_product %}
							<div class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
						{% else %}
							<a href="{{ image | product_image_url('original') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
						{% endif %}
							<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w, {{  image | product_image_url('original') }} 1024w' data-sizes="auto" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
							<img src="{{ image | product_image_url('tiny') }}" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
						{% if home_main_product %}
							</div>
						{% else %}
							</a>
						{% endif %}
					</div>
					{% endfor %}
					{% if not home_main_product %}
						{% include 'snipplets/product/product-video.tpl' %}
					{% endif %}
				</div>
			</div>
			{% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
			{% if has_multiple_slides and home_main_product %}
				<div class="js-swiper-product-pagination swiper-pagination position-relative pt-3 pb-1 d-md-none"></div>
			{% endif %}
		</div>
	{% endif %}
</div>