//
//  PictureDetailViewController.swift
//  HackingSwift1
//
//  Created by Franklin Buitron on 5/7/18.
//  Copyright © 2018 Franklin Buitron. All rights reserved.
//

import UIKit

class PictureDetailViewController: UIViewController {

    var pictureUIImageView = UIImageView()
    var pictureName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let pictureDir = self.pictureName {
            self.title = pictureDir
            self.view.backgroundColor = UIColor.white
            self.pictureUIImageView.image = UIImage(named: pictureDir)
            self.pictureUIImageView.frame = self.view.bounds
            self.pictureUIImageView.contentMode = UIViewContentMode.scaleAspectFit
            self.view.addSubview(pictureUIImageView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.hidesBarsOnTap = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController?.hidesBarsOnTap ?? false
    }

}
