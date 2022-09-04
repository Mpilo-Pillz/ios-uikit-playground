//
//  ViewController.swift
//  ios-uikit-playground
//
//  Created by Mpilo Pillz on 2022/09/04.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainView: MainView { return self.view as! MainView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        // makes it the size of the screen
        self.view = MainView(frame: UIScreen.main.bounds)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

class MainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(contentView)
        self.addSubview(likeButton)
    }
    
    // create the first view
    let contentView: UIView = {
        // put in in a frame
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    // create the button
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Like", for: .normal)
        return button
    }()
}

