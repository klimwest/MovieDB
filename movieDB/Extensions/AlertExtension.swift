//
//  AlertExtension.swift
//  movieDB
//
//  Created by West on 13.10.21.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(defaultTitle: String = "OK", title: String, message: String, defaultAction: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: defaultTitle, style: .default) { _ in
            guard let action = defaultAction else { return }
            action()
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(defaultTitle: String = "OK", cancelTitle: String = "Cancel", title: String, message: String, okAction: (() -> Void)?, cancelAction: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: defaultTitle, style: .default) { _ in
            guard let action = okAction else { return }
            action()
        }
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel) { _ in
            guard let action = cancelAction else { return }
            action()
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertDelete(deleteTitle: String = "Delete", cancelTitle: String = "Cancel", title: String, message: String, deleteAction: (() -> Void)?, cancelAction: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let delete = UIAlertAction(title: deleteTitle, style: .destructive) { _ in
            guard let action = deleteAction else { return }
            action()
        }
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel) { _ in
            guard let action = cancelAction else { return }
            action()
        }
        alert.addAction(delete)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
