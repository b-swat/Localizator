//
//  ViewController.swift
//  Localizator
//
//  Created by N.D. on 23/07/2018.
//  Copyright © 2018 N.D. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    @IBOutlet weak var translate: NSButton!
    @IBOutlet var text1: NSTextView!
    @IBOutlet var text2: NSTextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func pressButton(_ sender: Any) {
        let translator = YandexTranslate()
        translator.translateGetLang()
     /*   translator.translate(params: params) { (result) in
            DispatchQueue.main.async {
                self.translation.text = "\(result)"
            }
        }*/
    }
    
}

