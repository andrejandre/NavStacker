//
//  DrinkProductViewModel.swift
//  NavStacker
//
//  Created by Andre Unsal on 10/2/22.
//

import Foundation
import SwiftUI

/**
 This ViewModel is just here to play with in the Views to explore
 whether ViewModels can impact bugs I observed in SwiftUI 4's Navigator Pattern
 implementations. Namely, when passing objects down view hierarchies.
 */
class DrinkProductViewModel: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    @Published var customerCart = [Any]()
    
    @Published var kombuchaProducts = [Kombucha]()
    
    @Published var coffeeProducts = [Coffee]()
    
    init() {
        // Let's ignore networking, and assume a bunch of static data
        self.kombuchaProducts = [
            Kombucha(name: "Ginger Blast", price: 4.99),
            Kombucha(name: "Cayenne Fusion", price: 6.99),
            Kombucha(name: "Mango Tango", price: 4.49),
            Kombucha(name: "Clear Mind", price: 5.39),
            Kombucha(name: "Kiwi Melon", price: 6.99),
            Kombucha(name: "Super Berry", price: 5.99)
        ]
        self.coffeeProducts = [
            Coffee(name: "Cold Brew", price: 2.99),
            Coffee(name: "Nitro Brew", price: 4.99),
            Coffee(name: "Americano", price: 6.99),
            Coffee(name: "Flat White", price: 5.99),
            Coffee(name: "Espresso", price: 3.99)
        ]
    }
    
    func addToCustomerCart() {
        
    }
    
    func removeFromCustomerCart() {
        
    }
}
