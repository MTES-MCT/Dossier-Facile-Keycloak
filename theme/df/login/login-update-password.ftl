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

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <div class="fr-container content-container fr-mb-5w">
            <div class="bg-white card-container fr-p-5w">
                <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
                    <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                    <div class="fr-password ${properties.kcFormGroupClass!}" id="password-update">
                        <label class="fr-label" for="password-update-input">
                            ${msg("passwordNew")}
                        </label>
                        <div class="fr-input-wrap">
                            <input class="fr-password__input fr-input" aria-describedby="password-update-input-messages" aria-required="true"
                                        type="password" id="password-new" name="password-new" class="${properties.kcInputClass!}"
                                                               autofocus autocomplete="new-password"
                                                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                                        />
                        </div>
                        <div class="fr-messages-group" id="password-1138-input-messages" aria-live="assertive">
                            <p class="fr-message" >Votre mot de passe doit contenir :</p>
                            <p class="fr-message fr-message--info">12 caractères minimum</p>
                            <p class="fr-message fr-message--info">1 caractère spécial minimum</p>
                            <p class="fr-message fr-message--info">1 chiffre minimum</p>
                        </div>

                        <div class="${properties.kcInputWrapperClass!}">
                            <#if messagesPerField.existsError('password')>
                                <div class="alert-error">
                                    <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                    </span>
                                </div>
                            </#if>
                        </div>
                    </div>


                    <div class="fr-password  ${properties.kcFormGroupClass!}">
                        <label for="password-confirm" class="fr-label ${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                        <div class="fr-input-wrap ${properties.kcInputWrapperClass!}">
                            <input type="password" id="password-confirm" name="password-confirm"
                                   class="fr-password__input fr-input ${properties.kcInputClass!}"
                                   autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                            />

                            <#if messagesPerField.existsError('password-confirm')>
                                <div class="alert-error">
                                    <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                    </span>
                                </div>
                            </#if>

                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if isAppInitiatedAction??>
                                    <div class="checkbox">
                                        <label><input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked> ${msg("logoutOtherSessions")}</label>
                                    </div>
                                </#if>
                            </div>
                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <#if isAppInitiatedAction??>
                                <input class="fr-btn ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                                <button class="fr-btn-secondary ${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                            <#else>
                                <input class="fr-btn ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                            </#if>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>