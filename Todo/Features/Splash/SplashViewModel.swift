import Foundation

class SplashViewModel {
    var onFinished: (() -> Void)?

    func start() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onFinished?()
        }
    }
}
