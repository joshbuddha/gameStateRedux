//
//  GameState.swift
//  gameState
//
//  Created by Josh Kneedler on 2/1/19.
//  Copyright © 2019 Josh Kneedler. All rights reserved.
//

import Foundation

typealias stateUpdate = ((State) -> Void)

class GameState {
    
    //state
    private(set) var state: State = State() {
        didSet {
            self.onStateChange?(state)
        }
    }
    
    var onStateChange: stateUpdate?
    
    func notify(event: Event) {
        state = handle(event: event, oldState: state)
    }
    
    private func handle(event: Event, oldState: State) -> State {
        
        var newState = oldState
        
        switch event {
        case let .updateLives(lives):
            newState.lives = lives
        case let .updateHeroName(name):
            newState.heroName = name
        }
        
        return newState
    }
}

enum Event {
    case updateLives(lives: Int)
    case updateHeroName(name: String)
}

struct State {
    var lives: Int?
    var heroName: String?
}
