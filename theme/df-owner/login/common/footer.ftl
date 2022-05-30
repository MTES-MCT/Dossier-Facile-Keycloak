<#assign VUE_APP_MAIN_URL="https://www.dossierfacile.fr">
<#assign VUE_APP_DOCS_URL="https://docs.dossierfacile.fr">

 <style>
ul.fr-follow {
	 background-color: transparent;
	 display: inline-flex;
	 flex-direction: row;
	 justify-content: center;
	 list-style: none;
	 margin: 0;
	 padding: 0;
	 height: auto;
	 width: auto;
}
 ul.fr-follow .fr-btn {
	 background-color: white;
	 color: grey;
	 max-width: 1.5rem;
	 vertical-align: middle;
	 visibility: hidden;
}
 ul.fr-follow .fr-btn:before {
	 visibility: visible;
}
 ul.fr-follow li {
	 padding: 0 0.25rem 0 0.25rem;
}
 ul.fr-follow .fr-btn {
	 --icon-size: 1rem;
	 padding-left: 0.15rem;
}
 .fr-footer__brand-link {
	 background-image: none;
}
 .fr-follow a.fr-btn--tiktok:before {
	 content: "";
	 mask-image: url(${url.resourcesPath}/dsfr/dist/dsfr/icons/logo/fr--tiktok-fill.svg);
	 -webkit-mask-image: url(${url.resourcesPath}/dsfr/dist/dsfr/icons/logo/fr--tiktok-fill.svg);
	 --icon-size: 1.5rem;
	 background-color: currentColor;
	 display: inline-block;
	 flex: 0 0 auto;
	 height: var(--icon-size);
	 mask-size: 100% 100%;
	 vertical-align: middle;
	 width: var(--icon-size);
}

 </style>
  <footer class="fr-footer" role="contentinfo" id="footer" tabindex="-1">
    <div class="fr-container">
      <div class="fr-footer__body">
        <div class="fr-footer__brand">
          <p class="fr-logo">
            république
            <br />française
          </p>
          <a class="fr-footer__brand-link" href="https://beta.gouv.fr/">
            <img
              svg-inline
              src="${url.resourcesPath}/logo/logo-betagouvfr.svg"
              class="fr-responsive-img"
              aria-label="Accueil - beta.gouv.fr"
            />
          </a>
        </div>
        <div class="fr-footer__content ">
          <p class="fr-footer__content-desc">
            DossierFacile est propulsé par la
            <a
              href="https://www.ecologie.gouv.fr/direction-generale-lamenagement-du-logement-et-nature-dgaln"
              title="direction générale de l'aménagement, du logement et de la nature - Nouvelle fenêtre"
              target="_blank"
              rel="noreferrer noopener"
              >direction générale de l'aménagement, du logement et de la
              nature</a
            >. <br />Le code source est disponible en licence libre
          </p>
          <ul class="fr-footer__content-list">
            <li class="fr-footer__content-item">
              <a
                class="fr-footer__content-link"
                href="https://legifrance.gouv.fr"
                >legifrance.gouv.fr</a
              >
            </li>
            <li class="fr-footer__content-item">
              <a class="fr-footer__content-link" href="https://gouvernement.fr"
                >gouvernement.fr</a
              >
            </li>
            <li class="fr-footer__content-item">
              <a
                class="fr-footer__content-link"
                href="https://service-public.fr"
                >service-public.fr</a
              >
            </li>
            <li class="fr-footer__content-item">
              <a class="fr-footer__content-link" href="https://data.gouv.fr"
                >data.gouv.fr</a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="fr-footer__bottom">
        <ul class="fr-footer__bottom-list">
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              target="_blank"
              rel="noreferrer"
            href="https://beta.gouv.fr/">
              Les startups d'Etat
            </a>
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="${VUE_APP_MAIN_URL}/accessibilite`"
              title="${msg('accessibility-link')}"
              >${ msg('footer.accessibility') }</a
            >
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="${VUE_APP_MAIN_URL}/mentions-legales"
            >
              ${ msg('footer.legals') }
            </a>
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="${VUE_APP_MAIN_URL}/stats"
            >
              ${ msg('footer.statistics') }
            </a>
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="${VUE_APP_DOCS_URL}"
              target="_blank"
              rel="noreferrer"
              title="${msg('faq-link-title')}"
            >
              ${ msg('footer.faq') }
            </a>
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="https://partenaire.dossierfacile.fr"
              target="_blank"
              rel="noreferrer"
              title="${msg('footer.partner-link-title')}"
            >
              ${ msg('footer.partner') }
            </a>
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              target="_blank"
              rel="noreferrer"
              href="https://github.com/MTES-MCT/Dossier-Facile-Frontend"
            >
              ${ msg('footer.sources') }
            </a>
          </li>

          <li class="fr-footer__bottom-item">
            <ul class="fr-follow">
              <li>
                <a
                  class="fr-btn--twitter fr-btn"
                  title="twitter - ouvre une nouvelle fenêtre"
                  href="https://twitter.com/dossierfacile/"
                  target="_blank"
                  >twitter</a
                >
              </li>
              <li>
                <a
                  class="fr-btn--facebook fr-btn"
                  title="facebook - ouvre une nouvelle fenêtre"
                  href="https://www.facebook.com/DossierFacile.fr/"
                  target="_blank"
                  >instagram</a
                >
              </li>
              <li>
                <a
                  class="fr-btn--linkedin fr-btn"
                  lang="en"
                  title="linkedin - ouvre une nouvelle fenêtre"
                  href="https://www.linkedin.com/company/startup-d-etat-locatio/"
                  target="_blank"
                  >linkedin</a
                >
              </li>
              <li>
                <a
                  class="fr-btn--instagram fr-btn"
                  title="instagram - ouvre une nouvelle fenêtre"
                  href="https://www.instagram.com/dossierfacile/"
                  target="_blank"
                  >instagram</a
                >
              </li>
              <li>
                <a
                  class="fr-btn--tiktok fr-btn"
                  title="tiktok - ouvre une nouvelle fenêtre"
                  href="https://www.tiktok.com/@dossierfacile/"
                  target="_blank"
                  >tiktok</a
                >
              </li>
            </ul>
          </li>
        </ul>
        <div class="fr-footer__bottom-copy">
          <p>
            Sauf mention contraire, tous les contenus de ce site sont sous
            <a
              href="https://github.com/etalab/licence-ouverte/blob/master/LO.md"
              target="_blank"
              >licence etalab-2.0</a
            >
          </p>
        </div>
      </div>
    </div>
  </footer>
