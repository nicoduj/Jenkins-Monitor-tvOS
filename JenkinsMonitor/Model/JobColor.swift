import Foundation
import UIKit

enum JobColor: String {
    case blue = "blue"
    case blueAnime = "blue_anime"
    case red = "red"
    case redAnime = "red_anime"
    case yellow = "yellow"
    case yellowAnime = "yellow_anime"
    case aborted = "aborted"
    case abortedAnime = "aborted_anime"

    func isBuilding() -> Bool {
        return [.blueAnime, .redAnime, .yellowAnime, .abortedAnime].contains(self)
    }

    func toUIColor() -> UIColor {
        switch self {
        case .blue, .blueAnime:
            return .init(red: 0.87, green: 0.94, blue: 0.85, alpha: 1.0)
        case .yellow, .yellowAnime:
            return .init(red: 0.99, green: 0.97, blue: 0.89, alpha: 1.0)
        case .red, .redAnime:
            return .init(red: 0.95, green: 0.87, blue: 0.87, alpha: 1.0)
        case .aborted, .abortedAnime:
            return .darkGray
        }
    }
    
    func toUITextColor() -> UIColor {
        switch self {
        case .blue, .blueAnime:
            return .init(red:0.24, green:0.46, blue:0.24, alpha:1.0)
        case .yellow, .yellowAnime:
            return .init(red:0.54, green:0.43, blue:0.23, alpha:1.0)
        case .red, .redAnime:
            return .init(red:0.66, green:0.27, blue:0.26, alpha:1.0)
        case .aborted, .abortedAnime:
            return .white
        }
    }
    
    func toUIBorderColor() -> UIColor {
        switch self {
        case .blue, .blueAnime:
            return .init(red:0.82, green:0.91, blue:0.78, alpha:1.0)
        case .yellow, .yellowAnime:
            return .init(red:0.98, green:0.95, blue:0.80, alpha:1.0)
        case .red, .redAnime:
            return .init(red:0.92, green:0.80, blue:0.80, alpha:1.0)
        case .aborted, .abortedAnime:
            return .black
        }
    }
    
    
    func toRobotExpr() -> String {
        switch self {
        case .blue, .blueAnime:
            return "expression_robotcontent"
        case .yellow, .yellowAnime:
            return "expression_robotneutre"
        case .red, .redAnime:
            return "expression_robotpas content"
        case .aborted, .abortedAnime:
            return "expression_robotneutre"
        }
    }
    
}
