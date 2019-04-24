package com.links123.mofangxiu.webivew

import io.flutter.plugin.common.PluginRegistry.Registrar

/** WebviewFlutterPlugin  */
object WebviewFlutterPlugin {
    /** Plugin registration.  */
    fun registerWith(registrar: Registrar) {
        registrar.platformViewRegistry().registerViewFactory("plugins.flutter.io/webview", WebViewFactory(registrar.messenger()))
    }
}