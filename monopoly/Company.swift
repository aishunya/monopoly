//
//  Company.swift
//  monopoly
//
//  Created by Aisha Nurgaliyeva on 13.02.2023.
//

class Company {
    private var name: String
    private var type: CompanyType
    private var price: Int
    private var defaultRentPrice: Int
    private var owner: Player?
    private var inMonopoly: Bool = false
    
    init(name: String, type: CompanyType, price: Int) {
        self.name = name
        self.type = type
        self.price = price
        self.defaultRentPrice = price / 10
    }
    
    func getRentPrice() -> Int {
        return !self.inMonopoly ? self.defaultRentPrice : 3 * self.defaultRentPrice
    }
    
    func setOwner(owner: Player) {
        self.owner = owner
    }
    
    func getOwner() -> Player? {
        return self.owner
    }
    
    func setInMonopoly(inMonopoly: Bool) {
        self.inMonopoly = inMonopoly
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getPrice() -> Int {
        return self.price
    }
    
    func getType() -> CompanyType{
        return self.type
    }
}


