//
//  PeopleCollectionViewCell.swift
//  ProjectFive
//
//  Created by angel zambrano on 11/21/21.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
    private var imgview: UIImageView = UIImageView() // the image of the user
    private var nameLbl: UILabel = UILabel() // the name of the user
    private var yearLbl: UILabel = UILabel() // the year of the user
    
    override init(frame: CGRect) {
        super.init(frame: frame) // adds the frame into the super view
        // set up for the content viww
        contentView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1) // adds a background color to the content view
        contentView.addShadow2(offset: CGSize(width: 5 , height: 4), color: UIColor.init(red: 229/255, green: 229/255, blue: 229/255, alpha: 1), radius: 4, opacity: 1) // adds a shadow to the content view
        
        // set up for the name Label
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.font = UIFont.systemFont(ofSize: 16)
        nameLbl.textColor = .black
        nameLbl.text = "Gonzalo Li"
        contentView.addSubview(nameLbl)
        
        yearLbl.translatesAutoresizingMaskIntoConstraints = false
        yearLbl.font = UIFont.systemFont(ofSize: 12)
        yearLbl.textColor = .gray
        yearLbl.text = "Junior"
        contentView.addSubview(yearLbl)
        
        // adds the imgView
        imgview.translatesAutoresizingMaskIntoConstraints = false
        if let img = UIImage(named: "Avatar 2") {
            imgview.image = img
        }
       
        contentView.addSubview(imgview)
        setUpConstraints()
    }
    
    func setUpConstraints() {
     
        // sets the constrains for the imgView
        NSLayoutConstraint.activate([
            imgview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            imgview.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imgview.widthAnchor.constraint(equalToConstant: 78),
            imgview.heightAnchor.constraint(equalToConstant: 78)
        ])
        
        // set the constrains for the
        NSLayoutConstraint.activate([
            nameLbl.topAnchor.constraint(equalTo: imgview.bottomAnchor, constant: 10),
            nameLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            yearLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 4),
            yearLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    
    
    }
 
    // configure the collectionViewCell
    func configure(person: Person) {
        // TODO
        imgview.image = person.img
        nameLbl.text = person.name
        yearLbl.text = person.year
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


extension UIView {

  
    func addShadow2(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.cornerRadius = radius
        layer.backgroundColor = UIColor.white.cgColor
        layer.borderColor = UIColor.clear.cgColor
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity =  opacity
        layer.shadowRadius = radius
       backgroundColor = UIColor.init(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    }
}
