//
//  ShowcaseViewController+View.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import Foundation

extension ShowcaseViewController {
    func setupScene() {
        setupImageView()
    }

    private func setupImageView() {
        imageView.backgroundColor = Asset.Colors.default.color
        imageView.contentMode = .scaleAspectFit

        view.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
