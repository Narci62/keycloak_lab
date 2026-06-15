<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password'); section>

    <#if section = "header">

        <script src="https://cdn.tailwindcss.com"></script>

        <div class="text-center">
            <h2 class="text-3xl font-extrabold text-gray-900">
                Espace Authentification
            </h2>
        </div>

    <#elseif section = "form">

        <div class="mt-8 bg-white p-8 rounded-lg shadow-md max-w-md mx-auto">

            <p class="text-sm text-gray-600 mb-6 text-center">
                Bienvenue sur notre laboratoire.
            </p>

            <form id="kc-form-login"
                  action="${url.loginAction}"
                  method="post"
                  class="space-y-4">

                <div>
                    <label for="username"
                           class="block text-sm font-medium text-gray-700 mb-1">
                        Nom d'utilisateur
                    </label>

                    <input id="username"
                           name="username"
                           type="text"
                           value="${(login.username!'')}"
                           autofocus
                           autocomplete="username"
                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-blue-300"/>

                    <#if messagesPerField.existsError('username')>
                        <span class="text-red-500 text-sm">
                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div>
                    <label for="password"
                           class="block text-sm font-medium text-gray-700 mb-1">
                        Mot de passe
                    </label>

                    <input id="password"
                           name="password"
                           type="password"
                           autocomplete="current-password"
                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-blue-300"/>

                    <#if messagesPerField.existsError('password')>
                        <span class="text-red-500 text-sm">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <#if realm.rememberMe && !usernameHidden>
                    <div class="flex items-center">
                        <input id="rememberMe"
                               name="rememberMe"
                               type="checkbox"
                               class="mr-2"
                               <#if login.rememberMe??>checked</#if>>

                        <label for="rememberMe">
                            Se souvenir de moi
                        </label>
                    </div>
                </#if>

                <button type="submit"
                        class="w-full bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700">
                    Se connecter
                </button>

            </form>

        </div>

    </#if>

</@layout.registrationLayout>