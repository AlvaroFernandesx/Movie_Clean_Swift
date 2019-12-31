//
//  HomeMovieCell.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 30/12/19.
//  Copyright © 2019 Álvaro Fernandes. All rights reserved.
//

import Foundation
import UIKit

class HomeMovieCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var movieView: UIView = {
        let view = UIView()
        
//        view.backgroundColor = .cellGray
        view.backgroundColor = .red
        view.layer.cornerRadius = 6
        view.layer.shadowColor = UIColor.shadowGray?.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    private lazy var movieDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .configure(fontSize: 13, weight: .regular)
        label.textColor = .white
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "dasdasdasda"
        
        return label
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .configure(fontSize: 17, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "pind"
        
        return label
    }()
}


extension HomeMovieCell {
    
    func setup() {
        setupViews()
        setupConstraints()
        setupExtraConfigurations()
    }
    
    func setupViews() {
        contentView.addSubview(movieView)
        
        movieView.addSubview(movieImageView)
        movieView.addSubview(movieTitleLabel)
        movieView.addSubview(movieDescriptionLabel)
    }
    
    func setupConstraints() {
        movieView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat(26)).isActive = true
        movieView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(24)).isActive = true
        movieView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CGFloat(-24)).isActive = true
        movieView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CGFloat(-26)).isActive = true
        movieView.heightAnchor.constraint(equalToConstant: CGFloat(250)).isActive = true
        
        movieImageView.topAnchor.constraint(equalTo: movieView.topAnchor, constant: CGFloat(movieView.bounds.width)).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: movieView.leadingAnchor, constant: CGFloat(movieView.bounds.height)).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: CGFloat(150)).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: CGFloat(150)).isActive = true
        
        movieTitleLabel.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 2).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: CGFloat(16)).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: movieDescriptionLabel.leadingAnchor).isActive = true
        
        movieDescriptionLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 2).isActive = true
        movieDescriptionLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor).isActive = true
        movieDescriptionLabel.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor).isActive = true
        movieDescriptionLabel.bottomAnchor.constraint(equalTo: movieView.bottomAnchor, constant: CGFloat(-16)).isActive = true
    }
    
    func setupExtraConfigurations() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}
