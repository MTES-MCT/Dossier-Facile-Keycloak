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
        <div class="bg-white">
            <div class="fr-mt-2w align-end">
                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <a href="${url.loginUrl}" class="fr-tag">
                        ${ msg("login.signin-link") }
                    </a>
                <#else>
                    <a href="https://${properties.appTenantUrl}/signup" class="fr-tag">
                        ${ msg("login.signin-link") }
                    </a>
                </#if>
            </div>
            <div id="kc-form" class="margin-auto max-500">
                <h1 class="fr-mt-2w fr-h2 text-center">${ msg("signup.title") }</h1>
                <#if realm.password && social.providers??>
                    <div class="fr-alert fr-alert--info">
                        <h2 class="fr-alert__title">${ msg("signup.connexion-france-connect-title") }</h2>
                        <p>${ msg("signup.connexion-france-connect-text") } <strong>${ msg("signup.connexion-france-connect-text2") }</strong> ${ msg("signup.connexion-france-connect-text3") } <strong>${ msg("signup.connexion-france-connect-text4") }</strong> ${ msg("signup.connexion-france-connect-text5") }</p>
                    </div>
                    <div class="text-center">
                        <div class="fr-mt-2w fr-mb-2w small-text">
                        ${ msg("login.france-connect") }
                        </div>
                    </div>
                    <div id="kc-social-providers" class="fr-mt-3w fr-mb-1w text-center ${properties.kcFormSocialAccountSectionClass!}">
                        <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                            <#list social.providers as p>
                                <a id="social-${p.alias}" class="inline-block ${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                        type="button" href="${p.loginUrl}">
                                    <#if p.iconClasses?has_content>
                                        <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                        <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                    <#else>
                                        <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                    </#if>
                                </a>
                            </#list>
                        </ul>
                    </div>
                    <div class="text-center fr-mb-2w">
                        <a href="https://app.franceconnect.gouv.fr/en-savoir-plus" id="cQuoiFCGauche" target="_blank" rel="noopener">
                            Qu'est-ce que FranceConnect?
                        </a>
                    </div>

                    <div class="separator">Ou</div>
                </#if>
                <div id="kc-form-wrapper">
                    <form id="kc-register-form" class="${properties.kcFormClass!}" onsubmit="return handleSubmit();"  action="${url.registrationAction}" method="post">

                        <div class="fr-col-12 fr-mb-3w ${properties.kcFormGroupClass!}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="email" class="${properties.kcLabelClass!}">${ msg("login.email") }</label>
                            </div>
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
                            <div class="fr-col-12 fr-mb-1w ${properties.kcFormGroupClass!}">
                                <div class="${properties.kcLabelWrapperClass!}">
                                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                                </div>
                                <div class="${properties.kcInputWrapperClass!}">
                                    <input type="password" id="password" class="fr-input ${properties.kcInputClass!}" name="password"
                                        autocomplete="new-password"
                                        aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                    />
                                    <span id="password-strength-bar" class="password-bar password-empty"></span>
                                    <#if messagesPerField.existsError('password')>
                                        <span id="input-error-password" class="fr-error-text ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                            </div>

                            <div class="fr-col-12 fr-mb-3w ${properties.kcFormGroupClass!}">
                                <div class="${properties.kcLabelWrapperClass!}">
                                    <label for="password-confirm"
                                        class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                                </div>
                                <div class="${properties.kcInputWrapperClass!}">
                                    <input type="password" id="password-confirm" class="fr-input ${properties.kcInputClass!}"
                                        name="password-confirm"
                                        aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                    />

                                    <#if messagesPerField.existsError('password-confirm')>
                                        <span id="input-error-password-confirm" class="fr-error-text ${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                        </span>
                                    </#if>
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

                        <div class="fr-col-12 fr-mb-3w">
                            <span>
                                <div id="cguGroup" class="bg-purple fr-checkbox-group">
                                    <input type="checkbox" id="acceptCgu" value="false">
                                        <label for="acceptCgu">
                                            <div>En cochant cette case et en cliquant sur "Je crée mon compte", j’accepte expressément les <a class="cgu" target="_blank" href="https://www.dossierfacile.logement.gouv.fr/cgu">Conditions générales d’utilisation</a> de DossierFacile et je comprends que mes données personnelles seront utilisées conformément à la <a target="_blank" class="cgu" href="https://www.dossierfacile.logement.gouv.fr/politique-de-confidentialite">Politique de confidentialité</a> de DossierFacile</div>
                                        </label>
                                </div>
                            </span>
                        </div>

                        <div class="${properties.kcFormGroupClass!}">

                            <div id="kc-form-buttons" class="fr-col-12 text-center fr-mb-5w ${properties.kcFormButtonsClass!}">
                                <input class="fr-btn full-width-btn ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </#if>
    <style>
        .password-bar {
            position: relative;
            display: block;
            height: 3px;
            margin: 10px auto 20px;
        }
        .password-empty {
            background-color: grey;
        }
        .password-weak {
            background-color: red;
        }
        .password-medium {
            background-color: orange;
        }
        .password-strong {
            background-color: green;
        }
    </style>
    <script>

        function handleSubmit() {

            let element = document.getElementById('acceptCgu')
            if (element.checked == true) {
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

        let password = document.getElementById('password')
        let passwordStrengthBar = document.getElementById('password-strength-bar')

        let strongPassword = new RegExp('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})')
        let mediumPassword = new RegExp('((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{6,}))|((?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9])(?=.{8,}))')

        function checkStrength(str){
            let classes = 'password-bar';
            if(str.length === 0) {
                classes += ' password-empty'
            } else if(strongPassword.test(str)) {
                classes += ' password-strong';
            } else if(mediumPassword.test(str)){
                classes += ' password-medium';
            } else {
                classes += ' password-weak';
            }
            passwordStrengthBar.className = classes;
        }

        password.addEventListener("input", () => {
            checkStrength(password.value);
        });

    </script>

</@layout.registrationLayout>