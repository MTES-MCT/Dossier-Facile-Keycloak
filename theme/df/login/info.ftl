<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
<div class="bg-blue">
    <#if section = "header">
        <#if messageHeader??>
        ${messageHeader}
        <#else>
        ${message.summary}
        </#if>
    <#elseif section = "form">
    <div class="fr-container content-container fr-mb-5w">
        <div class="bg-white card-container fr-p-5w">
            <div id="kc-info-message">
                <div class="fr-py-4w text-center">
                    <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></#list><#else></#if></p>
                </div>
                <#if skipLink??>
                    <#if client?? && client.baseUrl?has_content>
                        <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                    <#else>
                        <div class=" fr-col6 ${properties.kcFormOptionsWrapperClass!}">
                            <span><a href="https://${properties.appMainUrl}">Revenir sur DossierFacile</a></span>
                        </div>
                    </#if>
                <#else>
                    <#if pageRedirectUri?has_content>
                        <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                    <#elseif actionUri?has_content>
                        <p><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
                    <#elseif (client.baseUrl)?has_content>
                        <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                    <#else>
                        <div class=" fr-col6 ${properties.kcFormOptionsWrapperClass!}">
                            <span><a href="https://${properties.appMainUrl}">Revenir sur DossierFacile</a></span>
                        </div>
                    </#if>

                </#if>
            </div>
        </div>
    </div>
    </#if>

    <#assign alreadyLoggedIn = msg("alreadyLoggedIn")>
    <#if message.summary?has_content && message.summary == alreadyLoggedIn>
        <script type="text/javascript">
            document.addEventListener("DOMContentLoaded", function(event) {
                <#if client?? && client.baseUrl?has_content>
                   window.location.href = `${client.baseUrl}`;
                <#else>
                   window.location.href = `https://${properties.appMainUrl}`;
                </#if>
            });
        </script>
    </#if>
</div>
</@layout.registrationLayout>