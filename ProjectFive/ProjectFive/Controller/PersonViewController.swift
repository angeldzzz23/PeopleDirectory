//
//  PersonViewController.swift
//  ProjectFive
//
//  Created by angel zambrano on 11/21/21.
//

import UIKit

class PersonViewController: UIViewController {
    
    
    init(person: Person)  {
        super.init(nibName: nil, bundle: nil)
    
        // TODO:
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
