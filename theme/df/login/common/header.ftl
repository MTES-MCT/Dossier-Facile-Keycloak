<#assign VUE_APP_DOCS_URL="https://docs.dossierfacile.fr">

<style>
 @media all and (max-width: 768px) {
	 .fr-header__service-tagline {
		 display: none;
	}
}
 @media all and (min-width: 992px) {
	 .fr-header__menu-links-hack {
		 display: none;
	}
}
 .fr-header i {
	 padding-right: 0.25rem;
	 min-width: 24px;
	 font-size: 24px;
}
 .fr-header .fr-links-group li {
	 margin-right: 0;
	 margin-left: 0;
}
 .fr-header .fr-links-group li .fr-btn {
	 margin-right: 0;
}
.fr-header__menu-links-hack li {
    margin : 0.5rem;
}
  </style>
  <header role="banner" class="fr-header">
    <div class="fr-header__body">
      <div class="fr-container">
        <div class="fr-header__body-row">
          <div class="fr-header__brand fr-enlarge-link">
            <div class="fr-header__brand-top">
              <div class="fr-header__logo">
                <p class="fr-logo">
                  République<br />
                  française
                </p>
              </div>
              <div class="fr-header__navbar">
                <button
                  class="fr-btn--menu fr-btn"
                  data-fr-opened="false"
                  aria-controls="modal-dc"
                  aria-haspopup="menu"
                  title="Menu"
                >
                  Menu
                </button>
              </div>
            </div>
            <div class="fr-header__service">
              <a href="https://${properties.appMainUrl}" title="Dossier Facile - Accueil">
                <p class="fr-header__service-title">
                  <span style="font-weight: normal">Dossier</span>Facile
                </p>
              </a>
              <p class="fr-header__service-tagline">
                Le dossier de location numérique de l'État
              </p>
            </div>
          </div>

          <div class="fr-header__tools">
            <div class="fr-header__tools-links">
              <ul class="fr-links-group">
                <li>
                  <a class="fr-btn fr-btn--sm" href="https://${properties.appOwnerUrl}">
                    <i class="ri-community-line" aria-hidden="true"></i>
                    ${msg('header.owner') }
                  </a>
                </li>
                <li>
                  <a
                    class="fr-btn fr-btn--sm"
                    href="https://partenaire.dossierfacile.fr"
                    rel="noreferrer"
                    :title="$msg('partner-link-title')"
                  >
                    <i class="ri-home-heart-line" aria-hidden="true"></i>
                    ${msg('header.partner') }
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Navigation principale -->
    <div class="fr-header__menu fr-modal" id="modal-dc">
      <div class="fr-container">
        <button class="fr-link--close fr-link" aria-controls="modal-dc">
          Fermer
        </button>
        <div class="fr-header__menu-links" style="display: none"></div>
        <div class="fr-header__menu-links-hack">
          <ul class="fr-links-group">

            <li>
              <button class="fr-btn fr-btn--secondary unbox fr-ml-3 fr-btn--sm" onClick="location.href = 'https://${properties.appOwnerUrl}">
                <i class="ri-community-line" aria-hidden="true"></i>
                ${msg('header.owner') }
              </button>
            </li>
            <li>
              <button class="fr-btn fr-btn--secondary unbox fr-btn--sm"
                onClick="location.href = 'https://partenaire.dossierfacile.fr">
                  <i class="ri-home-heart-line" aria-hidden="true"></i>
                  ${msg('header.partner') }
              </button>
            </li>
          </ul>
        </div>
        <nav
          class="fr-nav"
          id="navigation-832"
          role="navigation"
          aria-label="Menu principal"
        >
          <#include "./menu.ftl">
        </nav>
      </div>
    </div>
  </header>
