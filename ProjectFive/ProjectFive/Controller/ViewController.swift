//
//  ViewController.swift
//  ProjectFive
//
//  Created by angel zambrano on 11/21/21.
//

import UIKit


class Filter {
    var name: String
    var selected: Bool = false
    
    init(name: String, selected: Bool) {
        self.name = name
        self.selected = selected
    }
    
    func isSelected() ->Bool {
        return selected
    }
    
}


class ViewController: UIViewController {
    
    // views
    private var filtCollectionView: UICollectionView! // the filter collection view
    private var peopleCollectionView: UICollectionView! // the collection that displays people
    private var filterLabel: UILabel = UILabel() // the filter label that describes the collection
    private var peopleLabel: UILabel = UILabel() // the
    // data
    private var filtersSec: [String] = [] // the sections of the filter
    private var filters: [Filter] = [] // the filters
    private var people: [Person] = [] // the people
    
    // Constants for the filter collection view
    private let filtCellReuseIdentifier = "colorCellReuseIdentifier"
    private let filtheaderReuseIdentifier = "headerReuseIdentifier"
    private let peopleCellReuseIdentifier = "peopleCellReuseIdentifier"
    private let peopleHeaderReuseIdentifier = "plpheaderReuse"
    private let cellPadding: CGFloat = 8
    private let pCellPadding:CGFloat = 8
    private let sectionPadding: CGFloat = 4
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
       filtersSec = ["iOS", "Backend", "Android", "Marketing", "Design", "Indica", "Sativa"]
        
        filters = [Filter(name:"iOS", selected:  false), Filter(name:"Backend", selected:  false), Filter(name:"Android", selected:  false), Filter(name:"Marketing", selected:  false), Filter(name:"Design", selected:  false), Filter(name:"Indica", selected:  false),Filter(name:"Sativa", selected:  false) ]
        
        people = [
            Person(name: "Angel Zam", year: "Freshman", skillSet: [.ios, .design, .indica], img: UIImage(named: "Avatar 2")!),
            Person(name: "David Ray", year: "Freshman", skillSet: [.ios, .backend, .indica, .sativa, .marketing, .android], img: UIImage(named: "Avatar 2")!),
            Person(name: "Steve J", year: "Junior", skillSet: [.backend, .android, .indica, .design], img: UIImage(named: "Avatar 2")!),
            Person(name: "Marcky Jam", year: "Senior", skillSet: [.ios, .marketing, .indica], img: UIImage(named: "Avatar 2")!),
            Person(name: "Jam Bam", year: "Senior", skillSet: [.ios, .backend, .indica], img: UIImage(named: "Avatar 2")!),
            Person(name: "Coffee Creamer", year: "Freshman", skillSet: [.ios, .backend, .indica], img: UIImage(named: "Avatar 2")!),
            Person(name: "Mon ster", year: "Junior", skillSet: [.marketing, .backend, .indica], img: UIImage(named: "Avatar 2")!),
            Person(name: "Red Zam", year: "Freshman", skillSet: [.ios, .sativa, .indica, .android, .design, .backend], img: UIImage(named: "Avatar 2")!),
        ]
        
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.font = UIFont.boldSystemFont(ofSize: 12)
        filterLabel.textColor =  UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        filterLabel.text = "FILTER BY"
        view.addSubview(filterLabel)
        
        peopleLabel.translatesAutoresizingMaskIntoConstraints = false
        peopleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        peopleLabel.textColor =  UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        peopleLabel.text = "PEOPLE"
        view.addSubview(peopleLabel)
        
        
//        // set up the filtCollectionView
//
        // TODO 2: Setup flow layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = cellPadding
        layout.minimumLineSpacing = cellPadding

        let peopleLayout = UICollectionViewFlowLayout()
        peopleLayout.scrollDirection = .vertical
        peopleLayout.minimumInteritemSpacing = pCellPadding
        peopleLayout.minimumLineSpacing = pCellPadding
        peopleLayout.sectionInset = UIEdgeInsets(top: pCellPadding, left: 0, bottom: pCellPadding, right: 0)

        
        
        
        
