//
//  SecondViewController.swift
//  01-SesacAssignment
//
//  Created by Doy Kim on 2022/07/05.
//

import UIKit

class SecondViewController: UIViewController {
    // properties
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    
    // life cycle
    // option command <>
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterImageView.image = UIImage(named:"movie\(Int.random(in: 1...5))")
        
        posterImageView.layer.cornerRadius = 20
       // posterImageView.clipsToBounds = true
        
        posterImageView.layer.borderWidth = 5
        posterImageView.layer.borderColor = UIColor.blue.cgColor
        
        movieTitleLabel.text = "알라딘"
        movieTitleLabel.backgroundColor = UIColor.orange
        movieTitleLabel.textColor = UIColor.blue
        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        
    }
    
    
    // action
    
    @IBAction func didButtonTapped(_ sender: UIButton) {
        
        posterImageView.image = UIImage(named:"movie\(Int.random(in: 1...5))")
        
    }
    

}
