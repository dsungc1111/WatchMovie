//
//  Protocol.swift
//  WatchMovie
//
//  Created by 최대성 on 6/4/24.
//

import UIKit

protocol UserIdentifier {
    static var identifier: String { get }
}
extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}


