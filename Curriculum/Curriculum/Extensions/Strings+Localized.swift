import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "") //TODO: EENUM
    }
    func localized(_ args: CVarArg) -> String {
        return String(format: localized, args)
    }
}
