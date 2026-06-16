<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password'); section>

    <#if section = "header">

        <script src="https://cdn.tailwindcss.com"></script>

        <style>
            body, .card-pf {
                background-color: #f3f4f6;
                background-image: url("${url.resourcesPath}/img/arriere-plan-bjcollab.svg") !important;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                min-height: 100vh;
            }

            .login-container {
                background: rgba(255, 255, 255, 0.92);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-radius: 12px;
            }

            #kc-content {
                width: 100%;
            }

            .kc-login-wrapper {
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }
        </style>

    <#elseif section = "form">

        <div class="kc-login-wrapper">

            <div class="login-container p-8 max-w-md w-full">

                <!-- Logo -->
                <div class="flex justify-center">
                    <img
                        src="${url.resourcesPath}/img/bjcollab-couleur.svg"
                        alt="BJCollab"
                        class="w-60 h-45 object-contain"
                    />
                </div>
            
                <!-- Message général -->
                <#if message?has_content>
                    <div class="mb-4 p-3 rounded-md bg-red-100 text-red-700 text-sm">
                        ${kcSanitize(message.summary)?no_esc}
                    </div>
                </#if>

                <form
                    id="kc-form-login"
                    action="${url.loginAction}"
                    method="post"
                    class="space-y-4"
                >

                    <!-- Email -->
                    <div>
                        <label
                            for="username"
                            class="block text-sm font-medium text-gray-700 mb-1"
                        >
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
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-blue-300"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span class="text-red-500 text-sm">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <!-- Mot de passe -->
                    <div>
                        <label
                            for="password"
                            class="block text-sm font-medium text-gray-700 mb-1"
                        >
                            Mot de passe
                        </label>

                        <input
                            id="password"
                            name="password"
                            type="password"
                            autocomplete="current-password"
                            placeholder="••••••••"
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-blue-300"
                        />

                        <#if messagesPerField.existsError('password')>
                            <span class="text-red-500 text-sm">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <!-- Conditions -->
                    <div class="flex items-start">
                        <input
                            id="acceptTerms"
                            name="acceptTerms"
                            type="checkbox"
                            required
                            class="w-4 h-4 mt-1 text-blue-600 border-gray-300 rounded focus:ring-blue-500"
                        />

                        <label
                            for="acceptTerms"
                            class="ml-2 text-sm text-gray-700"
                        >
                            J'accepte les
                            <a
                                href="#"
                                class="text-blue-600 hover:underline"
                            >
                                conditions générales d'utilisation
                            </a>
                        </label>
                    </div>

                    <!-- Bouton -->
                    <button
                        type="submit"
                        class="w-full bg-[#1C6557] text-[13px] text-white py-2 px-4 rounded-md hover:bg-[#FED307] transition duration-200 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
                    >
                        Se connecter
                    </button>

                </form>

            </div>

        </div>

    </#if>

</@layout.registrationLayout>