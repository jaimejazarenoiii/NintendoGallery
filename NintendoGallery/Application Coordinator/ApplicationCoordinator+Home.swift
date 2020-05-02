//
//  ApplicationCoordinator+Home.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import UIKit

extension ApplicationCoordinator: HomeViewControllerDelegate {
    func didTapImage(_ source: HomeViewController, amiibo: Character.Amiibo) {
        displayShowcaseView(amiibo: amiibo)
    }

    func didTapInfo(_ source: HomeViewController, amiibo: Character.Amiibo) {
        displayWebView(amiibo: amiibo)
    }
}
