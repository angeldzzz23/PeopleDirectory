//
//  FilterHeaderView.swift
//  ProjectFive
//
//  Created by angel zambrano on 11/21/21.
//

import UIKit

class FilterHeaderView: UICollectionReusableView {
    private var label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    //  TODO 6a-i: styling for headerView
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .gray
        addSubview(label)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setTitle(title: String) {
        label.text = title
    }
    
    // if you use storyboards
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
