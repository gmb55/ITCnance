import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var showingDemoAlert = false
    @State private var showingLoginAlert = false
    @State private var loginAlertTitle = ""
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            VStack {
                LogoView()
                    .frame(width: 100, height: 100)

                Text("log.in".localized())
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)

                CustomTextFieldView(type: .apiKey, text: $viewModel.apiKey)
                    .padding(.bottom, 20)

                CustomTextFieldView(type: .secureKey, text: $viewModel.secretKey)
                    .padding(.bottom, 40)

                Button(action: {
                    isLoading = true
                    Task {
                        let isSuccess = await viewModel.fetchedBinanceAccountInfoWithSuccess()

                        isLoading = false
                        loginAlertTitle = isSuccess ? "logged.in".localized() : "login.failed".localized()
                        showingLoginAlert = true
                    }
                }) {
                    Text("continue".localized())
                }
                .buttonStyle(CustomButtonStyle(backgroundColor: Color("brightSun")))
                .alert(loginAlertTitle, isPresented: $showingLoginAlert) {
                    Button("ok".localized(), role: .cancel) { }
                }

                HStack(spacing: 12) {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color("raven"))
                    Text("or".localized())
                        .foregroundColor(Color("raven"))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color("raven"))
                }
                .padding(.bottom, 40)

                Button(action: {
                    showingDemoAlert = true
                }) {
                    Text("try.demo".localized())
                }
                .buttonStyle(CustomButtonStyle(backgroundColor: Color("raven")))
                .alert("feature.unavailable".localized(), isPresented: $showingDemoAlert) {
                    Button("ok".localized(), role: .cancel) { }
                }

                Spacer()
            }
            .padding(20)
            .background(Color("woodsmoke"))
        }
        .overlay(
            isLoading ? ProgressView() : nil
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
