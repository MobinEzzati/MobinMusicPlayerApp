//
//  GenerButtonScreen.swift
//  MobinMusicPlayerApp
//
//  Created by mobin on 5/26/19.
//  Copyright © 2019 SpyderInc. All rights reserved.
//

import UIKit
import MediaPlayer
class GenerButtonScreen: UIViewController {
 var musicplayer = MPMusicPlayerController.applicationMusicPlayer
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    @IBAction func generButtonTapp(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playeGenre(genere: sender.currentTitle! )
            }else{
                
            }
        }
    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
musicplayer.stop()
        
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
   musicplayer.skipToNextItem()
    }
    func playeGenre(genere:String)  {
        
        musicplayer.stop()
        let query = MPMediaQuery()
        let predicate  = MPMediaPropertyPredicate(value: genere , forProperty: MPMediaItemPropertyGenre )
        query.addFilterPredicate(predicate)
musicplayer.setQueue(with: query)
        musicplayer.shuffleMode = .songs
        musicplayer.play()
    }
    
}
