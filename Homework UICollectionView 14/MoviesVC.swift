//
//  MoviesVC.swift
//  Homework UICollectionView 14
//
//  Created by Павел Гарбацевич on 20.02.26.
//

import UIKit

class MoviesVC: UIViewController {
    
    // MARK: - Properties
    private let films: [FilmCellModel] = [
        FilmCellModel(
            imageName: "побег", title: "Побег из Шоушенка", dateOfCreationLabel: "1994", buttonFavorites: "heart.fill", indicatorWatchingOnline: true),
        FilmCellModel(
            imageName: "миля", title: "Зеленая миля", dateOfCreationLabel: "1990", buttonFavorites: "heart.fill", indicatorWatchingOnline: false),
        FilmCellModel(
            imageName: "Интер", title: "Интерстеллар", dateOfCreationLabel: "2014", buttonFavorites: "heart.fill", indicatorWatchingOnline: true),
        FilmCellModel(
            imageName: "Джентельмены", title: "Джентельмены", dateOfCreationLabel: "2019", buttonFavorites: "heart.fill", indicatorWatchingOnline: true),
        FilmCellModel(
            imageName: "остров", title: "Остров проклятых", dateOfCreationLabel: "2009", buttonFavorites: "heart.fill", indicatorWatchingOnline: true),
        FilmCellModel(
            imageName: "терминатор", title: "Терминатор 2: Судный день", dateOfCreationLabel: "1991", buttonFavorites: "heart.fill", indicatorWatchingOnline: true),
        FilmCellModel(
            imageName: "форест", title: "Форрест Гамп", dateOfCreationLabel: "1994", buttonFavorites: "heart.fill", indicatorWatchingOnline: true),
        FilmCellModel(
            imageName: "клуб", title: "Бойцовский клуб", dateOfCreationLabel: "1999", buttonFavorites: "heart.fill", indicatorWatchingOnline: true),
        FilmCellModel(
            imageName: "начало", title: "Начало", dateOfCreationLabel: "2010", buttonFavorites: "heart.fill", indicatorWatchingOnline: true),
        
    ]
    // MARK: - Subviews
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupViewProperties() {
        view.backgroundColor = .systemGray6
        title = "The best films of the world"
    }
    
    private func setupSubviews() {
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MoviesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return films.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: films[indexPath.item])
        
        return cell
    }
}


