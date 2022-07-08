//
//  ViewController.swift
//  01-SesacAssignment
//
//  Created by Doy Kim on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    
    // properties
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    

    var imageArray: [UIImageView] {
        [firstImage, secondImage, thirdImage]
    }
    
    var allImageArray: [UIImageView] {
        [mainImage, firstImage, secondImage, thirdImage]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setAttribute()
    }
    
    // action
    
    @IBAction func didPlayButtonTapped(_ sender: UIButton) {
        
        allImageArray.forEach { i in
            i.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        }
    }
    
    
    
    
    // helper
    func setAttribute() {
        imageArray.forEach { iv in
            iv.layer.cornerRadius = iv.frame.width/2
            iv.clipsToBounds = true
            iv.layer.borderWidth = 4
            iv.layer.borderColor = UIColor.darkGray.cgColor
        }
    }

}

