import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
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
                    print("Continue Button tapped")
                }) {
                    Text("continue".localized())
                }
                .buttonStyle(CustomButtonStyle(backgroundColor: Color("brightSun")))
                
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
                    print("Demo Button tapped")
                }) {
                    Text("try.demo".localized())
                }
                .buttonStyle(CustomButtonStyle(backgroundColor: Color("raven")))
                
                Spacer()
            }
            .padding(20)
            .background(Color("woodsmoke"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
