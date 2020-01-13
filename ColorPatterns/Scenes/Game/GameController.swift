//
//  GameController.swift
//  ColorPatterns
//
//  Created by Marek Skrzelowski on 13/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

final class GameController: UIViewController {

    @IBOutlet private var colorBars: [UIButton]!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!

    private let viewModel: GameViewModel

    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var prefersStatusBarHidden: Bool {
      return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateColorBars()
    }
}

private extension GameController {

    private func updateColorBars() {
        let updatedColors = viewModel.shuffleColors()
        for i in 0...4 {
            colorBars[i].backgroundColor = UIColor(hue: updatedColors[i],
                                                   saturation: 1,
                                                   brightness: 1,
                                                   alpha: 1)
        }
    }
}
