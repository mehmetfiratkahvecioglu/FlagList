//
//  ViewController.swift
//  FlagList
//
//  Created by Fırat Kahvecioğlu on 19.07.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var flags = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flags of Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png") {
                flags.append(item)
            }
        }
     
        flags.sort()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "flagCell", for: indexPath) as! TableViewCell
        let image = UIImage(named: flags[indexPath.row])
        
        cell.imageCell.image = image
        let flagName = flags[indexPath.row]
        let splitName = flagName.split(separator: "@")
        cell.titleLabel.text = String(splitName[0]).uppercased()
        
            return cell
        
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flagName = flags[indexPath.row]
        let splitName = flagName.split(separator: "@")
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detailFlag") as! DetailView? {
            
            vc.selectedImage = flags[indexPath.row]
            vc.countryName = String(splitName[0])
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    


}

