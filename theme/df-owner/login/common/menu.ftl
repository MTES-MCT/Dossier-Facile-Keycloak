<style>
.badge {
	 position: absolute;
	 top: -2px;
	 right: 0px;
	 padding: 5px 10px;
	 border-radius: 50%;
	 background: red;
	 color: white;
	 z-index: 1;
}
 .lang {
	 box-shadow: none;
}
 .fr-nav__item {
	 position: relative;
}
 .fr-nav__item .fr-nav__link[aria-current] .fr-tag {
	 color: var(--text-action-high-blue-france) !important;
}
 @media all and (min-width: 768px) {
	 .fr-nav__item .tag-container {
		 padding-top: 0.75rem;
		 padding-bottom: 0.4rem;
	}
}
 @media all and (max-width: 768px) {
	 .fr-nav__item .tag-container .fr-tag {
		 min-height: inherit;
		 padding: 0;
		 background-color: transparent;
		 color: inherit;
		 font-size: inherit;
	}
}
 .fr-nav__item a.fr-external-link::after {
	 content: "";
}
 @media all and (min-width: 992px) {
	 .fr-nav__list > li:nth-last-child(2) {
		 margin-left: auto;
	}
}
 .warn {
	 background-color: #fdf2f3;
}
 .warn a {
	 color: var(--error);
}
 span.material-icons, span.material-icons-outlined {
	 padding-right: 0.25rem;
}
 @media all and (max-width: 768px) {
	 span.material-icons.contact,span.material-icons-outlined.contact {
		 display: none;
	}
}
 fr-breadcrumb {
	 margin: 0;
}
</style>
  <ul class="fr-nav__list">
    <li class="fr-nav__item">
      <a href="https://www.dossierfacile.fr/information" class="fr-nav__link">
        ${msg('menu.information') }
      </a>
    </li>

    <li class="fr-nav__item">
      <a href="https://www.dossierfacile.fr/blog" class="fr-nav__link">
        ${msg('menu.blog') }
      </a>
    </li>
    <li class="fr-nav__item">
      <a
        href="https://docs.dossierfacile.fr"
        class="fr-nav__link fr-external-link"
        target="_blank"
        rel="noreferrer"
      >
        ${msg('menu.help') }
      </a>
    </li>
    <li class="fr-nav__item">
      <a
        href="https://www.dossierfacile.fr/contact"
        class="fr-nav__link tag-container"
      >
        <div class="fr-tag">
          <span class="contact material-icons" aria-hidden="true">mail_outline</span>
          ${msg('menu.contact-us') }
        </div>
      </a>
    </li>
    <li class="fr-nav__item">
      <button
        class="fr-nav__link fr-btn fr-ml-3 fr-btn--secondary fr-btn--sm lang blue"
        onClick="changeLocale();"
      >
        <span id="language_switch">English version</span>
      </button>
    </li>
  </ul>