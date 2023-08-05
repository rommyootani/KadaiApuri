//
//  String + Extension.swift
//  EasyCrypto
//
//  Created by Mehran on 11/15/1401 AP.
//

import Foundation

extension String {
    func toDate(withFormat format: String = Constants.DateFormat.standard) -> Date? {
        guard !self.isEmpty else {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .japan
        dateFormatter.locale = .japan
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
    func trimingLeadingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }
        return String(self[index...])
    }
    func trimingAndFixingSpaces() -> String {
        var text = self.trimingLeadingSpaces()
        text = text.replacingOccurrences(of: "\n\n　", with: "\n\n")
        text = text.replacingOccurrences(of: "\n　", with: "\n")
        return text
    }
}

extension String {
    static let empty: String = ""
}
