<div class="fr-skiplinks">
    <nav class="fr-container" role="navigation" aria-label="Accès rapide">
        <ul class="fr-skiplinks__list">
            <li>
                <a class="fr-link" href="#social-oidc">Connexion avec FranceConnect</a>
            </li>
            <li>
                <a class="fr-link" href="#username">Connexion avec e-mail</a>
            </li>
            <li>
                <a class="fr-link" href="#footer">Pied de page</a>
            </li>
        </ul>
    </nav>
</div>
<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('email','username','password','password-confirm'); section>
    <#if section = "header">
    <#elseif section = "form">
        <div class="fr-py-md-5w" style="background-color: var(--background-alt-blue-france)">
            <div id="kc-form" class="margin-auto max-720 bg-white">
                <h1 class="fr-mt-2w fr-h2 text-center">${ msg("signup.title") }</h1>
                <#if realm.password && social.providers??>
                    <p class="fr-text--xl text-center fr-mb-2w">${msg("register.with")}</p>
                    <div id="kc-social-providers" class="fr-mb-3v text-center ${properties.kcFormSocialAccountSectionClass!}">
                        <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                            <#list social.providers as p>
                                <div class="fr-connect-group inline-block">
                                    <button type="button" id="social-${p.alias}" class="fr-connect btn-link" onclick="location.href='${p.loginUrl}'">
                                        <span class="fr-connect__login">S’identifier avec</span>
                                        <span class="fr-connect__brand">FranceConnect</span>
                                    </button>
                                    <p class="fr-mb-1w">
                                        <a href="https://franceconnect.gouv.fr/" target="_blank"  rel="noopener" title="Qu’est-ce que FranceConnect ? - nouvelle fenêtre">${msg("whatIsFranceConnect")}</a>
                                    </p>
                                </div>
                            </#list>
                        </ul>
                    </div>
                    <p class="fr-mb-2w small-text text-center" style="text-wrap: balance">
                        ${ msg("login.france-connect") }
                    </p>

                    <div class="separator fr-text--md fr-text--bold" style="color: var(--text-active-grey)">OU</div>
                </#if>
                <div id="kc-form-wrapper">
                    <form id="kc-register-form" class="${properties.kcFormClass!}" onsubmit="return handleSubmit();"  action="${url.registrationAction}" method="post">

                        <div class="fr-col-12 fr-mb-3w ${properties.kcFormGroupClass!}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="email" class="${properties.kcLabelClass!}">${ msg("login.email") }</label>
                            </div>
                            <p class="fr-text--xs fr-mb-1w" style="color: #666">${msg("login.expectedFormat")}</p>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="email" class="fr-input ${properties.kcInputClass!}" name="email"
                                    value="${(register.formData.email!'')}" autocomplete="email"
                                    aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                                />

                                <#if messagesPerField.existsError('email')>
                                    <span id="input-error-email" class="fr-mt-1w ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('email'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </div>

                        <#if !realm.registrationEmailAsUsername>
                            <div class="fr-col-12 fr-mb-3w ${properties.kcFormGroupClass!}">
                                <div class="${properties.kcLabelWrapperClass!}">
                                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                                </div>
                                <div class="${properties.kcInputWrapperClass!}">
                                    <input type="text" id="username" class="${properties.kcInputClass!}" name="username"
                                        value="${(register.formData.username!'')}" autocomplete="username"
                                        aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                    />

                                    <#if messagesPerField.existsError('username')>
                                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                            </div>
                        </#if>

                        <#if passwordRequired??>
                            <div class="fr-password fr-mb-3w">
                                <label class="fr-label" for="password">
                                    ${ msg("password") }
                                </label>
                                <div class="fr-input-wrap">
                                    <input class="fr-password__input fr-input" autocapitalize="off" autocorrect="off"
                                        aria-describedby="password-messages" aria-required="true" name="password"
                                        autocomplete="new-password" id="password" type="password">
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
                            </div>
                        </#if>

                        <#if recaptchaRequired??>
                            <div class="fr-col-12 fr-mb-3w">
                                <div class="${properties.kcInputWrapperClass!}">
                                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                                </div>
                            </div>
                        </#if>

                        <div id="cguGroup" class="fr-checkbox-group fr-checkbox-group--sm">
                            <input type="checkbox" id="acceptCgu" value="false">
                            <label for="acceptCgu">
                                ${msg("register.cgu")?no_esc}
                            </label>
                        </div>

                        <div class="${properties.kcFormGroupClass!}">
                            <div id="kc-form-buttons" class="fr-col-12 text-center fr-mb-5w ${properties.kcFormButtonsClass!}">
                                <input class="fr-btn full-width-btn ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="separator fr-mb-3w"></div>
                <p class="fr-mb-1w text-center">${msg("register.hasAccount")}</p>
                <a href="<#if realm.password && realm.registrationAllowed && !registrationDisabled??>${url.loginUrl}<#else>https://${properties.appTenantUrl}/signup</#if>" class="fr-btn fr-btn--secondary text-center">
                    ${ msg("login.signin-link") }
                </a>
                <div class="separator fr-my-3w"></div>
                <p class="text-center">
                    <a href="https://proprietaire.dossierfacile.logement.gouv.fr/creation" class="blue-text">${msg("register.asOwner")}</a>
                </p>
            </div>
        </div>
    </#if>
    <script>

        const password = document.getElementById('password');

        function setClass(id, className) {
            const elt = document.getElementById(id);
            if (!elt) return;
            elt.classList.remove('fr-message--info', 'fr-message--error', 'fr-message--valid');
            elt.classList.add('fr-message--' + className);
        }

        function checkValidity() {
            let valid = true;
            if (password.value.length < 12) {
                setClass('pwd-message-min12', 'error');
                valid = false;
            } else {
                setClass('pwd-message-min12', 'valid');
            }
            if (!/[^a-z0-9]/i.test(password.value)) {
                setClass('pwd-message-special', 'error');
                valid = false;
            } else {
                setClass('pwd-message-special', 'valid');
            }
            if (!/[0-9]/.test(password.value)) {
                setClass('pwd-message-digit', 'error');
                valid = false;
            } else {
                setClass('pwd-message-digit', 'valid');
            }
            return valid
        }

        function handleSubmit() {
            if (!checkValidity()) {
                return false;
            }
            let element = document.getElementById('acceptCgu')
            if (element.checked == true) {
                const input = document.createElement("input");
                input.name = "password-confirm";
                input.value = document.getElementById("password").value;
                input.hidden = true;
                document.getElementById("kc-register-form").appendChild(input);
                return true;
            }

            document.getElementById('cguGroup').classList.add("fr-input-group--error");
            const errElt = document.createElement("span");
            errElt.classList.add("fr-error-text");

            let errText = document.createTextNode("Vous devez accepter les Conditions générales d’utilisation et la Politique de confidentialité de DossierFacile pour continuer");
            errElt.appendChild(errText);
            document.getElementById('cguGroup').appendChild(errElt)

            return false;
        }

        password.addEventListener("input", checkValidity)

    </script>

</@layout.registrationLayout>