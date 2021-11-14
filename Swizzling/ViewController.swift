//
//  ViewController.swift
//  Swizzling
//
//  Created by Nagiz on 14/11/2021.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Variables
    
    let swizzlingClass = SwizzlingClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getResults()
    }
    
    
    
    // MARK: - Functions
    
    func getResults() {
        print("old age = ",swizzlingClass.getOldAge(),"new age = ",swizzlingClass.getNewAge())
        swizzlingClass.swizle()
        print("old age = ",swizzlingClass.getOldAge(),"new age = ",swizzlingClass.getNewAge())
    }


}

class SwizzlingClass {
    
    @objc dynamic func getOldAge() -> Int {
        return 20
    }
}

extension SwizzlingClass {
    
    func swizle() {
        guard let originalMethod = class_getInstanceMethod(SwizzlingClass.self, #selector(getOldAge)) else {return}
        guard let swizzlingMethod = class_getInstanceMethod(SwizzlingClass.self, #selector(getNewAge)) else {return}
        method_exchangeImplementations(originalMethod, swizzlingMethod)
    }
    
    @objc dynamic func getNewAge() -> Int {
        return 25
    }
}

