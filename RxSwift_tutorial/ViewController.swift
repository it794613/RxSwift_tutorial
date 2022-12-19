//
//  ViewController.swift
//  RxSwift_tutorial
//
//  Created by 최진용 on 2022/12/18.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var thirdInput: UITextField!
    @IBOutlet weak var secondInput: UITextField!
    @IBOutlet weak var firstInput: UITextField!
    
    var disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Observable.combineLatest(
            firstInput.rx.text.orEmpty,
            secondInput.rx.text.orEmpty,
            thirdInput.rx.text.orEmpty) { (firstValue, secondValue, thirdValue) -> Int in
                return (Int(firstValue) ?? 0) + (Int(secondValue) ?? 0) + (Int(thirdValue) ?? 0)
            }
            .map { $0.description }
            .bind(to: result.rx.text )
            .disposed(by: disposebag)
        
    }


}

