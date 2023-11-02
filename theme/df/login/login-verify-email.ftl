<#import "template.ftl" as layout>

<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">

    <#elseif section = "form">
    <div class="content-container">
        <div class="bg-white card-container fr-p-5w">
            <div class="fr-h4 text-center">
              <svg aria-hidden="true" class="fr-artwork" viewBox="0 0 80 80" width="100px" height="100px">
                  <use class="fr-artwork-decorative" href="${url.resourcesPath}/dsfr/dist/artwork/pictograms/digital/mail-send.svg#artwork-decorative"></use>
                  <use class="fr-artwork-minor" href="${url.resourcesPath}/dsfr/dist/artwork/pictograms/digital/mail-send.svg#artwork-minor"></use>
                  <use class="fr-artwork-major" href="${url.resourcesPath}/dsfr/dist/artwork/pictograms/digital/mail-send.svg#artwork-major"></use>
              </svg>
            </div>
            <div class="fr-h4 text-center">
                ${msg("registration.mail.instruction.title")}
            </div>
            <div class="fr-text--md">
                ${msg("registration.mail.instruction.link")} <br/>
                <span class="fr-text--bold">${(user.username!'adresse masquée')} </span>
            </div>
            <div style="align-items: left;">
                ${msg("registration.mail.instruction.info")} <br/>
            </div>
    </div>
    <#elseif section = "info">
        <div class="text-center fr-mb-12w">
            <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
        </div>
    </#if>

</@layout.registrationLayout>