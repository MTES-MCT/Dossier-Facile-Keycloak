<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}" lang="fr" data-fr-theme="light">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <link rel="stylesheet" href="${url.resourcesPath}/dsfr/dist/dsfr/dsfr.min.css">
    <link rel="stylesheet" href="${url.resourcesPath}/css/fc.094909.css">
    <link rel="stylesheet" href="${url.resourcesPath}/css/global.1249.css">
    <script>
      launchAnalytics = function() {
        var head = document.getElementsByTagName('head')[0];
        var js = document.createElement("script");
        js.type = "text/javascript";
        js.id="gtag"
        js.src = "https://www.googletagmanager.com/gtag/js?id=UA-50823626-2"
        head.appendChild(js);

        var script = document.querySelector('#gtag');
        script.addEventListener('load', function() {
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
          gtag('config', {
            id: "UA-50823626-2",
            params: {
              send_page_view: true
            },
            linker: {
              domains: [
                "dossierfacile.fr",
                "www.dossierfacile.fr",
                "locataire.dossierfacile.fr",
                "proprietaire.dossierfacile.fr",
                "sso.dossierfacile.fr"
              ]
            }
          });
        });
      }
      window.addEventListener('load', function () {
        if (document.cookie.indexOf("accept-cookie=true") >= 0) {
          launchAnalytics();
        }
})
    </script>
    <script>
    // set page language according "lang" cookie
    var match = document.cookie.match('lang=([^;]*)');
    var lang = match[1];
    document.cookie = "KEYCLOAK_LOCALE=" + match[1];


    window.onload = function(){
            document.getElementById("lang_" + lang).className += " underline";
        }

    function changeLocale() {
        if (lang === 'en'){
            document.cookie = 'lang=fr';
            document.cookie = 'KEYCLOAK_LOCALE=fr'
        } else {
            document.cookie = 'lang=en';
            document.cookie = 'KEYCLOAK_LOCALE=en'
        }
        window.location.href = window.location.href;
    }
    </script>

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
<div class="${properties.kcLoginClass!}">
    <div class="${properties.kcFormCardClass!}">
        <div id="app">

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
              <a
                href="https://www.dossierfacile.fr"
                title="Retour à l’accueil"
              >
                <p class="fr-header__service-title">
                  <img class="logo" src="${url.resourcesPath}/logo/logo_dossierfacile.webp" alt="logo" />
                </p>
              </a>
              <p class="fr-header__service-tagline">
                DossierFacile, le dossier de location numérique de l’État
              </p>
            </div>
          </div>

          <div class="fr-header__tools">
            <div class="fr-header__tools-links">
              <ul class="fr-links-group">
                <li class="li-margin">
                  <a href="https://${properties.appTenantUrl}/account"
                    class="fr-btn fr-ml-3 fr-btn--sm"
                  >
                    ${msg("header.signup")}
                  </a>
                </li>
                <li class="li-margin">
                  <a href="https://proprietaire.dossierfacile.fr" class="fr-btn fr-btn--secondary fr-btn--sm">
                     ${msg("header.owner")}
                  </a>
                </li>
                <li>
                  <button
                    class="fr-btn fr-ml-3 fr-btn--secondary fr-btn--sm lang"
                    onClick="changeLocale();"
                  >
                    <span id="lang_fr" class="">FR</span> |
                    <span id="lang_en" class="">EN</span>
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
        <div class="fr-header__menu-links"></div>
        <nav
          class="fr-nav"
          id="navigation-832"
          role="navigation"
          aria-label="Menu principal"
        >
          <ul class="fr-nav__list">
            <li class="fr-nav__item">
              <a
                href="https://docs.dossierfacile.fr"
                class="fr-nav__link"
                target="_blank"
                rel="noreferrer"
              >
                ${msg("menu.faq")}
              </a>
            </li>
            <li class="fr-nav__item">
              <a href="https://www.dossierfacile.fr/blog" class="fr-nav__link">
                ${msg("menu.blog")}
              </a>
            </li>
            <li class="fr-nav__item">
              <a href="https://www.dossierfacile.fr/information" class="fr-nav__link">
                ${msg("menu.information")}
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </header>
    <article class="page">
      <div id="kc-content">
        <div id="kc-content-wrapper">

          <#nested "form">

            <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <input type="hidden" name="tryAnotherWay" value="on"/>
                        <a href="#" id="try-another-way"
                           onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                    </div>
                </form>
            </#if>

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
        </div>
      </div>
    </article>
    </div>
    <#include "./common/footer.ftl">
  </div>
  </div>


    <script type="module" src="${url.resourcesPath}/dsfr/dist/dsfr/dsfr.module.min.js"></script>
    <script type="text/javascript" nomodule src="${url.resourcesPath}/dsfr/dist/dsfr/dsfr.nomodule.min.js"></script>
</body>
</html>
</#macro>
