//
//  ShowcaseViewController.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import UIKit

class ShowcaseViewController: UIViewController {
    var imageView: UIImageView = UIImageView()
    var viewModel: ShowcaseViewModel

    init(viewModel: ShowcaseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        title = "Full Image"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        viewModel.outputs.imageUrl.signal.observeValues { [weak self] url in
            if let self = self {
                self.imageView.kf.setImage(with: url)
            }
        }

        viewModel.inputs.viewDidLoad()
    }
}
