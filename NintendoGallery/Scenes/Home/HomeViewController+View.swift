//
//  HomeViewController+View.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import SnapKit
import UIKit

extension HomeViewController {
    func setupScene() {
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(CharacterTableViewCell.self)
        tableView.separatorInset = .zero
        tableView.dataSource = self

        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
