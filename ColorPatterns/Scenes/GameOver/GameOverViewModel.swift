//
//  GameOverViewModel.swift
//  ColorPatterns
//
//  Created by Marek Skrzelowski on 23/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import Foundation

struct GameOverViewModel {

    let userScore: Score

    init(userScore: Score) {
        self.userScore = userScore
    }
}
