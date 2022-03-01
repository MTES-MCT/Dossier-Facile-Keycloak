<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
    <#elseif section = "form">
    <div class="fr-container fr-container--fluid full-width">
        <div class="fr-grid-row">
            <div class="fr-col-lg-6 fr-col-12">
              <div class="bg-pic">
                <div class="bg-white max-450 left-row fr-pt-3w fr-mt-7w fr-mb-7w">
                <h2 class="fr-h5 blue-text text-center fr-mt-3w">En route pour rejoindre DossierFacile !</h2>
                <div class="fr-pl-2w fr-pr-2w">
                Afin de faciliter la constitution de votre dossier, préparez les pièces suivantes :
                </div>
                <div class="bg-purple blue-text fr-pr-2w fr-pl-2w fr-pt-3w fr-pb-3w">
                    <ul>
                        <li>
                        Une pièce d’identité
                        </li>
                        <li>
                        Un justificatif de domicile
                        </li>
                        <li>
                        Un justificatif de situation professionnelle
                        </li>
                        <li>
                        Des justificatifs de ressources
                        </li>
                        <li>
                        Votre dernier avis d’imposition
                        </li>
                    </ul>
                    Pour vos garants ces mêmes pièces vous seront demandées.
                </div>
                <div class="fr-pl-2w fr-pr-2w">
                    <p class="fr-mt-3w">
                        Vous avez tout ?! Super !<br>
                        Commençons par sécuriser votre compte !
                    </p>
                </div>
                </div>
              </div>
            </div>
            <div class="fr-col-lg-6 fr-col-12 bg-white">
                <div class="fr-mt-2w align-end">
                    <a tabindex="6" href="https://locataire.dossierfacile.fr/signup" class="fr-tag">Nouveau sur DossierFacile ? Se créer un compte</a>
                </div>
                <div id="kc-form" class="margin-auto max-400">
                <div>
                    <h1 class="fr-mt-2w fr-h2 blue-text text-center">Connexion à mon compte DossierFacile</h1>
                    <#if realm.password && social.providers??>
                        <div id="kc-social-providers" class="fr-mt-5w fr-mb-1w text-center ${properties.kcFormSocialAccountSectionClass!}">
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
                        <div class="text-center">
                            <a href="https://app.franceconnect.gouv.fr/en-savoir-plus" id="cQuoiFCGauche" target="_blank" rel="noopener">
                                Qu'est-ce que FranceConnect?
                            </a>
                            <br>
                            <div class="fr-mt-2w fr-mb-5w small-text">
                            FranceConnect est la solution proposée par l’État pour sécuriser et simplifier la connexion à vos services en ligne
                            </div>
                        </div>

                            <div class="separator"> Ou </div>
                    </#if>

          <#if !messagesPerField.existsError('username','password') && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="fr-mt-2w alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                  <div class="pf-c-alert__icon">
                      <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                      <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                      <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                      <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  </div>
                      <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
              </div>
          </#if>

                    <div id="kc-form-wrapper">
                        <#if realm.password>
                            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                <div class="fr-mt-3w ${properties.kcFormGroupClass!}">
                                    <label for="username" class="fr-label ${properties.kcLabelClass!}">Votre e-mail :</label>

                                    <#if usernameEditDisabled??>
                                        <input tabindex="1" id="username" class="fr-input ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                                    <#else>
                                        <input tabindex="1" id="username" class="fr-input ${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                        />

                                        <#if messagesPerField.existsError('username','password')>
                                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                            </span>
                                        </#if>
                                    </#if>
                                </div>

                                <div class="fr-mt-2w ${properties.kcFormGroupClass!}">
                                    <label for="password" class="fr-label ${properties.kcLabelClass!}">Votre mot de passe :</label>

                                    <input tabindex="2" id="password" class="fr-input ${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    />
                                    <div style="float:right">
                                    <a tabindex="6"
                                                        href="https://locataire.dossierfacile.fr/forgotten-password" class="blue-text">Mot de passe oublié</a>
                                                        </div>
                                </div>

                                <div class="fr-mt-5w ${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                    <div id="kc-form-options">
                                        <#if realm.rememberMe && !usernameEditDisabled??>
                                            <div class="checkbox">
                                                <label class="fr-label">
                                                    <#if login.rememberMe??>
                                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> Se souvenir de moi
                                                    <#else>
                                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> Se souvenir de moi
                                                    </#if>
                                                </label>
                                            </div>
                                        </#if>
                                        </div>
                                        <div class="${properties.kcFormOptionsWrapperClass!}">
                                            <#if realm.resetPasswordAllowed>
                                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                            </#if>
                                        </div>

                                </div>
                                            <div class="checkbox">
                                                <label class="fr-label">
                                                        <input required tabindex="3" id="authorize" name="authorize" type="checkbox" checked> J'autorise DossierFacile à fournir à ${client.name} les informations contenues dans mon DossierFacile, et je reconnais avoir reçu le consentement de mes garants et colocataires éventuels pour fournir à ${client.name} les informations les concernant.
                                                </label>
                                            </div>

                                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!} fr-mb-5w">
                                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                    <input tabindex="4" class="fr-btn ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="Se connecter"/>
                                </div>
                            </form>
                        </#if>
                        </div>

                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        </#if>
    </#if>
</@layout.registrationLayout>
