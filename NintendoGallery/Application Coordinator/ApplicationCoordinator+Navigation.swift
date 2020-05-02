//
//  ApplicationCoordinator+Navigation.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import UIKit

extension ApplicationCoordinator {
    func displayHomeView() {
        let vm = HomeViewModel()
        let vc = HomeViewController(viewModel: vm)
        vc.delegate = self
        let navVc = UINavigationController(rootViewController: vc)
        self.window.rootViewController = navVc
    }

    func displayShowcaseView(amiibo: Character.Amiibo) {
        if let navVc = self.window.rootViewController as? UINavigationController {
            let vm = ShowcaseViewModel()
            vm.inputs.preselect(amiibo: amiibo)
            let vc = ShowcaseViewController(viewModel: vm)
            navVc.pushViewController(vc, animated: true)
        }
    }

    func displayWebView(amiibo: Character.Amiibo) {
        if let navVc = self.window.rootViewController as? UINavigationController {
            let vm = WebViewModel()
            vm.inputs.preselect(amiibo: amiibo)
            let vc = WebViewController(viewModel: vm)
            navVc.pushViewController(vc, animated: true)
        }
    }
}
