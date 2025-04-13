{# Instagram feed that work as examples #}

<section class="section-instafeed-home section-home position-relative overflow-none py-2 py-md-5" data-store="home-instagram-feed">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-3 p-0 pl-md-3">
				<div class="instafeed-link instafeed-title mb-0">
					<div class="img-absolute-centered-vertically h-auto px-4 text-center">
						<h2 class="h4 mb-0">@{{ 'Instagram' | translate }}</h2>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div id="instafeed" class="row row-grid">
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
				</div>
			</div>
		</div>
	</div>
	{% if not params.preview %}
		<div class="placeholder-overlay transition-soft">
			<div class="placeholder-info">
				<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
				<div class="placeholder-description font-small-xs">
					{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Publicaciones de Instagram" | translate }}"</strong>
				</div>
				{% if not params.preview %}
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				{% endif %}
			</div>
		</div>
	{% endif %}
</section>