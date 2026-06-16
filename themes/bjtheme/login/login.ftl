<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password'); section>

    <#if section = "header">

        <script src="https://cdn.tailwindcss.com"></script>

        <!-- Espace pour le logo -->
        <div class="flex justify-center mb-6">
            <div class="w-24 h-24 bg-gray-200 rounded-full flex items-center justify-center overflow-hidden">
                <img src="${url.resourcesPath}/img/logo.png" 
                     alt="Logo" 
                     class="w-full h-full object-cover"
                     onerror="this.onerror=null; this.src='https://placehold.co/100x100?text=Logo'">
            </div>
        </div>

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

                <!-- Champ Email -->
                <div>
                    <label for="username"
                           class="block text-sm font-medium text-gray-700 mb-1">
                        Adresse Email
                    </label>

                    <input id="username"
                           name="username"
                           type="email"
                           value="${(login.username!'')}"
                           autofocus
                           autocomplete="email"
                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-blue-300"
                           placeholder="exemple@domaine.com"/>

                    <#if messagesPerField.existsError('username')>
                        <span class="text-red-500 text-sm">
                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
                </div>

                <!-- Champ Mot de passe -->
                <div>
                    <label for="password"
                           class="block text-sm font-medium text-gray-700 mb-1">
                        Mot de passe
                    </label>

                    <input id="password"
                           name="password"
                           type="password"
                           autocomplete="current-password"
                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-blue-300"
                           placeholder="••••••••"/>

                    <#if messagesPerField.existsError('password')>
                        <span class="text-red-500 text-sm">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <!-- Case à cocher : J'accepte les conditions générales -->
                <div class="flex items-center">
                    <input id="acceptTerms"
                           name="acceptTerms"
                           type="checkbox"
                           required
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500"/>
                    
                    <label for="acceptTerms" class="ml-2 text-sm font-medium text-gray-700">
                        J'accepte les 
                        <a href="#" class="text-blue-600 hover:underline">conditions générales d'utilisation</a>
                    </label>
                </div>

                <!-- Bouton Se connecter -->
                <button type="submit"
                        class="w-full bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-colors">
                    Se connecter
                </button>

            </form>

        </div>

    </#if>

</@layout.registrationLayout>
