//
//  StringExtension.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 16/10/23.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"  // 1
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)  // 2
        return emailValidationPredicate.evaluate(with: self)  // 3
    }
    func isValidMobileNumber() -> Bool {
        return self.count == 10
    }
}
