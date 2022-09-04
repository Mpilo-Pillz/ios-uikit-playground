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
        mainView.likeAction = { [weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.liked = !strongSelf.liked
            if strongSelf.liked {
                UIView.animate(withDuration: 0.5, animations: {
                    strongSelf.mainView.likeButton.setTitle("Dislike", for: .normal)
                    strongSelf.mainView.contentView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                })
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    strongSelf.mainView.likeButton.setTitle("Like", for: .normal)
                    strongSelf.mainView.contentView.backgroundColor = .clear
                })
            }
            
            
        }
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
    var likeAction: (() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(contentView)
        self.addSubview(likeButton)
    }
    
    fileprivate func setupContentViewConstraints() {
        // remeber to add isactive true else it wont show on the screen cos contraint is not active
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        // assuming the negative so it does not get obstructed by the notch
        contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupLikeButtonConstraints() {
        //Like button
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        likeButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
    }
    
    func setupConstraints() {
        // for each view we build make sure to set this up
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        // content view contraints
        setupContentViewConstraints()
        //Like button
        setupLikeButtonConstraints()
        
    }
    
    func addActions() {
        likeButton.addTarget(self, action: #selector(self.onLikeButton), for: .touchUpInside)
    }
    
    @objc func onLikeButton() {
        likeAction?()
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

