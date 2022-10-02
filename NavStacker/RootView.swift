//
//  ContentView2.swift
//  NavStacker
//
//  Created by Andre Unsal on 10/2/22.
//

/**
 This file is here to explore one more implementation of the Navigation Pattern
 with a simpler enumeration.
 */

import SwiftUI

enum AppViews: Hashable {
    case kombuchaProductsView
    case coffeeProductsView
    case customerCartView
}

struct RootView: View {
    @StateObject var drinkProductViewModel = DrinkProductViewModel()
    
    var body: some View {
        NavigationStack(path: self.$drinkProductViewModel.navPath) {
            List {
                Section("Products") {
                    NavigationLink(value: AppViews.kombuchaProductsView) {
                        HStack {
                            Text("View all Kombuchas")
                            Spacer()
                            Image(systemName: "list.bullet")
                        }
                    }
                    NavigationLink(value: AppViews.coffeeProductsView) {
                        HStack {
                            Text("View all Coffees")
                            Spacer()
                            Image(systemName: "list.bullet")
                        }
                    }
                }
                Section("Checkout") {
                    NavigationLink(value: AppViews.customerCartView) {
                        HStack {
                            Text("Cart")
                            Spacer()
                            Image(systemName: "cart")
                        }
                    }
                }
            }
            .navigationDestination(for: AppViews.self) { appView in
                switch appView {
                    case .kombuchaProductsView:
                        KombuchaProductsView(drinkProductViewModel: self.drinkProductViewModel)
                    case .coffeeProductsView:
                        CoffeeProductsView(drinkProductViewModel: self.drinkProductViewModel)
                    case .customerCartView:
                        Text("Not implemented")
                }
            }
        }
        .onAppear {
            print("RootView appeared.")
            print("Nav stack count: \(self.drinkProductViewModel.navPath.count) (RootView)")
        }
    }
}

struct KombuchaProductsView: View {
    @State var drinkProductViewModel: DrinkProductViewModel
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(drinkProductViewModel.kombuchaProducts, id: \.self) { kombucha in
                    NavigationLink {
                        KombuchaView(
                            drinkProductViewModel: self.drinkProductViewModel,
                            kombucha: kombucha
                        )
                    } label: {
                        HStack {
                            Text(kombucha.name)
                            Spacer()
                            Text("$\(kombucha.price)")
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    Divider()
                }
                .padding()
            }
        }
        .navigationTitle("Kombucha Selection")
        .onAppear {
            print("KombuchaProductsView appeared.")
            print("Nav stack count: \(self.drinkProductViewModel.navPath.count) (KombuchaProductsView)")
        }
        .onDisappear {
            print("KombuchaProductsView disappeared")
        }
    }
}

struct CoffeeProductsView: View {
    @State var drinkProductViewModel: DrinkProductViewModel
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(drinkProductViewModel.coffeeProducts, id: \.self) { coffee in
                    NavigationLink {
                        CoffeeView(
                            drinkProductViewModel: self.drinkProductViewModel,
                            coffee: coffee
                        )
                    } label : {
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
        .navigationTitle("Coffee Selection")
        .onAppear {
            print("CoffeeProductsView appeared")
            print("Nav stack count: \(self.drinkProductViewModel.navPath.count) (CoffeeProductsView)")
        }
        .onDisappear {
            print("CoffeeProductsView disappeared")
        }
    }
}
