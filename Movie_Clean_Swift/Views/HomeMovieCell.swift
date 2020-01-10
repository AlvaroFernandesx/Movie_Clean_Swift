//
//  HomeMovieCell.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 30/12/19.
//  Copyright © 2019 Álvaro Fernandes. All rights reserved.
//

import UIKit
import Kingfisher

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
        view.endEditing(true)
        view.backgroundColor = .cellGray
        view.layer.cornerRadius = 20
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
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .configure(fontSize: 20, weight: .bold)
        label.textColor = .shadowGray
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
       
        return label
    }()
    
    private lazy var movieDescriptionLabel: UITextView = {
        let textView = UITextView()
        
        textView.font = .configure(fontSize: 15, weight: .semibold)
        textView.textColor = .fontWhite
        textView.textAlignment = .center
        textView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.backgroundColor = .clear
        
        return textView
    }()
    
}


extension HomeMovieCell {
    
    func configureCell(viewModel: HomeMovieModels.ViewModel) {
        movieTitleLabel.text = viewModel.title
        movieDescriptionLabel.text = viewModel.overview
        
        if let photoUrl = URL(string: viewModel.posterPath) {
            movieImageView.kf.setImage(with: photoUrl, placeholder: UIImage(systemName: "movie"))
        }
    }
    
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
        movieView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat(10)).isActive = true
        movieView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .movieViewLeading).isActive = true
        movieView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .movieViewTrailing).isActive = true
        movieView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .movieViewBottom).isActive = true
        movieView.heightAnchor.constraint(equalToConstant: .movieImageViewHeigth).isActive = true
        
        movieImageView.topAnchor.constraint(equalTo: movieView.topAnchor, constant: .movieImageViewTop).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: movieView.leadingAnchor, constant: .movieImageViewLeading).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: .movieImageViewTrailing).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: movieView.bottomAnchor, constant: .movieImageViewBottom).isActive = true
        
        movieTitleLabel.topAnchor.constraint(equalTo: movieView.topAnchor, constant: .movieImageViewTop).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: movieView.leadingAnchor, constant: .movieTitleLabelLeading).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: .movieImageViewBottom).isActive = true

        movieDescriptionLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 2).isActive = true
        movieDescriptionLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor).isActive = true
        movieDescriptionLabel.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor).isActive = true
        movieDescriptionLabel.bottomAnchor.constraint(equalTo: movieView.bottomAnchor, constant: .movieImageViewBottom).isActive = true
    }
    
    func setupExtraConfigurations() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}
