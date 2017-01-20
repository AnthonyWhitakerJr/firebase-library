//
//  DataViewController.swift
//  LibraryApp_Firebase
//
//  Created by Anthony Whitaker on 1/13/17.
//  Copyright © 2017 Anthony Whitaker. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var pageImageView: UIImageView!
    @IBOutlet weak var pageTextView: UITextView!
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    var page: Page!
    
    var imageService = ImageService.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pageImageView.isHidden = true
        
        if page.imageName != nil {
            imageService.image(for: page, completion: { image in
                self.pageImageView.isHidden = false
                self.pageImageView.image = image
            })
        }
        
        pageTextView.text = page.text
        pageNumberLabel.text = "\(page.number)"
    }

}
