//
//  Khalti.swift
//  Khalti
//
//  Created by Rajendra Karki on 2/14/18.
//  Copyright (c) 2018 khalti. All rights reserved.
//

import Foundation
import UIKit

public enum PaymentType {
    case khalti
    case ebanking
    case card
}

struct KhaltiColor {
    static var base: UIColor  { return UIColor(red: 76.0/255.0, green: 39.0/255.0, blue: 109.0/255.0, alpha: 1.0) }
    static var orange: UIColor { return UIColor(red:247.0/255.0, green: 147.0/255.0, blue: 34.0/255.0, alpha: 1.0) }
}

public class Khalti {
    
    public static func present(caller: UIViewController, with config:Config, delegate: CheckOutDelegate) {
        let viewController = self.payView()
        viewController.config = config
        viewController.delegate = delegate
        let navigationViewController = UINavigationController(rootViewController: viewController)
        
        navigationViewController.navigationBar.isTranslucent = false
        navigationViewController.navigationBar.barTintColor = UIColor(red: 76.0/255.0, green: 39.0/255.0, blue: 109.0/255.0, alpha: 1)
        navigationViewController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        caller.present(navigationViewController, animated: true, completion: nil)
    }
    
    fileprivate static func payView() -> CheckOutViewController {
        let storyboard = UIStoryboard(name: "CheckOut", bundle: bundle)
        let vc = storyboard.instantiateInitialViewController() as! CheckOutViewController
        return vc
    }
    
    private static var bundle:Bundle {
        let podBundle = Bundle(for: CheckOutViewController.self)
        let bundleURL = podBundle.url(forResource: "Khalti", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
}
