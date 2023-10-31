<#import "template.ftl" as layout>
<style>
.content-container {
    display: flex;
    flex-direction: column;
    align-items: center;
}
@media all and (min-width: 600px) {
  .card-container {
     margin: 80px 80px 5px 80px;
     width: 600px;
     padding: 400px;
  }
}
@media (max-width: 600px) {
  .card-container {
     margin: 20px 20px 2px 20px;
     width: 320px;
     padding: 20px;
  }
}

.card-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    border: 1px solid var(--light-border-default-grey, #DDD);
    background: var(--light-background-default-grey, #FFF);
}
.card-container div{
    display: block;
    width: 100%;
}
form {
width :100%
}
</style>

<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
<#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
<div class="page">
    <div class="fr-container content-container">
            <div class="bg-white card-container fr-p-5w">
                <div class="fr-h4 text-align-left"> ${msg("resetPassword.title")}</div>
                <div >${msg("resetPassword.info")}</div>
                <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <div class="fr-mt-3w">
                        <div class="fr-input-group ${properties.kcLabelWrapperClass!}">
                            <label for="email" class="fr-label fr-mb-1w">Email</label>
                        <div class="${properties.kcInputWrapperClass!}">
                            <#if auth?has_content && auth.showUsername()>
                                <input type="text" required="required" placeholder="Ex : exemple@exemple.fr" id="username" name="username" class="form-control fr-input validate-required ${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                            <#else>
                                <input type="text" required="required" placeholder="Ex : exemple@exemple.fr" id="username" name="username" class="form-control fr-input validate-required ${properties.kcInputClass!}" autofocus aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                            </#if>

                            <#if messagesPerField.existsError('username')>
                                <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </span>
                            </#if>
                        </div>
                        <div class="fr-grid-row ${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                            <div id="kc-form-buttons" class=" fr-col6 ${properties.kcFormButtonsClass!}">
                                <input class="fr-btn ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("resetPassword.submit")}"/>
                            </div>
                            <div class=" fr-col6 ${properties.kcFormOptionsWrapperClass!}">
                                <span><a href="${url.loginUrl}">${kcSanitize(msg("resetPassword.backToLogin"))?no_esc}</a></span>
                            </div>
                        </div>


                </div>
            </div>
        </section>
    </div>
</div>
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
