<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <div class="fr-container content-container fr-mb-5w">
            <div class="bg-white card-container fr-p-5w">
                <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
                    <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                    <div class="fr-password fr-mb-3v ${properties.kcFormGroupClass!}" id="password-update">
                        <label class="fr-label" for="password-new">
                            ${msg("passwordNew")}
                        </label>
                        <div class="fr-input-wrap">
                            <input class="fr-password__input fr-input ${properties.kcInputClass!}" aria-describedby="password-messages"
                                aria-required="true" type="password" id="password-new" name="password-new" autocapitalize="off" autocorrect="off"
                                autofocus autocomplete="new-password"
                                                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                                        />
                        </div>
                        <div class="fr-messages-group" id="password-messages" aria-live="polite">
                            <p class="fr-message">${msg("register.password-must")}</p>
                            <p class="fr-message fr-message--info" data-fr-valid="validé" data-fr-error="en erreur" id="pwd-message-min12">${msg("register.password-min12")}</p>
                            <p class="fr-message fr-message--info" data-fr-valid="validé" data-fr-error="en erreur" id="pwd-message-special">${msg("register.password-special")}</p>
                            <p class="fr-message fr-message--info" data-fr-valid="validé" data-fr-error="en erreur" id="pwd-message-digit">${msg("register.password-digit")}</p>
                        </div>
                        <div class="fr-password__checkbox fr-checkbox-group fr-checkbox-group--sm">
                            <input aria-label="Afficher le mot de passe" id="password-show" type="checkbox">
                            <label class="fr--password__checkbox fr-label" for="password-show">
                                ${ msg("login.show") }
                            </label>
                        </div>
                        <#if messagesPerField.existsError('password')>
                            <div class="alert-error">
                                <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </span>
                            </div>
                        </#if>
                    </div>


                    <div class="fr-password  ${properties.kcFormGroupClass!}">
                        <label for="password-confirm" class="fr-label ${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                        <div class="fr-input-wrap ${properties.kcInputWrapperClass!}">
                            <input type="password" id="password-confirm" name="password-confirm"
                                   class="fr-password__input fr-input ${properties.kcInputClass!}"
                                   autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                            />
                        </div>
                        <div class="fr-password__checkbox fr-checkbox-group fr-checkbox-group--sm">
                            <input aria-label="Afficher le mot de passe" id="password-confirm-show" type="checkbox">
                            <label class="fr--password__checkbox fr-label" for="password-confirm-show">
                                ${ msg("login.show") }
                            </label>
                        </div>
                        <#if messagesPerField.existsError('password-confirm')>
                            <div class="alert-error">
                                <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </span>
                            </div>
                        </#if>
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
        <script>
            const password = document.getElementById('password-new');
            const passwordGroup = document.getElementById('password-update');

            function updateElement(id, valid, isSubmit) {
                const elt = document.getElementById(id);
                let showError = false;
                if (valid) {
                    elt.classList.remove('fr-message--info', 'fr-message--error');
                    elt.classList.add('fr-message--valid');
                } else if (elt.classList.contains('fr-message--valid') || isSubmit) {
                    elt.classList.remove('fr-message--info', 'fr-message--valid');
                    elt.classList.add('fr-message--error');
                    showError = true;
                }
                return [valid, showError];
            }

            function checkPasswordValidity(isSubmit) {
                const [v1, e1] = updateElement('pwd-message-min12', password.value.length >= 12, isSubmit);
                const [v2, e2] = updateElement('pwd-message-special', /[^a-z0-9]/i.test(password.value), isSubmit);
                const [v3, e3] = updateElement('pwd-message-digit', /[0-9]/.test(password.value), isSubmit);
                const valid = v1 && v2 && v3;
                const showGroupError = isSubmit ? !valid : e1 || e2 || e3;
                passwordGroup.classList[showGroupError ? 'add' : 'remove']('fr-input-group--error');
                return valid
            }

            function handleSubmit(event) {
                if (!checkPasswordValidity(true)) {
                    event.preventDefault();
                }
            }

            password.addEventListener("input", () => checkPasswordValidity(false));
            document.getElementById('kc-passwd-update-form').addEventListener("submit", handleSubmit)
        </script>
    </#if>
</@layout.registrationLayout>