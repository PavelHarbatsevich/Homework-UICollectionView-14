//
//  PhotoCell.swift
//  Homework UICollectionView 14
//
//  Created by Павел Гарбацевич on 20.02.26.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    // MARK: - Properties
    
    static let identifier: String = "PhotoCell"
    
    // MARK: - Subviews
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateOfCreationLabel = UILabel()
    private let buttonFavorites = UIButton(type: .system)
    private let indicatorWatchingOnline = UIImageView()
    
    var isLiked: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewProperties()
        setupSubviews()
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        dateOfCreationLabel.text = nil
        buttonFavorites.isSelected = false
        indicatorWatchingOnline.isHidden = true
    }
    
    
    private func setupViewProperties() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
    }
    
    private func setupSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .systemGroupedBackground
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 1
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        dateOfCreationLabel.translatesAutoresizingMaskIntoConstraints = false
        dateOfCreationLabel.textAlignment = .center
        dateOfCreationLabel.numberOfLines = 1
        dateOfCreationLabel.textColor = .black
        dateOfCreationLabel.font = .systemFont(ofSize: 12)
        
        buttonFavorites.translatesAutoresizingMaskIntoConstraints = false
        buttonFavorites.tintColor = .systemGray
        buttonFavorites.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        buttonFavorites.layer.cornerRadius = 5
        buttonFavorites.backgroundColor = .clear
        buttonFavorites.addTarget(self, action: #selector(buttonLike), for: .touchUpInside)
        
        
        indicatorWatchingOnline.translatesAutoresizingMaskIntoConstraints = false
        indicatorWatchingOnline.tintColor = UIColor.white
        indicatorWatchingOnline.layer.cornerRadius = 10
        indicatorWatchingOnline.backgroundColor = .green
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateOfCreationLabel)
        contentView.addSubview(buttonFavorites)
        contentView.addSubview(indicatorWatchingOnline)
        
        
    }
    // MARK: - обработка нажатия на сердце)
    
    @objc private func buttonLike() {
        if isLiked {
            buttonFavorites.tintColor = .systemGray
        } else {
            buttonFavorites.tintColor = .systemRed
        }
        isLiked.toggle()
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            dateOfCreationLabel.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor),
            dateOfCreationLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            dateOfCreationLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            buttonFavorites.widthAnchor.constraint(equalToConstant: 30),
            buttonFavorites.heightAnchor.constraint(equalToConstant: 30),
            buttonFavorites.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            indicatorWatchingOnline.heightAnchor.constraint(equalToConstant: 10),
            indicatorWatchingOnline.widthAnchor.constraint(equalToConstant: 10),
            indicatorWatchingOnline.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            indicatorWatchingOnline.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
        ])
        
    }
    func configure(with model: FilmCellModel) {
        imageView.image = UIImage(named: model.imageName)
        titleLabel.text = model.title
        dateOfCreationLabel.text = model.dateOfCreationLabel
        buttonFavorites.isSelected = model.imageName.contains("heart.fill")
        indicatorWatchingOnline.isHidden = !model.indicatorWatchingOnline
        
    }
    
}
