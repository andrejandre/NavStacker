//
//  ContentView.swift
//  NavStacker
//
//  Created by Andre Unsal on 10/1/22.
//

import SwiftUI

enum DrinkProduct: Hashable {
    case kombucha(Kombucha)
    case coffee(Coffee)
}

struct Kombucha: Hashable {
    var name: String
    var price: Double
}

struct Coffee: Hashable {
    var name: String
    var price: Double
}

struct ContentView: View {
    
    @State var navPath = NavigationPath()
    
    @State private var kombuchaProducts: [Kombucha] = [
        Kombucha(name: "Ginger Blast", price: 4.99),
        Kombucha(name: "Cayenne Fusion", price: 6.99),
        Kombucha(name: "Mango Tango", price: 4.49),
        Kombucha(name: "Clear Mind", price: 5.39),
        Kombucha(name: "Kiwi Melon", price: 6.99),
        Kombucha(name: "Super Berry", price: 5.99)
    ]
    
    @State private var coffeeProducts: [Coffee] = [
        Coffee(name: "Cold Brew", price: 2.99),
        Coffee(name: "Nitro Brew", price: 4.99),
        Coffee(name: "Americano", price: 6.99),
        Coffee(name: "Flat White", price: 5.99),
        Coffee(name: "Espresso", price: 3.99)
    ]
    
    var body: some View {
        ZStack {
            NavigationStack(path: $navPath) {
                List {
                    Section("Kombuchas") {
                        ForEach(kombuchaProducts, id: \.self) { kombucha in
                            NavigationLink(value: DrinkProduct.kombucha(kombucha)) {
                                Text(kombucha.name)
                            }
                        }
                    }
                    Section("Coffees") {
                        ForEach(coffeeProducts, id: \.self) { coffee in
                            NavigationLink(value: DrinkProduct.coffee(coffee)) {
                                Text(coffee.name)
                            }
                        }
                    }
                }
                .navigationDestination(for: DrinkProduct.self) { drinkProduct in
                    switch drinkProduct {
                        case let .kombucha(kombucha):
                            KombuchaView(kombucha: kombucha)
                        case let .coffee(coffee):
                            CoffeeView(coffee: coffee)
                    }
                }
            }
        }
    }
}

struct KombuchaView: View {
    @State var kombucha: Kombucha
    var body: some View {
        VStack {
            Text("Price:")
                .font(.title)
            Text("\(kombucha.price)")
                .font(.callout)
        }
        .navigationTitle(kombucha.name)
    }
}

struct CoffeeView: View {
    @State var coffee: Coffee
    var body: some View {
        VStack {
            Text("Price:")
                .font(.title)
            Text("\(coffee.price)")
                .font(.callout)
        }
        .navigationTitle(coffee.name)
    }
}
