//
//  ViewController.swift
//  gameState
//
//  Created by Josh Kneedler on 2/1/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var totalLives = 3
    
    var gameState = GameState()
    
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var heroLabel: UILabel!
    
    @IBAction func addLifeBtn(_ sender: Any) {
        totalLives += 1
        gameState.notify(event: .updateLives(lives: totalLives))
    }
    @IBAction func dieBtn(_ sender: Any) {
        totalLives -= 1
        if totalLives < 0 { totalLives = 0}
        gameState.notify(event: .updateLives(lives: totalLives))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameState.onStateChange = { [weak self] state in
            self?.livesLabel.text = "Lives: \(state.lives ?? -1)"
            self?.heroLabel.text = "Hero: \(state.heroName ?? "No name")"
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //update lives label
        gameState.notify(event: .updateLives(lives: totalLives))
        gameState.notify(event: .updateHeroName(name: "Hugo"))
    }
    
    
    
}

