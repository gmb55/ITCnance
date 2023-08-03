import Foundation

class LoginViewModel: ObservableObject {
    @Published var apiKey: String = ""
    @Published var secretKey: String = ""
}
