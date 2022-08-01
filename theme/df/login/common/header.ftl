<#assign VUE_APP_DOCS_URL="https://docs.dossierfacile.fr">

<style>
.logo {
	 width: 290px;
	 max-width: 290px;
}

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
 span.material-icons, span.material-icons-outlined {
	 padding-right: 0.25rem;
	 min-width: 24px;
}
 .fr-header .fr-links-group li {
	 margin-right: 0;
	 margin-left: 0;
}
 .fr-header .fr-links-group li .fr-btn {
	 margin-right: 0;
}
 @media all and (max-width: 768px) {
	 .fr-header .fr-links-group li {
		 border-bottom: 1px;
		 border-bottom-style: solid;
		 border-bottom-color: var(--border-default-grey);
	}
}
 @media all and (min-width: 768px) {
	 .fr-header .fr-links-group > li:last-child, .fr-header .fr-links-group li:nth-last-child(2) {
		 border-left: 1px;
		 border-left-style: solid;
	}
}
 .fr-header .fr-links-group > li:first-child {
	 border-left-style: none !important;
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
              <a href="${properties.appMainUrl}" title="Dossier Facile - Accueil">
                <p class="fr-header__service-title">
                  <img
                    class="logo"
                    src="${url.resourcesPath}/logo/logo_dossierfacile.svg"
                    alt="Dossier Facile"
                  />
                </p>
              </a>
            </div>
          </div>

          <div class="fr-header__tools">
            <div class="fr-header__tools-links">
              <ul class="fr-links-group">
                <li>
                  <button class="fr-btn fr-ml-3 fr-btn--secondary unbox fr-btn--sm"
                    onclick="location.href = '${properties.appTenantUrl}/login';"
                  >
                    <span class="material-icons-outlined" aria-hidden="true">
                      account_circle
                    </span>
                    ${msg('header.signup') }
                  </button>
                </li>
                <li>
                  <button class="fr-btn fr-btn--sm" onclick="location.href = '${properties.appOwnerUrl}';">
                    <span class="material-icons" aria-hidden="true"
                      >apartment</span
                    >
                    ${msg('header.owner') }
                  </button>
                </li>
                <li>
                  <button class="fr-btn fr-btn--sm">
                    <a
                      class="fr-external-link"
                      href="https://partenaire.dossierfacile.fr"
                      target="_blank"
                      rel="noreferrer"
                      :title="$msg('partner-link-title')"
                    >
                      ${msg('header.partner') }
                    </a>
                  </button>
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
              <button
                class="fr-btn fr-ml-3 fr-btn--secondary unbox fr-btn--sm"
                onClick="location.href = '${properties.appTenantUrl}/account';"
              >
                <span class="material-icons-outlined" aria-hidden="true">
                  account_circle
                </span>
                ${msg('header.signup') }
              </button>
            </li>

            <li>
              <button class="fr-btn fr-btn--secondary unbox fr-ml-3 fr-btn--sm" onClick="location.href = '${properties.appOwnerUrl}">
                <span class="material-icons" aria-hidden="true">apartment</span>
                ${msg('header.owner') }
              </button>
            </li>
            <li>
              <button class="fr-btn fr-btn--secondary unbox fr-btn--sm">
                <a
                  class="fr-external-link"
                  href="https://partenaire.dossierfacile.fr"
                  target="_blank"
                  rel="noreferrer"
                  :title="$msg('partner-link-title')"
                >
                  <span class="material-icons" aria-hidden="true"> </span>
                  ${msg('header.partner') }
                </a>
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