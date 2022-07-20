//
//  DetailView.swift
//  FlagList
//
//  Created by Fırat Kahvecioğlu on 20.07.2022.
//

import UIKit

class DetailView: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var countryName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = countryName?.uppercased()
        
        imageView.image = UIImage(named: selectedImage!)
        imageView.layer.borderWidth = 1
        imageView.layer.backgroundColor = UIColor(named: "gray")?.cgColor
        

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareData))
        
    
        
        
    }
    @objc  func shareData(){
         
        let data = [imageView.image!,countryName!] as [Any]
         let ac = UIActivityViewController(activityItems: data, applicationActivities: nil)
         
         present(ac, animated: true, completion: nil)
     }
    
}
