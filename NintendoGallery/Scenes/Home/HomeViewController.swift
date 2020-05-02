//
//  HomeViewController.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import ReactiveSwift
import UIKit

protocol HomeViewControllerDelegate: class {
    func didTapImage(_ source: HomeViewController, amiibo: Character.Amiibo)
    func didTapInfo(_ source: HomeViewController, amiibo: Character.Amiibo)
}

class HomeViewController: UIViewController {
    var tableView: UITableView = UITableView()
    var viewModel: HomeViewModel
    weak var delegate: HomeViewControllerDelegate?

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        setupScene()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.barTintColor = Asset.Colors.defaultDark.color
        navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = false
        title = "Character List"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        viewModel.outputs.characters.signal.observe(on: UIScheduler())
            .observeValues { [weak self] _ in
            if let self = self {
                self.tableView.reloadData()
            }
        }

        viewModel.inputs.viewDidLoad()
    }
}
