//
//  HomeMovieHeader.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 02/01/20.
//  Copyright © 2020 Álvaro Fernandes. All rights reserved.
//

import UIKit

protocol HomeMovieHeaderDelegate: class {
    func searchBarFilter(_ text: String)
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
        
        view.alpha = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cellGray
        view.layer.cornerRadius = 30
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
    }
    
    func setupConstraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(-45)).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(0)).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(0)).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-10)).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: CGFloat(300)).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: CGFloat(200)).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(0)).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-10)).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        searchView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(0)).isActive = true
        searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(0)).isActive = true
        searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-10)).isActive = true
        searchView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchBarFilter(searchText)
    }

}
