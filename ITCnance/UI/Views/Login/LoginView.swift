import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            LogoView()
                .frame(width: 100, height: 100)

            Text(String(localized: "log.in"))
                .font(.title)
                .foregroundColor(.white)
                .padding(.bottom, 40)
                .frame(maxWidth: .infinity, alignment: .leading)

            CustomTextFieldView(type: .apiKey, text: $viewModel.username)
                .padding(.bottom, 20)

            CustomTextFieldView(type: .secureKey, text: $viewModel.password)
                .padding(.bottom, 40)

            Button(action: viewModel.handleLogin) {
                Text(String(localized: "continue"))
            }
            .buttonStyle(CustomButtonStyle(backgroundColor: Color("brightSun")))

            HStack(spacing: 12) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("raven"))
                Text("or")
                    .foregroundColor(Color("raven"))
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("raven"))
            }
            .padding(.bottom, 40)

            Button(action: viewModel.handleLogin) {
                Text(String(localized: "try.demo"))
            }
            .buttonStyle(CustomButtonStyle(backgroundColor: Color("raven")))

            Spacer()
        }
        .padding(20)
        .background(Color("woodsmoke"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
