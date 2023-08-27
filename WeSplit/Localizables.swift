//
//  Localizables.swift
//  WeSplit
//
//  Created by Julian Miño on 27/08/2023.
//

import Foundation

enum Localizables {
    case appTitle
    case amount
    case numberOfPeople
    case people(number: Int)
    case percentOfTip(percent: Int)
    case tipSelectionTitle
    case totalPerPerson
    case tipPerPerson
    
    private var english: String {
        switch self {
        case .appTitle:
            return "WeSplit"
        case .amount:
            return "Amount"
        case .numberOfPeople:
            return "Number of people"
        case .people(let number):
            return "\(number) people"
        case .percentOfTip(let percent):
            return "\(percent)% tip"
        case .tipSelectionTitle:
            return "How much tip do you want to leave?"
        case .totalPerPerson:
            return "Total per person"
        case .tipPerPerson:
            return "Tip per person"
        }
    }
    
    private var spanish: String {
        switch self {
        case .appTitle:
            return "WeSplit"
        case .amount:
            return "Monto"
        case .numberOfPeople:
            return "Cantidad de personas"
        case .people(let number):
            return "\(number) personas"
        case .percentOfTip(let percent):
            return "\(percent)%"
        case .tipSelectionTitle:
            return "¿Cuánta propina quieres dejar?"
        case .totalPerPerson:
            return "Total por persona"
        case .tipPerPerson:
            return "Propina por persona"
        }
    }
    
    var localized: String {
        let language = Locale.current.language.languageCode?.identifier
        switch language {
        case "es":
            return self.spanish
        default:
            return self.english
        }
    }
}
