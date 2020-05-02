//
//  HomeViewController+TableView.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.outputs.characters.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CharacterTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(amiibo: viewModel.outputs.characters.value[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: CharacterTableViewCellDelegate {
    func didTapImage(_ cell: CharacterTableViewCell, amiibo: Character.Amiibo) {
        self.delegate?.didTapImage(self, amiibo: amiibo)
    }

    func didTapInfo(_ cell: CharacterTableViewCell, amiibo: Character.Amiibo) {
        self.delegate?.didTapInfo(self, amiibo: amiibo)
    }
}
