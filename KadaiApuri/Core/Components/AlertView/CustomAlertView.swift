import SwiftUI

struct CustomAlertView: View {
    enum Constant {
        static let imageWidht: CGFloat = 80
        static let imageHeight: CGFloat = 80
        static let buttonCornerRadius: CGFloat = 12
        static let lineWidht: CGFloat = 2
        static let spaceToButton: CGFloat = 16
        static let viewCornerRadius: CGFloat = 20
    }
    var title: String?
    var primaryButtonLabel: String
    var primaryButtonAction: () -> Void
    var secondaryButtonLabel: String?
    var secondaryButtonAction: (() -> Void)?
    var image: Image?
    var body: some View {
        VStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: Constant.imageWidht, height: Constant.imageHeight)
            } else if let title = title {
                Text(title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            HStack(spacing: Constant.spaceToButton) {
                Button(action: {
                    self.primaryButtonAction()
                }, label: {
                    Text(primaryButtonLabel)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.gray)
                        .cornerRadius(Constant.buttonCornerRadius)
                })
                if let secondaryButtonLabel = secondaryButtonLabel {
                    Button(action: {
                        self.secondaryButtonAction?()
                    }, label: {
                        Text(secondaryButtonLabel)
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(Constant.buttonCornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: Constant.buttonCornerRadius)
                                    .stroke(.blue, lineWidth: Constant.lineWidht)
                            )
                    })
                }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(Constant.viewCornerRadius)
        .shadow(radius: Constant.viewCornerRadius)
    }
}
