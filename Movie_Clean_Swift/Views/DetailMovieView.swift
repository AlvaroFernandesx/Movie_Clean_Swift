//
//  DetaildetailView.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 12/01/20.
//  Copyright © 2020 Álvaro Fernandes. All rights reserved.
//

import UIKit

class DetailMovieView: UIViewController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var guide: UILayoutGuide {
        return view.layoutMarginsGuide
    }
    
    private lazy var detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .cellGray
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
    
    private lazy var movieBackImageView: UIImageView = {
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
    
    func configureView(viewModel: HomeMovieModels.ViewModel) {
        movieTitleLabel.text = viewModel.title
        movieDescriptionLabel.text = viewModel.overview
        
        if let photoUrl = URL(string: viewModel.posterPath) {
            movieImageView.kf.setImage(with: photoUrl, placeholder: UIImage(systemName: "movie"))
        }
        
        if let photoBackUrl = URL(string: viewModel.backdrop) {
            movieBackImageView.kf.setImage(with: photoBackUrl, placeholder: UIImage(systemName: "movie"))
        }
    }
    
    func setupConstraints() {
        detailViewConstraint()
        movieImageConstraint()
        movieTitleLabelConstrait()
        movieDescriptionLabelConstrait()

    }
    
    func detailViewConstraint() {
        view.addSubview(detailView)
        detailView.topAnchor.constraint(equalTo: guide.topAnchor, constant: CGFloat(0)).isActive = true
        detailView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: CGFloat(0)).isActive = true
        detailView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: CGFloat(0)).isActive = true
        detailView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: CGFloat(0)).isActive = true
    }
    
    func movieBackImageConstraint() {
        view.addSubview(movieBackImageView)
        movieBackImageView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: CGFloat(0)).isActive = true
        movieBackImageView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: CGFloat(0)).isActive = true
        movieBackImageView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: CGFloat(0)).isActive = true
        movieBackImageView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: CGFloat(100)).isActive = true
    }
    
    func movieImageConstraint() {
        view.addSubview(movieImageView)
        movieImageView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: .movieImageViewTop).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: .movieImageViewLeading).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: .movieImageViewTrailing).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: .movieImageViewBottom).isActive = true
    }
    
    func movieTitleLabelConstrait() {
        view.addSubview(movieTitleLabel)
        movieTitleLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: .movieImageViewTop).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: .movieTitleLabelLeading).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: .movieImageViewBottom).isActive = true
    }
    
    func movieDescriptionLabelConstrait() {
        view.addSubview(movieDescriptionLabel)
        movieDescriptionLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 2).isActive = true
        movieDescriptionLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor).isActive = true
        movieDescriptionLabel.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor).isActive = true
        movieDescriptionLabel.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: .movieImageViewBottom).isActive = true
    }
    
}


