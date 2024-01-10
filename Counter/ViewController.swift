//
//  ViewController.swift
//  Counter
//
//  Created by Alexander Salagubov on 09.01.2024.
//

import UIKit

class ViewController: UIViewController {

  var count : Int = 0
  let date = DateFormatter()
  var message = String()


  @IBOutlet weak var isLableCount: UILabel! // добавлен лейбл
  @IBOutlet weak var isAddCount: UIButton! // добавлена кнопка +
  @IBOutlet weak var isDeleteCount: UIButton! // добавлена кнопка -
  @IBOutlet weak var isReset: UIButton! // добавлена кнопка Х Reset
  @IBOutlet weak var isHistoryCount: UITextView! // добавлен текст лога

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    isLableCount.text = "Значение счётчика: \(count)" // делаем значение по умлочанию 0
    isAddCount.setTitle("+", for: .normal) // делаем значение по умлочанию +
    isDeleteCount.setTitle("-", for: .normal) // делаем значение по умлочанию -
    isReset.setTitle(" Reset", for: .normal) // делаем значение по умлочанию Х
    isHistoryCount.text = "История изменений:" // делаем текст по умолчанию
    isHistoryCount.isEditable = false // запрет на изменение текста в UITextView
  }


  @IBAction func buttonAddCount(_ sender: Any) {
    print("Тап на кнопку +") // отправляем событие на нажатие + (для статы)
    count += 1 // увеличиваем значение на 1
    isLableCount.text = String("Значение счётчика: \(count)") // обновляем значение на +1
    historyTextView("значение изменено на +1")

  }
  @IBAction func buttonDeleteCount(_ sender: Any) {
    print("Тап на кнопку -") // отправляем событие на нажатие - (для статы)
    if count == 0 { // ограничиваю min значение 0
        historyTextView("попытка уменьшить значение счётчика ниже 0") // добавлем текст в UITextView по нажатию на - если значение 0
    } else {
      count -= 1
      historyTextView("значение изменено на -1") // добавлем текст в UITextView по нажатию на -
    }
      isLableCount.text = String("Значение счётчика: \(count)")
     // обновляем значение на -1, но не ниже 0
  }
  @IBAction func buttonResetCount(_ sender: Any) {
    print("Тап на кнопку Х") // отправляем событие на нажатие Х (для статы)
    count = 0
    isLableCount.text = "Значение счётчика: \(count)"  // сбрасываем значение на 0
    historyTextView("значение сброшено") // добавлем текст в UITextView по нажатию Х

  }
  func historyTextView (_ message: String) {
    let date = DateFormatter()
    date.dateFormat = "dd-MM-yyyy HH:mm" // форматируем дату под нужный формат
    isHistoryCount.text += "\n[\(date.string(from: Date()))] \(message)" // так будет формироваться сообщение в UITextView по нажатию на кнопки
    let range = NSMakeRange(isHistoryCount.text.count, 1)
    isHistoryCount.scrollRangeToVisible(range) // добавляем скролл
  }
}

