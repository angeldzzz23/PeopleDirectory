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
    // data
    private var filtersSec: [String] = [] // the sections of the filter
    private var filters: [Filter] = []
    
    // Constants for the filter collection view
    private let filtCellReuseIdentifier = "colorCellReuseIdentifier"
    private let filtheaderReuseIdentifier = "headerReuseIdentifier"
    private let cellPadding: CGFloat = 8
    private let sectionPadding: CGFloat = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
       filtersSec = ["iOS", "Backend", "Android", "Marketing", "Design", "Indica", "Sativa"]
        
        filters = [Filter(name:"iOS", selected:  false), Filter(name:"Backend", selected:  false), Filter(name:"Android", selected:  false), Filter(name:"Marketing", selected:  false), Filter(name:"Design", selected:  false), Filter(name:"Indica", selected:  false),Filter(name:"Sativa", selected:  false) ]
        
        
        
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
//        filterLabel.font = UIFont.systemFont(ofSize: 12)
        filterLabel.font = UIFont.boldSystemFont(ofSize: 12)
        filterLabel.textColor =  UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        filterLabel.text = "Filter By"
        
 
        view.addSubview(filterLabel)
        
        
//        // set up the filtCollectionView
//
        // TODO 2: Setup flow layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = cellPadding
        layout.minimumLineSpacing = cellPadding
//        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
//
        // TODO 1: Instantiate collectionView
        filtCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        filtCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filtCollectionView.backgroundColor = .clear
//
//        // TODO 3: Create collection view cell and register it here.
//        // TODO 3a: Add content to collection view cell.
//        // TODO 3b: Create function to configure collection view cell.
        filtCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filtCellReuseIdentifier)
//        // TODO 6: Create section header and register it here.
//        // TODO 6a: Add content to section header.
//        // TODO 6b: Create function to configure section header.
        filtCollectionView.register(FilterHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: filtheaderReuseIdentifier)
//
//
//
//        // TODO 4: Extend collection view data source.
        filtCollectionView.dataSource = self
//
//        // TODO 5: Extend collection view delegate.
        filtCollectionView.delegate = self
//
//
        view.addSubview(filtCollectionView)
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
    }


}



//
extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtersSec.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filtCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
//        cell.configure(for: filtersSec[indexPath.item])
        cell.configure(filter: filters[indexPath.item])

        return cell
    }

}


extension ViewController: UICollectionViewDelegateFlowLayout {
    // TODO 5a: override default flow (optional, has default flow).
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let label = UILabel(frame: CGRect.zero)
        label.text = filtersSec[indexPath.item]
        label.sizeToFit()
        let size = label.frame.width

        return CGSize(width: size + 12, height: 32 )

    }

}

extension ViewController: UICollectionViewDelegate {
    // TODO 9: provide selection functionality
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        filters.forEach({$0.selected = false}) // deselects
        
        filters[indexPath.item].selected = !filters[indexPath.item].selected
        collectionView.reloadData()
    }
}


