<style>
 .fr-nav__item {
	 position: relative;
}
 .fr-nav__item .fr-nav__link[aria-current] {
	 color: var(--text-action-high-blue-france) !important;
}
 @media all and (min-width: 768px) {
	 .fr-nav__item {
		 padding-top: 0.75rem;
		 padding-bottom: 0.4rem;
	}
}
 @media all and (max-width: 768px) {
	 .fr-nav__item {
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
 .warn a {
	 color: var(--error);
}
 i.contact {
	 padding-right: 0.25rem;
	 font-size: 18px;
}
 @media all and (max-width: 768px) {
	 i.contact {
		 display: none;
	}
}
.contact-link {
  display: flex;
  align-items: center;
}
</style>
  <ul class="fr-nav__list">
    <li class="fr-nav__item fr-mr-auto">
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
        class="fr-nav__link contact-link"
      >
        <i class="contact ri-mail-line" aria-hidden="true"></i>
        ${msg('menu.contact-us') }
      </a>
    </li>
    <li class="fr-translate fr-nav__item">
      <button class="fr-translate__btn fr-nav__link fr-mb-0" id="language_switch" aria-controls="select-language" aria-expanded="false" title="Sélectionner une langue">
      </button>
      <div class="fr-collapse fr-translate__menu fr-menu" id="select-language">
        <ul class="fr-menu__list">
          <li>
            <a class="fr-translate__language fr-nav__link"
               id="language-fr" hreflang="fr" lang="fr"
               href="#" onClick="changeLocale();">FR - Français</a>
          </li>
          <li>
            <a class="fr-translate__language fr-nav__link"
               id="language-en" hreflang="en" lang="en"
               href="#" onClick="changeLocale();">EN - English</a>
          </li>
        </ul>
      </div>
    </li>
  </ul>