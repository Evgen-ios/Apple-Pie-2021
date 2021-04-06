//
//  ViewController.swift
//  Apple Pie 2021
//
//  Created by Evgeniy Goncharov on 05.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    
    // MARK: - Properties
    var curretGame: Game!
    let incorrectMovesAllowed = 7
    var listOfWorlds = [
        "Александрия",
        "Атланта",
        "Ахмедабад",
        "Багдад",
        "Бангалор",
        "Бангкок",
        "Барселона",
        "Белу-Оризонти",
        "Богота",
        "Буэнос-Айрес",
        "Вашингтон",
        "Гвадалахара",
        "Гонконг",
        "Гуанчжоу",
        "Дакка",
        "Даллас",
        "Далянь",
        "Дар-эс-Салам",
        "Дели",
        "Джакарта",
        "Дунгуань",
        "Йоханнесбург",
        "Каир",
        "Калькутта",
        "Карачи",
        "Киншаса",
        "Куала Лумпур",
        "Лагос",
        "Лахор",
        "Лима",
        "Лондон",
        "Лос-Анджелес",
        "Луанда",
        "Мадрид",
        "Майами",
        "Манила",
        "Мехико",
        "Москва",
        "Мумбаи",
        "Нагоя",
        "Нанкин",
        "Нью-Йорк",
        "Осака",
        "Париж",
        "Пекин",
        "Пуна",
        "Рио-де-Жанейро",
        "Санкт-Петербург",
        "Сан-Паулу",
        "Сантьяго",
        "Сеул",
        "Сиань",
        "Сингапур",
        "Стамбул",
        "Сурат",
        "Сучжоу",
        "Тегеран",
        "Токио",
        "Торонто",
        "Тяньцзинь",
        "Ухань",
        "Филадельфия",
        "Фошань",
        "Фукуока",
        "Хайдарабад",
        "Ханчжоу",
        "Харбин",
        "Хартум",
        "Хошимин",
        "Хьюстон",
        "Цзинань",
        "Циндао",
        "Ченнай",
        "Чикаго",
        "Чунцин",
        "Чэнду",
        "Шанхай",
        "Шэньчжэнь",
        "Шэньян",
        "Эр-Рияд",
        "Янгон"
    ].shuffled()
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    // MARK: - Methods
    
    func enableButtons(_ enable: Bool = true) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func newRound() {
        guard !listOfWorlds.isEmpty else {
            enableButtons(false)
            updtaUI()
            return
        }
        let newWords = listOfWorlds.removeFirst()
        curretGame = Game(word: newWords, incorrectMovesRemaining: incorrectMovesAllowed)
        updtaUI()
        enableButtons()
    }
    
    func curretCorrectWordLable() {
        var displayWord = [String]()
        for letter in curretGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLable.text = displayWord.joined(separator: " ")
        
    }
    
    func updateState() {
        if curretGame.incorrectMovesRemaining < 1 {
            totalLosses += 1
        } else if curretGame.guessedWord == curretGame.word {
            totalWins += 1
        } else {
            updtaUI()
        }
    }
    
    func updtaUI() {
        let movesRemaining = curretGame.incorrectMovesRemaining
        
        // Double ternary operator
        // let imageNumber = movesRemaining < 0 ? 0 : movesRemaining < 8 ? movesRemaining : 7
        // Short variant
        let imageNumber = (movesRemaining + 64) % 8
        let image = "Tree\(imageNumber)"
        treeImageView.image = UIImage(named: image)
        curretCorrectWordLable()
        scoreLable.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IB Action
    @IBAction func letterButtonsPresed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        curretGame.playerGuessed(letter: Character(letter))
        updateState()
    }
}

