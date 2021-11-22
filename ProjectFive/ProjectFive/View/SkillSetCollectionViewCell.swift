//
//  SkillSetCollectionViewCell.swift
//  ProjectFive
//
//  Created by angel zambrano on 11/22/21.
//

import UIKit

class SkillSetCollectionViewCell: UICollectionViewCell {
    private var filtLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame) // adds the frame into the super view
        contentView.backgroundColor = .red
        
        filtLabel.translatesAutoresizingMaskIntoConstraints = false
        filtLabel.font = UIFont.systemFont(ofSize: 12)
        filtLabel.textColor = .black
        filtLabel.text = "WEED"
        contentView.addSubview(filtLabel)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        filtLabel.text = text
    }
    
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            filtLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filtLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    
    }
    
}
