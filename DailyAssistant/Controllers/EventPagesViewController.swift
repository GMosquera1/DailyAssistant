//
//  EventPagesViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/7/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class EventPagesViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        let initialPage = 1
        let page1 = WeatherDetailsViewController()
        let page2 = NearbyViewController()
        
        self.pages.append(page1)
        self.pages.append(page2)
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        self.pageControl.frame = CGRect()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        arrangeSubviews()
    }
//    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [String : Any]? = nil) {
//        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
//    }
//    func setRouter(introRouter: IntroRouter) {
//        self.introRouter = introRouter
//    }
//
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EventPagesViewController {
    
    func IntroViewController(_ IntroViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.pages.index(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return self.pages.last
            } else {
                // go to previous page in array
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func IntroViewController(_ IntroViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.pages.index(of: viewController) {
            if viewControllerIndex < self.pages.count - 1 {
                // go to next page in array
                return self.pages[viewControllerIndex + 1]
            } else {
                // wrap to first page in array
                return self.pages.first
            }
        }
        return nil
    }
    
    func IntroViewController(_ IntroViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // set the pageControl.currentPage to the index of the current viewController in pages
        if let viewControllers = IntroViewController.viewControllers {
            if let viewControllerIndex = self.pages.index(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
            }
        }
    }
    
    func setupUI() {
//
//        UIPageControl.do {
//            $0.numberOfPages = 4
//            $0.currentPage = 1
//            $0.pageIndicatorTintColor = .lightGray
//            $0.currentPageIndicatorTintColor = Theme.Colors.white
//        }
    }
    
    func arrangeSubviews() {
    //    self.view.addSubview(UIPageControl)
    }

}