        // TODO 1: Instantiate collectionView
        filtCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        filtCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filtCollectionView.backgroundColor = .clear

        peopleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: peopleLayout)
        peopleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        peopleCollectionView.backgroundColor = .clear
        
        
        
        
        // TODO 3: Create collection view cell and register it here.
        // TODO 3a: Add content to collection view cell.
        // TODO 3b: Create function to configure collection view cell.
        filtCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filtCellReuseIdentifier)
        peopleCollectionView.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier: peopleCellReuseIdentifier)
      
        
//        // TODO 6: Create section header and register it here.
//        // TODO 6a: Add content to section header.
//        // TODO 6b: Create function to configure section header.
        filtCollectionView.register(FilterHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: filtheaderReuseIdentifier)
        


//        // TODO 4: Extend collection view data source.
        filtCollectionView.dataSource = self
        peopleCollectionView.dataSource = self
//
//        // TODO 5: Extend collection view delegate.
        filtCollectionView.delegate = self
        peopleCollectionView.delegate = self
//
//
        view.addSubview(filtCollectionView)
        view.addSubview(peopleCollectionView)
        setupConstraints()
    }
    
    
    // sets up the constraints for the collectionViews
    func setupConstraints() {
      
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            filterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
        ])
        
        
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            filtCollectionView.topAnchor.constraint(equalTo: filterLabel.topAnchor, constant: collectionViewPadding),
            filtCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            filtCollectionView.heightAnchor.constraint(equalToConstant: 60),
            filtCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
        
        NSLayoutConstraint.activate([
            peopleLabel.topAnchor.constraint(equalTo: filtCollectionView.bottomAnchor, constant: 20),
            peopleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            peopleCollectionView.topAnchor.constraint(equalTo: peopleLabel.bottomAnchor, constant: 4),
            peopleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding * 2),
            peopleCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            peopleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(collectionViewPadding * 2))
        
        ])
        
    }
    

    
//    // Finish implementing
//    @objc func presentChangePictureViewControllerButtonPressed() {
//        // TODO: create VC to present
//        let presentViewController =  ChangeMyPictureViewController(nameOfChosenImg: Profile.imageName)
//        // TODO: update delegate
//        presentViewController.delegate = self // we are passing self as delegate
//        self.present(presentViewController, animated: true, completion: nil)
//    }

}




extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.filtCollectionView {
            return filtersSec.count
        }
        
        // returns the number of
        return people.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        if collectionView == self.filtCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filtCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            cell.configure(filter: filters[indexPath.item])
            return cell
        } else { // takes care of the second
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: peopleCellReuseIdentifier, for: indexPath) as! PeopleCollectionViewCell
            cell.configure(person: people[indexPath.item])
            return cell
        }
        

    }

}


extension ViewController: UICollectionViewDelegateFlowLayout {
    // TODO 5a: override default flow (optional, has default flow).
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.filtCollectionView {
            let label = UILabel(frame: CGRect.zero)
            label.text = filtersSec[indexPath.item]
            label.sizeToFit()
            let size = label.frame.width

            return CGSize(width: size + 12, height: 32 )
        } else {
            let size = (collectionView.frame.width - (pCellPadding) ) / 2
            
            return CGSize(width:size, height: size )
        }
        
     

    }

}

    // allows the user to select
extension ViewController: UICollectionViewDelegate {
    // TODO 9: provide selection functionality
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        // select the correct collection view
        if collectionView == self.filtCollectionView {
            filters.forEach({$0.selected = false}) // deselects
            
            filters[indexPath.item].selected = !filters[indexPath.item].selected
            collectionView.reloadData()
        } else {
            let presentViewController = PersonViewController(person: people[indexPath.item])
            //        // TODO: update delegate
            self.present(presentViewController, animated: true, completion: nil)
        }
      
    }
}


