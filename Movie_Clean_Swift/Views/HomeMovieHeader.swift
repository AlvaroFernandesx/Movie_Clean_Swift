//
//  HomeMovieHeader.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 02/01/20.
//  Copyright © 2020 Álvaro Fernandes. All rights reserved.
//

import UIKit
import Kingfisher

protocol HomeMovieHeaderDelegate: class {
    func searchBarFilter(_ text: String)
    func changeForPopular()
    func changeForNew()
}

class HomeMovieHeader: UIView, UISearchBarDelegate {
    
    weak var delegate: HomeMovieHeaderDelegate?
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cellGray
        view.layer.cornerRadius = 30
        view.endEditing(true)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideSearchBar)))
        
        return view
    }()
    
    private lazy var searchView: UIView = {
        let view = UIView()
        
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.forwardingTarget(for: #selector(hideSearchBar))
        
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.delegate = self
        searchBar.backgroundColor = .cellGray
        searchBar.alpha = 1
        
        return searchBar
    }()
    
    private lazy var searchButton: UIView = {
        let searchButton = UIView()
        var image = UIImageView(image: .lupa)
        searchButton.addSubview(image)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.layer.cornerRadius = 20
        searchButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showSearchBar)))
        searchButton.alpha = 1
        
        return searchButton
    }()
    
    private lazy var popularLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.init(name: "Chalkduster", size: 25)
        label.text = "Popular Movies"
        label.textColor = .fontWhite
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        
        return label
    }()
    
    private lazy var newMovieLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.init(name: "Chalkduster", size: 25)
        label.text = "New Movies"
        label.textColor = .fontWhite
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        
        return label
    }()
    
    private lazy var newMovieImage: UIImageView = {
        var imageView = UIImageView(image: .newMovie)
        
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.7
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showSearchBar)))
        
        return imageView
    }()
    
    
    private lazy var popularImage: UIImageView = {
        var imageView = UIImageView(image: .popular)
        
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.7
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideSearchBar)))
        
        return imageView
    }()
    
    private lazy var newMovieView: UIView = {
        var imageView = UIView()
        
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeForNew)))
        imageView.backgroundColor = .clear
        
        return imageView
    }()
    
    
    private lazy var popularView: UIView = {
        var imageView = UIView()
        
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeForPopular)))
        imageView.backgroundColor = .clear
        
        return imageView
    }()
    
    func setup() {
        setupViews()
        setupConstraints()
        setupExtraConfigurations()
    }
    
    func setupViews() {
        addSubview(contentView)
        contentView.addSubview(searchButton)
        contentView.addSubview(searchView)
        searchView.addSubview(searchBar)
        contentView.addSubview(newMovieImage)
        contentView.addSubview(newMovieLabel)
        contentView.addSubview(popularImage)
        contentView.addSubview(popularLabel)
        contentView.addSubview(newMovieView)
        contentView.addSubview(popularView)
    }
    
    func setupConstraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(-45)).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(0)).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(0)).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-10)).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: CGFloat(250)).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(0)).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-10)).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        searchView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(0)).isActive = true
        searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(0)).isActive = true
        searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-10)).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        newMovieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-15)).isActive = true
        newMovieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(200)).isActive = true
        newMovieImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-25)).isActive = true
        newMovieImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        popularImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-15)).isActive = true
        popularImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(25)).isActive = true
        popularImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-200)).isActive = true
        popularImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        newMovieLabel.bottomAnchor.constraint(equalTo: newMovieImage.bottomAnchor, constant: CGFloat(40)).isActive = true
        newMovieLabel.trailingAnchor.constraint(equalTo: newMovieImage.trailingAnchor, constant: CGFloat(-7)).isActive = true
        newMovieLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        newMovieLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        popularLabel.bottomAnchor.constraint(equalTo: popularImage.bottomAnchor, constant: CGFloat(40)).isActive = true
        popularLabel.leadingAnchor.constraint(equalTo: popularImage.leadingAnchor, constant: CGFloat(7)).isActive = true
        popularLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        popularLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        newMovieView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-15)).isActive = true
        newMovieView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(200)).isActive = true
        newMovieView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-25)).isActive = true
        newMovieView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        popularView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-15)).isActive = true
        popularView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(25)).isActive = true
        popularView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-200)).isActive = true
        popularView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupExtraConfigurations() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.01 * 1,
            animations: {
                self.contentView.alpha = 1
        }
        )
    }
    
//    @objc func hideKeyboard() {
//        UIView.endEditing(true)
//    }
    
    @objc func showSearchBar() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.01 * 1,
            animations: {
                self.searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
                self.searchButton.alpha = 0
                self.searchView.alpha = 1
        }
        )
    }
    
    @objc func hideSearchBar() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.01 * 1,
            animations: {
                self.searchButton.alpha = 1
                self.searchView.alpha = 0
                self.searchButton.removeFromSuperview()
        }
        )
        self.setup()
    }
    
    @objc func changeForPopular() {
        delegate?.changeForPopular()
    }
    
    @objc func changeForNew() {
        delegate?.changeForNew()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchBarFilter(searchText)
    }
    
}
