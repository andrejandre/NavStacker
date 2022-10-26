//
//  ParentView.swift
//  NavStacker
//
//  Created by Andre Unsal on 10/3/22.
//

import SwiftUI

//enum AppViews: Hashable {
//    case kombuchaProductsView
//    case coffeeProductsView
//    case customerCartView
//}

enum ProductViews: Hashable {
    case allKombuchas([Kombucha])
    case allCoffees([Coffee])
}

enum DrinkProductViews: Hashable {
    case kombucha(Kombucha)
    case coffee(Coffee)
}

enum DrinkProduct: Hashable {
    case kombucha(Kombucha)
    case coffee(Coffee)
}

struct Kombucha: Hashable, Identifiable {
    let id = UUID()
    var name: String
    var price: Double
}

struct Coffee: Hashable, Identifiable {
    let id = UUID()
    var name: String
    var price: Double
}

struct ParentView: View {
    
    @StateObject var drinkProductViewModel = DrinkProductViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack(path: self.$drinkProductViewModel.navPath) {
                List {
                    Section("Products") {
                        NavigationLink(value: ProductViews.allKombuchas(self.drinkProductViewModel.kombuchaProducts)) {
                            HStack {
                                Text("Kombuchas")
                                Spacer()
                                Image(systemName: "list.bullet")
                            }
                        }
                        NavigationLink(value: ProductViews.allCoffees(self.drinkProductViewModel.coffeeProducts)) {
                            HStack {
                                Text("Coffees")
                                Spacer()
                                Image(systemName: "list.bullet")
                            }
                        }
                    }
                }
                .navigationDestination(for: ProductViews.self) { productView in
                    switch productView {
                    case .allKombuchas(_):
                        KombuchaProductsView(drinkProductViewModel: self.drinkProductViewModel)
                    case .allCoffees(_):
                        CoffeeProductsView(drinkProductViewModel: self.drinkProductViewModel)
                    }
                }
            }
        }
    }
}

struct KombuchaProductsView: View {
    @State var drinkProductViewModel: DrinkProductViewModel
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(drinkProductViewModel.kombuchaProducts) { kombucha in
                    NavigationLink(value: kombucha) {
                        HStack {
                            Text(kombucha.name)
                            Spacer()
                            Text("$\(kombucha.price)")
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationDestination(for: Kombucha.self) { kombucha in
            KombuchaView(
                drinkProductViewModel: self.drinkProductViewModel,
                kombucha: kombucha
            )
        }
        .navigationTitle("Kombucha Selection")
        .onDisappear {
           print("KombuchaProductsView disappeared")
           print("Nav stack count: \(self.drinkProductViewModel.navPath.count) (KombuchaProductsView)")
        }
    }
}

struct CoffeeProductsView: View {
    @State var drinkProductViewModel: DrinkProductViewModel
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(drinkProductViewModel.coffeeProducts) { coffee in
                    NavigationLink(value: coffee) {
                        HStack {
                            Text(coffee.name)
                            Spacer()
                            Text("$\(coffee.price)")
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    Divider()
                }
                .padding()
            }
        }
        .navigationDestination(for: Coffee.self) { coffee in
            CoffeeView(
                drinkProductViewModel: self.drinkProductViewModel,
                coffee: coffee
            )
        }
        .navigationTitle("Coffee Selection")
        .onDisappear {
            print("CoffeeProductsView disappeared")
            print("Nav stack count: \(self.drinkProductViewModel.navPath.count) (CoffeeProductsView)")
        }
    }
}
