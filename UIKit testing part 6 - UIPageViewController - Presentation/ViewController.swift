//
//  ViewController.swift
//  UIKit testing part 6 - UIPageViewController - Presentation
//
//  Created by Ihor Dolhalov on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPresentation()
        
    }
    func startPresentation() {
        if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController {
            present(pageViewController, animated: true, completion: nil)
        }
        
    }

}

