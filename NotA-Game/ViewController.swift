//
//  ViewController.swift
//  NotA-Game
//
//  Created by Steve Roseik on 1/24/21.
//

import UIKit

var blinker = 0
class ViewController: UIViewController {

    
   
    @IBOutlet weak var imageBtn: UIImageView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var ImageL: UIImageView!
    
    override func viewDidLoad() {
        print("Safe-1")
        super.viewDidLoad()
        ImageL.loadGif(asset: "INTRO")
        imageBtn.image = (UIImage(named: "start"))
        if blinker == 0{
            imageBtn.startBlink()
//            imageBtn.stopBlink()
            blinker = 1
//            print("ONCE")
        }
        
    }

    
    
}


