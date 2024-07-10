<#assign VUE_APP_DOCS_URL="https://docs.dossierfacile.fr">

 <style>
 .fr-footer__brand-link {
	 background-image: none;
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
              <a class="fr-footer__content-link"
                 title="legifrance.gouv.fr - nouvelle fenêtre"
                 rel="noreferrer noopener"
                 target="_blank"
                 href="https://www.legifrance.gouv.fr/">legifrance.gouv.fr</a>
            </li>
            <li class="fr-footer__content-item">
              <a class="fr-footer__content-link"
                 title="info.gouv.fr - nouvelle fenêtre"
                 rel="noreferrer noopener"
                 target="_blank"
                 href="https://www.info.gouv.fr/">info.gouv.fr</a>
            </li>
            <li class="fr-footer__content-item">
              <a class="fr-footer__content-link"
                 title="service-public.fr - nouvelle fenêtre"
                 rel="noreferrer noopener"
                 target="_blank"
                 href="https://service-public.fr">service-public.fr</a>
            </li>
            <li class="fr-footer__content-item">
              <a class="fr-footer__content-link"
                 title="data.gouv.fr - nouvelle fenêtre"
                 rel="noreferrer noopener"
                 target="_blank"
                 href="https://data.gouv.fr">data.gouv.fr</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="fr-footer__bottom">
        <ul class="fr-footer__bottom-list">
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="https://${properties.appMainUrl}/plan-du-site">
              ${ msg('footer.sitemap') }
            </a>
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="https://${properties.appMainUrl}/accessibilite"
              title="https://${msg('accessibility-link')}"
              >${ msg('footer.accessibility') }</a
            >
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="https://${properties.appMainUrl}/mentions-legales"
            >
              ${ msg('footer.legals') }
            </a>
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="https://${properties.appMainUrl}/politique-de-confidentialite"
            >
              ${ msg('footer.privacy-policy') }
            </a>
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="https://${properties.appMainUrl}/cgu"
            >
              ${ msg('footer.cgu') }
            </a>
          </li>
          <li class="fr-footer__bottom-item">
            <a
              class="fr-footer__bottom-link"
              href="https://${properties.appMainUrl}/stats"
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
    <div class="fr-follow">
      <div class="fr-container">
        <div class="fr-grid-row">
          <div class="fr-col-12">
            <div class="fr-follow__social">
              <h2 class="fr-h5">Suivez-nous sur les réseaux sociaux</h2>
              <ul class="fr-btns-group">
                <li>
                  <a
                          class="fr-btn--twitter fr-btn"
                          title="Suivre Dossier facile sur twitter - Ouvre une nouvelle fenêtre"
                          href="https://twitter.com/dossierfacile/"
                          target="_blank"
                  >
                    Suivre Dossier facile sur twitter
                  </a>
                </li>
                <li>
                  <a
                          class="fr-btn--facebook fr-btn"
                          title="Suivre Dossier facile sur facebook - Ouvre une nouvelle fenêtre"
                          href="https://www.facebook.com/DossierFacile.fr/"
                          target="_blank"
                  >
                    Suivre Dossier facile sur facebook
                  </a>
                </li>
                <li>
                  <a
                          class="fr-btn--linkedin fr-btn"
                          lang="en"
                          title="Suivre Dossier facile sur linkedin - Ouvre une nouvelle fenêtre"
                          href="https://www.linkedin.com/company/startup-d-etat-locatio/"
                          target="_blank"
                  >
                    Suivre Dossier facile sur linkedin
                  </a>
                </li>
                <li>
                  <a
                          class="fr-btn--instagram fr-btn"
                          title="Suivre Dossier facile sur instagram - Ouvre une nouvelle fenêtre"
                          href="https://www.instagram.com/dossierfacile/"
                          target="_blank"
                  >
                    Suivre Dossier facile sur instagram
                  </a>
                </li>
                <li>
                  <a
                          class="fr-btn--tiktok fr-btn"
                          title="Suivre Dossier facile sur tiktok - Ouvre une nouvelle fenêtre"
                          href="https://www.tiktok.com/@dossierfacile/"
                          target="_blank"
                  >
                    Suivre Dossier facile sur tiktok
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>