<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password'); section>

    <#if section = "header">

        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <style>
            /* Reset et styles de base */
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                min-height: 100vh;
                font-family: 'Montserrat', 'Muli', sans-serif;
                background-color: #f3f4f6;
                background-image: url("${url.resourcesPath}/img/arriere-plan-bjcollab.svg") !important;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                min-height: 85vh;
                width: 100%;
            }

            .card-pf {
                background-color: #f3f4f6;
                background-image: url("${url.resourcesPath}/img/arriere-plan-bjcollab.svg") !important;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                min-height: 85vh;
                width: 100%;
            }

            .kc-logo-text {
                display: none !important;
            }

            /* Wrapper principal */
            .kc-login-wrapper {
                min-height: 85vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            /* Conteneur de la carte de connexion */
            .login-container {
                background: rgba(255, 255, 255, 0.92);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-radius: 8px;
                padding: 32px;
                max-width: 448px;
                width: 100%;
            }

            /* Logo */
            .login-logo {
                display: flex;
                justify-content: center;
                margin-bottom: 32px;
            }

            .login-logo img {
                width: 240px;
                height: auto;
                object-fit: contain;
            }

            /* Messages d'erreur */
            .message-error {
                margin-bottom: 16px;
                padding: 12px;
                border-radius: 6px;
                background-color: #fee2e2;
                color: #dc2626;
                font-size: 14px;
            }

            /* Formulaire */
            .login-form {
                display: flex;
                flex-direction: column;
                gap: 16px;
            }

            /* Champs du formulaire */
            .form-group {
                display: flex;
                flex-direction: column;
            }

            .form-group label {
                display: block;
                font-size: 14px;
                font-weight: 500;
                color: #374151;
                margin-bottom: 4px;
            }

            .form-group input[type="text"],
            .form-group input[type="password"] {
                width: 100%;
                padding: 8px 12px;
                border: 1px solid #d1d5db;
                border-radius: 6px;
                font-size: 14px;
                font-family: 'Montserrat', 'Muli', sans-serif;
                box-sizing: border-box;
                background-color: #ffffff;
            }

            .form-group input[type="text"]:focus,
            .form-group input[type="password"]:focus {
                outline: none;
            }

            .field-error {
                color: #ef4444;
                font-size: 14px;
                margin-top: 4px;
            }

            /* Conditions */
            .terms-group {
                display: flex;
                align-items: flex-start;
                gap: 8px;
                font-size: 11px;
                margin-top: 4px;
            }

            .terms-group input[type="checkbox"] {
                width: 12px;
                height: 12px;
                margin-top: 2px;
                accent-color: #2563eb;
                border-radius: 4px;
                border: 1px solid #d1d5db;
                flex-shrink: 0;
            }

            .terms-group label {
                color: #374151;
                font-size: 11px;
                line-height: 1.4;
            }

            .terms-group a {
                color: #2563eb;
                text-decoration: none;
            }

            .terms-group a:hover {
                text-decoration: underline;
            }

            /* Bouton de connexion */
            .btn-login {
                width: 100%;
                background-color: #1C6557;
                color: #ffffff;
                font-size: 13px;
                font-weight: 600;
                padding: 10px 16px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: background-color 0.2s ease-in-out;
                font-family: 'Montserrat', 'Muli', sans-serif;
                margin-top: 4px;
            }

            .btn-login:hover {
                background-color: #FED307;
                color: #1C6557;
            }

            .btn-login:focus {
                outline: none;
                box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.5);
            }

            /* Responsive */
            @media (max-width: 480px) {
                .login-container {
                    padding: 24px 16px;
                }

                .login-logo img {
                    width: 180px;
                }

                .form-group input[type="text"],
                .form-group input[type="password"] {
                    font-size: 16px; /* Évite le zoom sur mobile */
                }
            }

            /* Compatibilité avec Keycloak */
            #kc-content {
                width: 100%;
            }

            /* Gestion de l'affichage des messages */
            .alert {
                margin-bottom: 16px;
                padding: 12px;
                border-radius: 6px;
                font-size: 14px;
            }

            .alert-error {
                background-color: #fee2e2;
                color: #dc2626;
            }

            .alert-success {
                background-color: #dcfce7;
                color: #16a34a;
            }

            .alert-warning {
                background-color: #fef3c7;
                color: #d97706;
            }

            .alert-info {
                background-color: #dbeafe;
                color: #2563eb;
            }

            .message-text {
                display: block;
            }
        </style>

        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>

    <#elseif section = "form">

        <div class="kc-login-wrapper">

            <div class="login-container">

                <!-- Logo -->
                <div class="login-logo">
                    <img
                        src="${url.resourcesPath}/img/bjcollab-couleur.svg"
                        alt="BJCollab"
                    />
                </div>

                <!-- Message général -->
                <#if message?has_content>
                    <div class="alert alert-${message.type}">
                        <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                        <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                        <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                        <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                        <span class="message-text">${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>

                <form
                    id="kc-form-login"
                    class="login-form"
                    action="${url.loginAction}"
                    method="post"
                >

                    <!-- Email -->
                    <div class="form-group">
                        <label for="username">
                            Adresse Email
                        </label>

                        <input
                            id="username"
                            name="username"
                            type="text"
                            value="${login.username!''}"
                            autofocus
                            autocomplete="email"
                            placeholder="exemple@domaine.com"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span class="field-error">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <!-- Mot de passe -->
                    <div class="form-group">
                        <label for="password">
                            Mot de passe
                        </label>

                        <div style="position: relative;">
                            <input
                                id="password"
                                name="password"
                                type="password"
                                autocomplete="current-password"
                                placeholder="••••••••••••"
                            />

                            <label
                                class="visibility"
                                id="v"
                                onclick="togglePassword()"
                                style="
                                    position: absolute;
                                    right: 12px;
                                    top: 50%;
                                    transform: translateY(-50%);
                                    cursor: pointer;
                                    opacity: 0.54;
                                    display: flex;
                                    align-items: center;
                                "
                            >
                                <img id="vi" src="${url.resourcesPath}/img/eye-off.png" style="width: 20px; height: 20px;">
                            </label>
                        </div>

                        <#if messagesPerField.existsError('password')>
                            <span class="field-error">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <!-- Conditions -->
                    <div class="terms-group">
                        <input
                            id="acceptTerms"
                            name="acceptTerms"
                            type="checkbox"
                            required
                        />

                        <label for="acceptTerms">
                            J'accepte les
                            <a href="#">
                                conditions générales d'utilisation
                            </a>
                        </label>
                    </div>

                    <!-- Bouton -->
                    <button
                        type="submit"
                        class="btn-login"
                    >
                        Se connecter
                    </button>

                </form>

            </div>

        </div>

    </#if>

</@layout.registrationLayout>