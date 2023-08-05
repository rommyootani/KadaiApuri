//
//  DetailView.swift
//  EasyCrypto
//
//  Created by Mehran on 11/19/1401 AP.
//

import SwiftUI

struct DetailView: View {
    enum Constant {
        static let spacing: CGFloat = 30
    }
    @StateObject var viewModel: DetailViewModel = DetailViewModel()
    @State private var isLoading: Bool = false
    @State private var presentAlert = true
    @State private var alertMesagee: String = ""
    let subscriber = Cancelable()
    var item: Weather
    init(item: Weather) {
        self.item = item
    }
    var body: some View {
        ZStack {
            VStack {
                DetailTitleView(headline: item.description?.headlineText ?? "", text: item.description?.text ?? "")
                detailCell()
            }
        }
        .onViewDidLoad {
            self.viewModel.apply(.onAppear)
        }
    }
    private func detailCell() -> some View {
        ScrollView {
            VStack {
                if item.forecasts != nil {
                    ForEach((item.forecasts)!, id: \.self) { detail  in
                        DayCell(item: detail)
                        if item.forecasts?.last?.dateLabel != detail.dateLabel {
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Weather.mock)
    }
}
#endif
