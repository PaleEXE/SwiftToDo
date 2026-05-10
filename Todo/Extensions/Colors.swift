import UIKit

extension UIColor {
    static let primaryColor = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.20, green: 0.29, blue: 0.98, alpha: 1.0)
            : UIColor(red: 0.80, green: 0.14, blue: 0.11, alpha: 1.0)
    }

    static let secondaryColor = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.51, green: 0.65, blue: 0.60, alpha: 1.0)
            : UIColor(red: 0.28, green: 0.27, blue: 0.25, alpha: 1.0)
    }

    static let backgroundColor = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.16, green: 0.14, blue: 0.13, alpha: 1.0)
            : UIColor(red: 0.98, green: 0.95, blue: 0.84, alpha: 1.0)
    }

    static let cardColor = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.20, green: 0.18, blue: 0.17, alpha: 1.0)
            : UIColor(red: 0.93, green: 0.89, blue: 0.74, alpha: 1.0)
    }

    static let myGreen = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.60, green: 0.59, blue: 0.10, alpha: 1.0)
            : UIColor(red: 0.72, green: 0.73, blue: 0.15, alpha: 1.0)
    }

    static let myRed = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.82, green: 0.36, blue: 0.00, alpha: 1.0)
            : UIColor(red: 0.98, green: 0.50, blue: 0.08, alpha: 1.0)
    }

    static let primaryText = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.93, green: 0.86, blue: 0.70, alpha: 1.0)
            : UIColor(red: 0.20, green: 0.18, blue: 0.17, alpha: 1.0)
    }

    static let secondaryText = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.67, green: 0.60, blue: 0.52, alpha: 1.0)
            : UIColor(red: 0.46, green: 0.41, blue: 0.36, alpha: 1.0)
    }
}
