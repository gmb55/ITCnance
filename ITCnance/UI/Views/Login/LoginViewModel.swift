import Foundation

class LoginViewModel: ObservableObject {
    @Published var apiKey: String = ""
    @Published var secretKey: String = ""

    func fetchedBinanceAccountInfoWithSuccess() async -> Bool {
        let service = BinanceProvider(
            urlBuilder: BinanceURLBuilder(secretKey: secretKey),
            apiKey: apiKey
        )
        let accountInfo = try? await service.accountInfo()

        return accountInfo != nil
    }
}
