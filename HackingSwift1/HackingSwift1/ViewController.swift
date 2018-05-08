//
//  ViewController.swift
//  HackingSwift1
//
//  Created by Franklin Buitron on 5/7/18.
//  Copyright © 2018 Franklin Buitron. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path  = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if (item.hasPrefix("nssl")) {
                pictures.append(item)
            }
        }
        self.tableView?.register(PicturesCell.self, forCellReuseIdentifier: "Picture")
        self.title = "Storm Viewer"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath);
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = self.pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = PictureDetailViewController()
        detailVC.pictureName = pictures[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }


}

