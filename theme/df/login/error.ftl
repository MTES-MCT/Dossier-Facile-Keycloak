<#import "template.ftl" as layout>
<style>
.bg-white-error {
    box-shadow: 0 3px 6px rgb(0 0 0 / 16%), 0 3px 6px rgb(0 0 0 / 23%);
    border-radius: 10px;
    }
</style>

<@layout.registrationLayout displayMessage=false; section>
<div class="bg-blue">
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
            <div class="bg-white bg-white-error fr-p-4w fr-my-4w fr-mx-md-14w fr-px-md-10w">
                <div class="fr-py-1w text-center">
                    ${msg("errorTitle")}
                </div>
                <div class="fr-py-4w text-center">
                    ${message.summary?replace("{}", properties.appTenantUrl)?no_esc}
                </div>

                <#if client?? && client.baseUrl?has_content>
                    <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                </#if>
            </div>
    </#if>
</div>

</@layout.registrationLayout>