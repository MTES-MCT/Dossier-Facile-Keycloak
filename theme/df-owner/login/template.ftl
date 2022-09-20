<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}" lang="fr" data-fr-theme="light">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <link rel="stylesheet" href="${url.resourcesPath}/dsfr/dist/dsfr/dsfr.min.css?t=20220510">
    <link rel="stylesheet" href="${url.resourcesPath}/css/fc.css?t=20220510">
    <link rel="stylesheet" href="${url.resourcesPath}/css/global.css?t=20220510">
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined" rel="stylesheet">
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
    <script type="text/javascript">!function(e,t,n){function a(){var e=t.getElementsByTagName("script")[0],n=t.createElement("script");n.type="text/javascript",n.async=!0,n.src="https://beacon-v2.helpscout.net",e.parentNode.insertBefore(n,e)}if(e.Beacon=n=function(t,n,a){e.Beacon.readyQueue.push({method:t,options:n,data:a})},n.readyQueue=[],"complete"===t.readyState)return a();e.attachEvent?e.attachEvent("onload",a):e.addEventListener("load",a,!1)}(window,document,window.Beacon||function(){});</script>
    <script type="text/javascript">window.Beacon('init', 'e9f4da7d-11be-4b40-9514-ac7ce3e68f67')</script>
</head>

<body class="${properties.kcBodyClass!}">
<div class="${properties.kcLoginClass!}">
    <div class="${properties.kcFormCardClass!}">
        <div id="app">

    <#include "./common/header.ftl">
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
