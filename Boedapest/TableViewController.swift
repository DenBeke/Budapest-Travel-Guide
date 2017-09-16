//
//  TableViewController.swift
//  Praag
//
//  Created by Mathias Beke on 3/02/17.
//  Copyright © 2017 Mathias Beke. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    var names = [Page]()
    
    override func viewDidLoad() {
        names = [
            Page(name: "Burcht en oude stad", url: "burcht"),
            Page(name: "Víziváros, de Waterstad", url: "waterstad"),
            Page(name: "Rond het parlement", url: "parlement"),
            Page(name: "Centraal Pest", url: "pest"),
            Page(name: "Városliget, het stadspark", url: "stadspark"),
            Page(name: "Gellért-hegy", url: "gellert"),
            Page(name: "Tabán", url: "taban"),
            Page(name: "Extra...", url: "extra"),
            Page(name: "Tripje naar Visegrád en Szentendre", url: "tripje naar visegrad"),
            Page(name: "Restaurants", url: "restaurant"),
        ]
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.barTintColor = hexStringToUIColor(hex: "#519BC1")
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel!.text = names[indexPath.row].name
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ViewController
        let selectedRow = tableView.indexPathForSelectedRow!.row
        destination!.inputPage = names[selectedRow]
    }
    
}


func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.characters.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
