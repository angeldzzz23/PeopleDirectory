//
//  PersonViewController.swift
//  ProjectFive
//
//  Created by angel zambrano on 11/21/21.
//

import UIKit

class PersonViewController: UIViewController {
    
    // views
    private var skillSetCollectionView: UICollectionView!
    private var dissmissButton = UIButton() // the exit button
    private var topView = UIView()
    private var imgView: UIImageView = UIImageView() // the image view of the user
    private var nameLbl: UILabel = UILabel() //  the name of the user
    private var yearLbl: UILabel = UILabel() // the const name of the year
    private var actYearLbl: UILabel = UILabel() // the actual grade year label of the user
    private var skillSet: UILabel = UILabel() // the
    
    // constants
    private let skillSetReuseIdentifier = "skillsetReuseIdentifier"
    private let cellPadding: CGFloat = 8
    private let sectionPadding: CGFloat = 4
    
    
    
    lazy var person: Person  = Person(name: "", year: "", skillSet: [.backend, .design, .ios], img: UIImage(named: "Avatar 2")!)
    
    var skills: [String] = []
    
    
    init(person: Person)  {
        super.init(nibName: nil, bundle: nil)
        self.person = person
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        skills = ["iOS", "Backend", "Python", "oCaml", "Photography", "hello", "iphone" , "calcul", "coffee"]
        
        // adding the top view
        topView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1) // sets the color to grey
        topView.translatesAutoresizingMaskIntoConstraints = false // sets the contraints
        view.addSubview(topView)
        
        dissmissButton.setTitle("x", for: .normal)
        dissmissButton.backgroundColor = .clear
        dissmissButton.setTitleColor(UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1), for: .normal)
        dissmissButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        dissmissButton.translatesAutoresizingMaskIntoConstraints = false // sets the contraints
        dissmissButton.addTarget(self, action: #selector(exitButtonWasPressed), for: .touchUpInside)
        view.addSubview(dissmissButton)
        
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = person.img
        view.addSubview(imgView)
        
        // the name label of the user
        nameLbl.text = person.name
        nameLbl.textColor = .black
        nameLbl.font = UIFont.systemFont(ofSize: 24)
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLbl)
        
        
        // sets up the users year label
        yearLbl.text = "YEAR"
        yearLbl.textColor = .gray
        yearLbl.font = UIFont.systemFont(ofSize: 12)
        yearLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearLbl)
        
        actYearLbl.text = person.year
        actYearLbl.font = UIFont.systemFont(ofSize: 18)
        actYearLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actYearLbl)
        
        skillSet.text = "Skillset"
        skillSet.textColor = .gray
        skillSet.font = UIFont.systemFont(ofSize: 12)
        skillSet.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(skillSet)
        
        // TODO 2: Setup flow layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = cellPadding
        layout.minimumLineSpacing = cellPadding
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        
        
        // TODO 1: Instantiate collectionView
        skillSetCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        skillSetCollectionView.translatesAutoresizingMaskIntoConstraints = false
        skillSetCollectionView.backgroundColor = .purple
        
        // TODO 3: Create collection view cell and register it here.
        // TODO 3a: Add content to collection view cell.
        // TODO 3b: Create function to configure collection view cell.
        skillSetCollectionView.register(SkillSetCollectionViewCell.self, forCellWithReuseIdentifier: skillSetReuseIdentifier)
        // TODO 6: Create section header and register it here.
        // TODO 6a: Add content to section header.
        // TODO 6b: Create function to configure section header.
        // None for this since I have no header
        
        
        // TODO 4: Extend collection view data source.
        skillSetCollectionView.dataSource = self
        // TODO 5: Extend collection view delegate.
        skillSetCollectionView.delegate = self

        view.addSubview(skillSetCollectionView)
        
        
        setUpConstraints()
    }
    
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topView.heightAnchor.constraint(equalToConstant: 315)
        ])
        
        
//        // add the exit button
        NSLayoutConstraint.activate([
            dissmissButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 4),
            dissmissButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 13)
        ])
        
        // the constraints for the imgView
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 68),
            imgView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            imgView.widthAnchor.constraint(equalToConstant: 165),
            imgView.heightAnchor.constraint(equalToConstant: 165)
        ])
        
        // the constraints for the name label
        NSLayoutConstraint.activate([
            nameLbl.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 16),
            nameLbl.centerXAnchor.constraint(equalTo: topView.centerXAnchor)
        ])
        
        // adding the year label
        NSLayoutConstraint.activate([
            yearLbl.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            yearLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            actYearLbl.topAnchor.constraint(equalTo: yearLbl.bottomAnchor, constant: 8),
            actYearLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // does the constraints for the skill set label
        NSLayoutConstraint.activate([
            skillSet.topAnchor.constraint(equalTo: actYearLbl.bottomAnchor, constant: 32),
            skillSet.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            skillSetCollectionView.topAnchor.constraint(equalTo: skillSet.bottomAnchor, constant: 8),
            skillSetCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 125),
            skillSetCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            skillSetCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -126)
            
        ])
        
    
    }
    
    // dismmiss the viewcontroller
    @objc func exitButtonWasPressed(button: UIButton) {
        // dismiss viewcontroller
        self.dismiss(animated: true, completion: nil)
    }

}


//
extension PersonViewController: UICollectionViewDataSource {
    
    // TODO 4b: specify number of items in section (required).
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skills.count
    }
    
    
    // TODO 4a: specify cell to return (required).
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: skillSetReuseIdentifier, for: indexPath) as! SkillSetCollectionViewCell
        // configure data for cell
        
        cell.configure(text: skills[indexPath.item])
//        cell.configure(for: colors[indexPath.section][indexPath.item])// item is basically row
        
        return cell
    }
  
}

extension PersonViewController: UICollectionViewDelegateFlowLayout {
    // TODO 5a: override default flow (optional, has default flow).
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        let noOfCellsInRow = 1
        
        

         let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

         let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

         let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size - Int(CGFloat(sectionPadding)), height: 32)
        
        
        
        


//        return CGSize(width: size, height: 32 )
    }
  
}
