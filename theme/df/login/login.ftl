<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
    <#elseif section = "form">
    <div class="fr-container fr-container--fluid fluid-full-width">
        <div class="fr-grid-row">
            <div class="fr-col-lg-6 fr-col-12" >
              <div class="bg-pic">
                <div class="max-550 left-row fr-pt-3w fr-mt-7w fr-mb-7w">
                  <h2 class="fr-h4 my-file">
                    Mon dossier de location avec <em>Dossier</em>Facile
                  </h2>
                  <p class="my-file-subtitle">
                    Vous êtes sur le point de compléter votre dossier de location
                    <strong>vérifié par l'État !</strong>
                  </p>
                </div>
                <div class="bg-white max-550 left-row fr-p-md-5w fr-mt-7w fr-mb-7w">
                  <p><em>Dossier</em><strong>Facile</strong> vous aide :</p>
                  <p>
                    🔐 à constituer un
                    <strong>dossier numérique conforme, sécurisé</strong> et
                    <strong>facile à transmettre</strong> au bailleur.
                  </p>
                  <p>
                    🤔 à connaître
                    <strong><u>la liste des documents à fournir</u></strong> dans un
                    dossier de location pour éviter les pièges !
                  </p>
                  <p>
                    🤩 à <strong>rassurer votre futur propriétaire</strong> pour
                    <strong>décrocher le logement de vos rêves !</strong>
                  </p>
                </div>
              </div>
            </div>
            <div class="fr-col-lg-6 fr-col-12 bg-white">
                <div class="fr-mt-2w align-end">
                    <a tabindex="6" href="https://${properties.appTenantUrl}/signup" class="fr-tag">
                        ${ msg("login.signup-link") }
                    </a>
                </div>
                <div id="kc-form" class="margin-auto max-400">
                <div>
                    <h1 class="fr-mt-2w fr-h2 blue-text text-center">${ msg("login.connection") }</h1>
                    <#if realm.password && social.providers??>
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
                            <#if message.summary != 'Identifiez vous afin de lier votre compte avec oidc'>
                              <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                            <#else>
                              <span class="small-text">Identifiez vous afin de lier votre compte avec FranceConnect</span>
                            </#if>
                      </div>
                  </#if>

                    <div id="kc-form-wrapper">
                        <#if realm.password>
                            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                <div class="fr-mt-3w ${properties.kcFormGroupClass!}">
                                    <label for="username" class="fr-label ${properties.kcLabelClass!}">${ msg("login.email") }</label>

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
                                    <label for="password" class="fr-label ${properties.kcLabelClass!}">${ msg("login.password") }</label>

                                    <input tabindex="2" id="password" class="fr-input ${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    />
                                    <div style="float:right">
                                    <a tabindex="6"
                                                        href="https://${properties.appTenantUrl}/forgotten-password" class="blue-text">Mot de passe oublié</a>
                                                        </div>
                                </div>

                                <div class="fr-mt-5w ${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                    <div id="kc-form-options">
                                        <#if realm.rememberMe && !usernameEditDisabled??>
                                            <div class="fr-checkbox-group">
                                                    <#if login.rememberMe??>
                                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                                    <#else>
                                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
                                                    </#if>
                                                <label class="fr-label" for="rememberMe">
                                                  Se souvenir de moi
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
                                  <#if client.getAttribute('hide.consent.on.login.screen')?has_content && client.getAttribute('hide.consent.on.login.screen') == 'true' >
                                    <!-- freemarker should be forbidden -->
                                  <#elseif client.name != "dossierfacile" >
                                        <div class="checkbox">
                                            <label class="fr-label">
                                                    <input required tabindex="3" id="authorize" name="authorize" type="checkbox" checked> J'autorise DossierFacile à fournir à ${client.name} les informations contenues dans mon DossierFacile, et je reconnais avoir reçu le consentement de mes garants et colocataires éventuels pour fournir à ${client.name} les informations les concernant.
                                            </label>
                                        </div>
                                  </#if>

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

    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        </#if>
    </#if>
</@layout.registrationLayout>
