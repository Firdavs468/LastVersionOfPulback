////
////  OneTimeCodeTextField.swift
////  Pulback
////
////  Created by Firdavs Zokirov  on 31/07/21.
////
//
//import UIKit
//class OneTimeCodeTextField : UITextField{
//
//    private var isConfigured :Bool = false
//
//    private var digitLabels = [UILabel]()
//
//    private lazy var tapRecognizer: UITapGestureRecognizer = {
//        let recognizer = UITapGestureRecognizer()
//        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
//        return recognizer
//    }()
//
//    func configure(with slotCount: Int = 4){
//        guard isConfigured == false else { return }
//        isConfigured.toggle()
//
//        configureTextField()
//
//        let labelsStackView = createLabelsCtackView(with: slotCount)
//        addSubview(labelsStackView)
//        addGestureRecognizer(tapRecognizer)
//
//        NSLayoutConstraint.activate([
//            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
//            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//    }
//
//    private func configureTextField(){
//        tintColor = .clear
//        textColor = .clear
//        keyboardType = .numberPad
//        if #available(iOS 12.0, *) {
//            textContentType = .oneTimeCode
//        } else {
//            // Fallback on earlier versions
//        }
//        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
//    }
//    private func createLabelsCtackView(with count: Int) -> UIStackView{
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.alignment = .fill
//        stackView.distribution = .fillEqually
//        stackView.spacing = 8
//
//        for _ in 1...count{
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.textAlignment = .center
//            label.font = .systemFont(ofSize: 40)
//            label.backgroundColor = .blue
//            label.isUserInteractionEnabled = true
//
//            stackView.addArrangedSubview(label)
//
//            digitLabels.append(label)
//        }
//
//        return stackView
//    }
//
////    @objc
////    private func textDidChange(){
////
////    }
//}
//extension OneTimeCodeTextField: UITextInputDelegate{
//    func textDidChange(_ textInput: UITextInput?) {
//        guard let c = self.text, c.count <= digitLabels.count else { return }
//
//
//        for i in 0...digitLabels.count{
//            let currentLabel = digitLabels[i]
//
//            if i < c.count{
//                let index = c.index(c.startIndex, offsetBy: i)
//                currentLabel.text = String(c[index])
//
//            }else{
//                currentLabel.text?.removeAll()
//            }
//        }
//    }
//
//    func selectionWillChange(_ textInput: UITextInput?) {
//        print("a")
//    }
//
//    func selectionDidChange(_ textInput: UITextInput?) {
//        print("b")
//    }
//
//    func textWillChange(_ textInput: UITextInput?) {
//        print("c")
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool{
//        guard let characterCount  = textField.text?.count else {return false }
//        return characterCount < digitLabels.count
//    }
//
//
//}
