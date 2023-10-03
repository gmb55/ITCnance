import Foundation

class LoginViewModel: ObservableObject {
    @Published var apiKey: String = ""
    @Published var secretKey: String = ""

    init() {
        Task {
            await fetchBinanceAccountInfo()
        }
    }

    func fetchBinanceAccountInfo() async -> AccountInfoDTO? {
        let service = BinanceProvider(
            urlBuilder: BinanceURLBuilder(secretKey: secretKey),
            apiKey: apiKey
        )
        
        return try? await service.accountInfo()
    }
}
