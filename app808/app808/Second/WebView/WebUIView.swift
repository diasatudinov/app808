//
//  WebUIView.swift
//  app808
//
//  Created by Dias Atudinov on 28.08.2024.
//

import SwiftUI
import WebKit

struct WebUIView: View {
    @State private var lastVisitedURL: URL? = UserDefaults.standard.url(forKey: "lastVisitedURL")
    @State var decodeString: String
    @State private var decodedString: String? = nil
    
    var body: some View {
        WebView(lastVisitedURL: $lastVisitedURL)
            .onAppear {
                decodeBase64String(base64String: decodeString)
                loadLastVisitedURL()
            }
            .onDisappear {
                saveLastVisitedURL()
            }
    }

    private func loadLastVisitedURL() {
        if let savedURL = UserDefaults.standard.url(forKey: "lastVisitedURL") {
            lastVisitedURL = savedURL
        } else {
            lastVisitedURL = URL(string: decodedString ?? "https://google.com")
        }
    }
    
    private func saveLastVisitedURL() {
        if let url = lastVisitedURL {
            UserDefaults.standard.set(url, forKey: "lastVisitedURL")
        }
    }
    
    func decodeBase64String(base64String: String) {
        if let data = Data(base64Encoded: base64String),
           let decoded = String(data: data, encoding: .utf8) {
            self.decodedString = decoded
            print(decodedString)
        } else {
            self.decodedString = "Decoding failed"
        }
    }
}

#Preview {
    WebUIView(decodeString: "aHR0cHM6Ly9wb2RsYW9ybGYuc3BhY2UvUmtZVzF5eW0")
}


struct WebView: UIViewControllerRepresentable {
    @Binding var lastVisitedURL: URL?

    func makeUIViewController(context: Context) -> WebViewController {
        let viewController = WebViewController()
        viewController.lastVisitedURL = lastVisitedURL
        return viewController
    }

    func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
        if let url = lastVisitedURL, url != uiViewController.webView.url {
            let request = URLRequest(url: url)
            uiViewController.webView.load(request)
        }
    }
}

class WebViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var lastVisitedURL: URL?

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        loadCookies(into: webView)
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = lastVisitedURL {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    private func loadCookies(into webView: WKWebView) {
        if let cookies = HTTPCookieStorage.shared.cookies {
            for cookie in cookies {
                webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
            }
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        HTTPCookieStorage.shared.cookies?.forEach { cookie in
            webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
        }
        if let url = webView.url {
            UserDefaults.standard.set(url, forKey: "lastVisitedURL")
        }
    }
}
