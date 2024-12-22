//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Bipul Islam on 22/12/24.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable, Decodable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    let categoryId: Int
    let category: String
    let isPending: Bool
    let isExpense: Bool
    let isEdited: Bool
    
    var icon: String {
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon
        }
        
        return "questionmark.circle.dashed"
    }
    
    var dateParsed: Date{
        date.dateParsed()
    }
    
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: String
    var mainCategoryId: Int?
}

extension Category {
    //Main Category
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: "car.top.frontright.arrowtriangle.fill")
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: "dollarsign.ring")
    static let entertainment = Category(id: 3, name: "Entertainment", icon: "film")
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: "singaporedollarsign.bank.building")
    static let foodAndDining = Category (id: 5, name: "Food & Dining", icon: "cup.and.heat.waves")
    static let home = Category(id: 6, name: "Home", icon: "house.fill")
    static let income = Category (id: 7, name: "Income", icon: "dollarsign.ring")
    static let shopping = Category(id: 8, name: "Shopping", icon: "cart")
    static let transfer = Category(id: 9, name: "Transfer", icon: "arrow.left.arrow.right")
    
    //Sub Category
    static let publicTransportation = Category (id: 101, name: "Public Transportation", icon: "bus.doubledecker.fill", mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: "bus", mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: "phone", mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: "film", mainCategoryId: 3)
    static let bankFee = Category (id: 401, name: "Bank Fee", icon: "bahtsign.bank.building", mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: "australiandollarsign.circle", mainCategoryId: 4)
    static let groceries = Category (id: 501, name: "Groceries", icon: "basket", mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", icon: "fork.knife.circle", mainCategoryId: 5)
    static let rent = Category (id: 601, name: "Rent", icon: "play.house.fill", mainCategoryId: 6)
    static let homeSupplies = Category (id: 602, name: "Home Supplies", icon: "light.cylindrical.ceiling.fill", mainCategoryId: 6)
    static let paycheque = Category (id: 701, name: "Paycheque", icon: "dollarsign.ring", mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: "square.and.pencil.circle", mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon:  "arrow.left.arrow.right", mainCategoryId: 9)
}

extension Category {
    
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities
    ]
    
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    
    
    static let all: [Category] = categories + subCategories
}
