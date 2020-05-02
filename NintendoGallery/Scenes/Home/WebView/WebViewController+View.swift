//
//  WebViewController+View.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import UIKit

extension WebViewController {
    func setupScene() {
        setupWebView()
    }

    private func setupWebView() {
        view.addSubview(webview)

        webview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
