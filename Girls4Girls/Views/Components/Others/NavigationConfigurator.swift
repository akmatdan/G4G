//
//  NavigationConfigurator.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

