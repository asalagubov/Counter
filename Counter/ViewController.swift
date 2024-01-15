//
//  ViewController.swift
//  Counter
//
//  Created by Alexander Salagubov on 09.01.2024.
//

import UIKit

class  ViewController: UIViewController {

  @IBOutlet private weak var showLable: UILabel! // добавлен лейбл
  @IBOutlet private weak var addCount: UIButton! // добавлена кнопка +
  @IBOutlet private weak var deleteCount: UIButton! // добавлена кнопка -
  @IBOutlet private weak var resetCount: UIButton! // добавлена кнопка Х Reset
  @IBOutlet private weak var addTextField: UITextView! // добавлен текст лога

  private var count : Int = 0
  private let date = DateFormatter()
  private var message = String()

  override internal func viewDidLoad() {
    super.viewDidLoad()

    showLable.text = "Значение счётчика: \(count)" // делаем значение по умлочанию 0
    addCount.setTitle("+", for: .normal) // делаем значение по умлочанию +
    deleteCount.setTitle("-", for: .normal) // делаем значение по умлочанию -
    resetCount.setTitle(" Reset", for: .normal) // делаем значение по умлочанию Х
    addTextField.text = "История изменений:" // делаем текст по умолчанию
    addTextField.isEditable = false // запрет на изменение текста в UITextView
  }
  private func historyTextView (_ message: String) {
    let date = DateFormatter()
    date.dateFormat = "dd-MM-yyyy HH:mm" // форматируем дату под нужный формат
    addTextField.text += "\n[\(date.string(from: Date()))] \(message)" // так будет формироваться сообщение в UITextView по нажатию на кнопки
    let range = NSMakeRange(addTextField.text.count, 1)
    addTextField.scrollRangeToVisible(range) // добавляем скролл
  }

  @IBAction private func buttonAddCount(_ sender: Any) {
    print("Тап на кнопку +") // отправляем событие на нажатие + (для статы)
    count += 1 // увеличиваем значение на 1
    showLable.text = String("Значение счётчика: \(count)") // обновляем значение на +1
    historyTextView("значение изменено на +1")

  }
  @IBAction private func buttonDeleteCount(_ sender: Any) {
    print("Тап на кнопку -") // отправляем событие на нажатие - (для статы)
    if count == 0 { // ограничиваю min значение 0
      historyTextView("попытка уменьшить значение счётчика ниже 0") // добавлем текст в UITextView по нажатию на - если значение 0
    } else {
      count -= 1
      historyTextView("значение изменено на -1") // добавлем текст в UITextView по нажатию на -
    }
    showLable.text = String("Значение счётчика: \(count)")
    // обновляем значение на -1, но не ниже 0
  }
  @IBAction private func buttonResetCount(_ sender: Any) {
    print("Тап на кнопку Х") // отправляем событие на нажатие Х (для статы)
    count = 0
    showLable.text = "Значение счётчика: \(count)"  // сбрасываем значение на 0
    historyTextView("значение сброшено") // добавлем текст в UITextView по нажатию Х

  }
}

