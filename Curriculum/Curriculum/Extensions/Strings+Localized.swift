import Foundation

extension String {
    /// Returns a localized string version given a localizable key.
    var localized: String {
        return NSLocalizedString(self, comment: GenericString.Empty.rawValue)
    }
    
    /**
     Returns a localized string concatenating the arguments.
     
     - Parameters:
        - args: Arguments to concatenate to the localized string.
     */
    func localized(_ args: CVarArg) -> String {
        return String(format: localized, args)
    }
}
