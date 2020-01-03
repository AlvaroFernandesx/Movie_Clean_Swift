//
//  HomeMovieFooter.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 02/01/20.
//  Copyright © 2020 Álvaro Fernandes. All rights reserved.
//

import UIKit

protocol HomeMovieFooterDelegate: class{
    func getMore()
}

class HomeMovieFooter: UIView {
    
    weak var delegate: HomeMovieFooterDelegate?
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cellGray
        view.layer.cornerRadius = 30
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(getMore)))
        
        return view
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        
        label.font = .configure(fontSize: 34, weight: .bold)
        label.textColor = .shadowGray
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Eu quero mais !"
        
        return label
    }()
    
    func setup() {
        setupViews()
        setupConstraints()

    }
    
    func setupViews() {
        addSubview(contentView)
        contentView.addSubview(bottomLabel)
    }
    
    func setupConstraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(10)).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(0)).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(0)).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-200)).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: CGFloat(500)).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: CGFloat(200)).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat(10)).isActive = true
        bottomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(10)).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CGFloat(-10)).isActive = true
        bottomLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CGFloat(-200)).isActive = true
        bottomLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        bottomLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    @objc func getMore() {
        delegate?.getMore()
    }

}
