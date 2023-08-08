import Foundation

class LoginViewModel: ObservableObject {
    @Published var apiKey: String = ""
    @Published var secretKey: String = ""
    
    init() {
        Task {
            await fetchBinanceBalance()
        }
    }
    
    func fetchBinanceBalance() async {
        let service = BinanceService()
        guard let balanceData = try? await service.balance() else { return }
        
        do {
            let decoder = JSONDecoder()
            let balances = try decoder.decode([BinanceBalance].self, from: balanceData)
            print(balances)
        } catch {
            print("Error: \(error)")
        }
    }
}
