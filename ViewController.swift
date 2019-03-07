//
//  ViewController.swift
//  KazaaWireFrame
//
//  Created by Erick Alcantara on 3/2/19.
//  Copyright © 2019 Erick Alcantara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isPlaying: Bool = true {
        didSet {
            
        
        let filename: String = isPlaying ? "pause" : "play";
        
        playPauseButton.setImage(UIImage(named: filename)!, for: .normal)
        }
    }
        
    
    @IBOutlet weak var albumImageVIew: UIImageView!
    
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var playPauseBackground: UIView!
    @IBOutlet weak var forwardBackground: UIView!
    
    
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        reverseBackground.layer.cornerRadius = 35.0
        reverseBackground.clipsToBounds = true
        reverseBackground.alpha = 0.0
        
        playPauseBackground.layer.cornerRadius = 35.0
        playPauseBackground.clipsToBounds = true
        playPauseBackground.alpha = 0.0
        
        forwardBackground.layer.cornerRadius = 35.0
        forwardBackground.clipsToBounds = true
        forwardBackground.alpha = 0.0
        
        // [reverseBackground, playPauseBackground, forwardBackground].forEach {
        // $0!.clipsToBounds = true
        // $0!.layer.corneradius = 35.0
        // $0!.alpha = 0 }
    }

    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if isPlaying {
            UIView.animate(withDuration: 0.5) {
                self.albumImageVIew.transform =
                    CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageVIew.transform = .identity
            }
        }
        
        isPlaying = !isPlaying
    }
    
    
    @IBAction func touchedUPInside(_ sender: UIButton) {
        var buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        UIView.animate(withDuration: 0.25, animations: {
            buttonBackground.alpha = 0.0
            buttonBackground.transform = CGAffineTransform(scaleX:
                1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in
            buttonBackground.transform = CGAffineTransform.identity
        }
    }
    
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y:
                0.8)
        }
    }
}

