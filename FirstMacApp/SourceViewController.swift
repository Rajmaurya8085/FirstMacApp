//
//  SourceViewController.swift
//  FirstMacApp
//
//  Created by Raj Maurya on 10/10/19.
//  Copyright © 2019 Raj Maurya. All rights reserved.
//

import Cocoa
import AppKit
import Foundation

class SourceViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
     var product:[String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let fm  =  FileManager.default
        let path   =  Bundle.main.resourcePath!
        let items  =  try!fm.contentsOfDirectory(atPath: path)
        
        for item in items{
           if item.hasPrefix("appLogo"){
            product.append(item)
            }
        }
        
    }
    
   
    
}


extension SourceViewController:NSTableViewDelegate, NSTableViewDataSource{
    func numberOfRows(in tableView: NSTableView) -> Int {
        return product.count
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else{return nil}
        
        vw.textField?.stringValue = "Hello World "
        
        return vw
        
        
    }
    
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else{return }
        
        guard let cont = parent as? NSSplitViewController else {return}
        
        if let details   = cont.children[1] as? DetailsViewController {
            details.showImage(image: product[tableView.selectedRow])
        }
    }
}
