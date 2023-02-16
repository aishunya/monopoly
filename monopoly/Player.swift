//
//  Player.swift
//  monopoly
//
//  Created by Aisha Nurgaliyeva on 13.02.2023.
//

class Player {
    private var name: String
    private var budget: Int = 2_000_000_000
    private var companies: [Company] = []
    private var monopolies: [CompanyType] = []
    private var position: Int = 0
    private var isBankrupt: Bool = false
    
    init(name: String) {
        self.name = name
    }
    
    func buyCompany(company: Company) {
        self.companies.append(company)
    }
    
    func addMonopolies(companyType: CompanyType) {
        self.monopolies.append(companyType)
    }
    
    func getPosition() -> Int {
        return self.position
    }
    
    func setPosition(position: Int) {
        self.position = position
    }
    
    func getBudget() -> Int {
        return self.budget
    }
    
    func addToBudget(amount: Int) {
        self.budget += amount
    }
    
    func reduceBudget(amount: Int) {
        self.budget -= amount
        if self.budget < 0 {
            self.isBankrupt = true
            print("You are a bankrupt! GG.")
        }
    }
    
    func toString() -> String {
        return "\t\(self.name): \n\t\tCompanies: \(self.companies.map{ $0.getName() }.joined(separator: ", ")) \n\t\tMonopolies: \(self.monopolies.map{ $0.rawValue }.joined(separator: ", "))\n\t\tBudget: \(self.budget)\n\t\tPosition: \(self.position)"
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getIsBankrupt() -> Bool {
        return self.isBankrupt
    }
}
