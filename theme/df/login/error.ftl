<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=false; section>
<div class="bg-blue">
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div class="fr-container content-container fr-mb-5w">
            <div class="bg-white card-container fr-p-5w">
                <div class="fr-h4 text-center">
                    ${msg("errorTitle")}
                </div>
                <div class="fr-py-4w text-center">
                    ${message.summary?replace("{}", properties.appTenantUrl)?no_esc}
                </div>
                <#if client?? && client.baseUrl?has_content>
                    <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                <#else>
                    <div class=" fr-col6 ${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="https://${properties.appMainUrl}">Revenir sur DossierFacile</a></span>
                    </div>
                </#if>
            </div>
        </div>
    </#if>
</div>

</@layout.registrationLayout>