//
//  CharacterTableViewCell.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import Kingfisher
import UIKit

protocol CharacterTableViewCellDelegate: class {
    func didTapImage(_ cell: CharacterTableViewCell, amiibo: Character.Amiibo)
    func didTapInfo(_ cell: CharacterTableViewCell, amiibo: Character.Amiibo)
}

class CharacterTableViewCell: UITableViewCell, ReusableView {
    private var characterImageView: UIImageView = UIImageView()
    private var infoContainerView: UIView = UIView()
    private var nameLabel: UILabel = UILabel()
    private var seriesLabel: UILabel = UILabel()
    weak var delegate: CharacterTableViewCellDelegate?
    var amiibo: Character.Amiibo?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupCharacterImageView()
        setupNameLabel()
        setupSeriesLabel()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func setup(amiibo: Character.Amiibo) {
        nameLabel.text = "Name: \(amiibo.character)"
        seriesLabel.text = "Series: \(amiibo.gameSeries)"
        self.amiibo = amiibo
        guard let url = URL(string: amiibo.image) else { return }
        characterImageView.kf.setImage(with: url)
    }

    private func setupCell() {
        selectionStyle = .none
        setupCharacterImageView()
        setupInfoContainerView()
        setupNameLabel()
        setupSeriesLabel()
    }

    private func setupCharacterImageView() {
        characterImageView.contentMode = .scaleAspectFit
        characterImageView.backgroundColor = Asset.Colors.default.color
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        characterImageView.isUserInteractionEnabled = true
        characterImageView.addGestureRecognizer(singleTap)

        addSubview(characterImageView)

        characterImageView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(6).offset(20)
            make.height.equalTo(characterImageView.snp.width).multipliedBy(2)
        }
    }

    private func setupInfoContainerView() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(infoTapped))
        infoContainerView.isUserInteractionEnabled = true
        infoContainerView.addGestureRecognizer(singleTap)

        addSubview(infoContainerView)

        infoContainerView.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(characterImageView.snp.right)
        }
    }

    private func setupNameLabel() {
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.numberOfLines = 0

        infoContainerView.addSubview(nameLabel)

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-10)
            make.left.equalTo(characterImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-10)
        }
    }

    private func setupSeriesLabel() {
        seriesLabel.font = .systemFont(ofSize: 14)
        seriesLabel.numberOfLines = 0
        seriesLabel.textColor = .gray

        infoContainerView.addSubview(seriesLabel)

        seriesLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(characterImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-10)
        }
    }

    @objc private func imageTapped() {
        guard let amiibo = self.amiibo else { return }
        self.delegate?.didTapImage(self, amiibo: amiibo)
    }

    @objc private func infoTapped() {
        guard let amiibo = self.amiibo else { return }
        self.delegate?.didTapInfo(self, amiibo: amiibo)
    }
}

