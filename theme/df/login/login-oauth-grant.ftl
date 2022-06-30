<#import "template.ftl" as layout>
<style>
ul.fr-icon-marianne-fill-container>li{
  display:inline-flex;
  width: 100%;
  /*padding-top: 0.25rem !important;*/
}
ul.fr-icon-marianne-fill-container>li span{
  line-height: initial;
  padding-top: 0.5rem;
}

ul.fr-icon-marianne-fill-container>li:before {
  display: inline-block;
  background-image: url(${url.resourcesPath}/img/icon-marianne.svg);
  background-size: var(--icon-size);
  background-repeat: no-repeat;
  /*background-position-y: center;*/
  content: "";
  --icon-size: 32px;
  min-width: 48px;
  min-height:48px;
}
#kc-oauth ul.scopebody, ul.scopebody {
    list-style: disc;
    margin-left: 1rem;
}
.notice{
}
.subnotice{
  font-size: 12px;
}
.clientName{
  color: var(--text-action-high-blue-france);
}
.logo-container{
  margin-left: auto;
  display: table;
  margin-right: 32px;
}
.buttons-container{
  text-align:right
}
</style>
<@layout.registrationLayout bodyClass="oauth"; section>
<#if section = "header">
    <#if client.name?has_content>
        ${msg("oauthGrantTitle",advancedMsg(client.name))}
    <#else>
        ${msg("oauthGrantTitle",client.clientId)}
    </#if>
<#elseif section = "form">
    <div class="fr-container fr-container--fluid fluid-full-width">
        <div class="fr-grid-row">
            <div class="fr-col-lg-6 fr-col-12">
                <div class="bg-pic">
                    <div class="bg-white fr-mt-16w fr-mb-7w logo-container">

                        <#switch client.clientId>
                            <#case "dfc-test-client">
                            <img src="${url.resourcesPath}/logo/logo_dossierfacile.svg"
                                 aria-label="DossierFacileTest"
                                />
                            <#break>
                            <#case "dfconnect-flatsy">
                                <img src="${url.resourcesPath}/logo/partners/flatsy.webp"
                                     aria-label="Flasty"
                                />
                            <#break>
                            <#case "dfconnect-superimmo">
                                <img src="${url.resourcesPath}/logo/partners/superimmo.webp"
                                     aria-label="Superimmo"
                                />
                            <#break>
                            <#case "hybrid-locservice">
                                <img src="${url.resourcesPath}/logo/partners/loc_service.webp"
                                     aria-label="locservice"
                                />
                            <#break>
                            <#case "dfconnect-toteim">
                                <img src="${url.resourcesPath}/logo/partners/toteim.jpeg"
                                     aria-label="Toteim"
                                />
                            <#break>

                            <#default>
                                <div class="">
                                    ${client.name}
                                </div>
                    </#switch>
                </div>
            </div>
        </div>
        <div class="fr-col-lg-6 fr-col-12 bg-white">
            <div class="fr-container margin-auto max-450">
                <form class="form-actions" action="${url.oauthAction}" method="POST">
                    <input type="hidden" name="code" value="${oauth.code}">
                    <div class="fr-mt-2w fr-mb-2w align-start">
                        <input class="fr-tag" name="cancel" id="kc-back" type="submit" value="${msg('back')}"/>
                    </div>
                    <div id="kc-oauth" class="content-area">

                        <h3>${kcSanitize(msg("oauthGrantRequest", client.name))?no_esc}</h3>
                        ${msg("oauthGrantRequestText", client.name)}
                        <ul class="fr-icon-marianne-fill-container fr-mt-1w fr-mb-2w">
                            <#if oauth.clientScopesRequested??>
                                <#list oauth.clientScopesRequested as clientScope>
                                    <li>
                                        <span>${kcSanitize(advancedMsg(clientScope.consentScreenText))?no_esc}</span>
                                    </li>
                                </#list>
                            </#if>
                        </ul>

                        <div class="${properties.kcFormGroupClass!}">
                            <div id="kc-form-options">
                                <div class="${properties.kcFormOptionsWrapperClass!}">
                                    <div class="notice">${msg('oauthGrantRequestNotice', client.name)}</div>
                                    <div class="subnotice">${msg('oauthGrantRequestSubNotice')}</div>
                                </div>
                            </div>

                            <div id="kc-form-buttons" class="buttons-container">
                                <div class="${properties.kcFormButtonsWrapperClass!}" style="display:inline-flex">
                                    <input class="fr-btn fr-btn--secondary fr-mr-1w ${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}"
                                           name="cancel" id="kc-cancel" type="submit" value="${msg("access-denied")}"/>
                                    <input class="fr-btn ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"
                                           name="accept" id="kc-login" type="submit" value="${msg("access-granted")}"/>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</#if>
</@layout.registrationLayout>
