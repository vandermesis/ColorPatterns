//
//  GameTimer.swift
//  ColorPatterns
//
//  Created by Marek Skrzelowski on 13/10/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol GameTimerDelegate: class {
    func timerDidEndCounting()
    func timerDidUpdate(seconds: Int)
}

final class GameTimer {

    private var timer: Timer?

    weak var delegate: GameTimerDelegate?

    var timeLeft = 60

    func start() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(onTimerFires),
                                     userInfo: nil,
                                     repeats: true)
    }
}

private extension GameTimer {

    @objc private func onTimerFires() {
        timeLeft -= 1
        delegate?.timerDidUpdate(seconds: timeLeft)
        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
            delegate?.timerDidEndCounting()
            timeLeft = 60
        }
    }
}
