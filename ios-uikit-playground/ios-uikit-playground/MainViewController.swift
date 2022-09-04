//
//  ViewController.swift
//  ios-uikit-playground
//
//  Created by Mpilo Pillz on 2022/09/04.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainView: MainView { return self.view as! MainView}
    // introduce state
    var liked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.likeAction = { [weak self ] in self?.likeAction()
//            self.liked = !strongSelf.liked

            
//            guard let strongSelf = self else { return }
            
            
            
        }
        // Do any additional setup after loading the view.
    }
    
    func likeAction() {
        self.liked = !self.liked
        if self.liked {
            UIView.animate(withDuration: 0.5, animations: {
                self.mainView.likeButton.setTitle("Dislike", for: .normal)
                self.mainView.contentView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.mainView.likeButton.setTitle("Like", for: .normal)
                self.mainView.contentView.backgroundColor = .clear
            })
        }
    }
    
    override func loadView() {
        // makes it the size of the screen
        self.view = MainView(frame: UIScreen.main.bounds)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

