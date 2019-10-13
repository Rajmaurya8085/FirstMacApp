//
//  DetailsViewController.swift
//  FirstMacApp
//
//  Created by Raj Maurya on 10/10/19.
//  Copyright © 2019 Raj Maurya. All rights reserved.
//

import Cocoa

class DetailsViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    
    func showImage(image:String){
        imageView.image = NSImage(named: NSImage.Name(stringLiteral: image))
    }
    
}
