import SwiftUI

struct KombuchaView: View {
    @ObservedObject var drinkProductViewModel: DrinkProductViewModel
    @State var kombucha: Kombucha
    var body: some View {
        VStack {
            Text("Price:")
                .font(.title)
            Text("\(kombucha.price)")
                .font(.callout)
        }
        .navigationTitle(kombucha.name)
        .onAppear {
            print("Nav stack count: \(self.drinkProductViewModel.navPath.count) (KombuchaView)")
        }
    }
}

struct CoffeeView: View {
    @ObservedObject var drinkProductViewModel: DrinkProductViewModel
    @State var coffee: Coffee
    var body: some View {
        VStack {
            Text("Price:")
                .font(.title)
            Text("\(coffee.price)")
                .font(.callout)
        }
        .navigationTitle(coffee.name)
        .onAppear {
            print("Nav stack count: \(self.drinkProductViewModel.navPath.count) (CoffeeView)")
        }
    }
}
