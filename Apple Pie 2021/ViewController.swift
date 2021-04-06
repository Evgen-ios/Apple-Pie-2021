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
    @IBOutlet weak var coorectWordLable: UILabel!
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
    ]
    
    var totalWins = 0
    var totalLosses = 0
    
    // MARK: - Methods
    func newRound() {
        let newWords = listOfWorlds.removeFirst()
        curretGame = Game(word: newWords, incorrectMovesRemaining: incorrectMovesAllowed)
        updtaUI()
    }
    
    func updtaUI() {
        let movesRemaining = curretGame.incorrectMovesRemaining
        let image = "Tree\(movesRemaining < 8 ? movesRemaining : 7)"
        treeImageView.image = UIImage(named: image)
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
    }
}

