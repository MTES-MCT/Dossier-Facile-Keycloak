<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
    <#elseif section = "form">
       <div class="fr-container content-container">
         <div class="bg-white card-container fr-p-5w">
            <div id="instruction1" class="instruction">
                ${msg("pageExpiredMsg1")} <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a> .<br/>
                ${msg("pageExpiredMsg2")} <a id="loginContinueLink" href="${url.loginAction}">${msg("doClickHere")}</a> .
            </div>
         </div>>
       </div>
    </#if>
</@layout.registrationLayout>
