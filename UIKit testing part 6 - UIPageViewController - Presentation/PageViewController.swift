//
//  PageViewController.swift
//  UIKit testing part 6 - UIPageViewController - Presentation
//
//  Created by Ihor Dolhalov on 22.08.2022.
//

import UIKit

class PageViewController: UIPageViewController {

    let presentScreenContent = [
        "First page tell us about ......",
        "Second page tell us about ......",
        "Third page tell us about ......",
        "Last page tell us about ......"
    ]
    let emojiArray = ["😀","🤣","😇","🥹"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else {return nil}
        guard index < presentScreenContent.count else {return nil}
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else {return nil}
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        
        return contentViewController
    }
}
extension PageViewController: UIPageViewControllerDataSource {
    

func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    var pageNumber = (viewController as! ContentViewController).currentPage
    pageNumber = pageNumber-1
    return showViewControllerAtIndex(pageNumber)
}

func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    var pageNumber = (viewController as! ContentViewController).currentPage
    pageNumber = pageNumber+1
    return showViewControllerAtIndex(pageNumber)
}

}
