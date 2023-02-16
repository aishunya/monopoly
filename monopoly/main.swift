//
//  main.swift
//  monopoly
//
//  Created by Aisha Nurgaliyeva on 13.02.2023.
//
let MONEY_AMOUNT_FOR_EVERY_LOOP = 5_000_000
let START_CELL_BONUS = 2_500_000
let LUXURY_TAX = 2_500_000
let SALARY_REDUCE = 5_000_000
let RANDOM_CELL = 1_000_000

class Game {
    private var allCompanies: [Company] = []
    private var map: [[String: Any]] = []
    private var players: [Player] = []
    
    init() {
        let mapData = DataProvider.getMapData()
        for i in 0..<mapData.count {
            var data = [String: Any]()
            let currentCell = mapData[i]
            data["cellType"] = currentCell["cellType"]
            data["label"] = currentCell["name"]
            if currentCell["cellType"] as! CellType == CellType.company {
                let company = Company(
                    name: currentCell["name"] as! String,
                    type: currentCell["type"] as! CompanyType,
                    price: currentCell["price"] as! Int
                )
                data["company"]  = company
                allCompanies.append(company)
            }
            self.map.append(data)
        }
    }
    
    // Starting the game
    func start() {
        registerPlayers()
        print("\nGame has started, good luck everyone!🍀")
        printPlayersInfo()
        printMapInfo()
        while !isGameOver() {
            for i in 0..<self.players.count {
                let player = self.players[i]
                print("\n\(player.getName())'s turn")
                printMenu()
                var choice = readLine()
                while true {
                    switch choice {
                    case "1": rollDice(player: player)
                    case "2": printPlayersInfo()
                    case "3": printMapInfo()
                    default: rollDice(player: player)
                    }
                    if choice == "1" {
                        break
                    }
                    printMenu()
                    choice = readLine()
                }
            }
        }
    }
    
    // Getting the number and names of the players
    func registerPlayers() {
        print("Hi!\nWelcome to the Monopoly game!🫶🏼\nEnter the number of players(2-4)👥:")
        let numberOfPlayers = Int(readLine()!)!
        print("\nGood!\nNow enter players' names.")
        for i in 0..<numberOfPlayers {
            print("\nPlayer #\(i+1):")
            let name = readLine()!
            self.players.append(Player(name: name))
        }
    }
    
    // Rolling the dice to move forward
    func rollDice(player: Player){
        let firstDice = Int.random(in: 1...6)
        let secondDice = Int.random(in: 1...6)
        let numberOfSteps = firstDice + secondDice
        print("First dice: \(firstDice)")
        print("Second dice: \(secondDice)")
        print("\nNumber of steps: \(numberOfSteps)")
        movePlayer(player: player, steps: numberOfSteps)
    }
    
    // Moving to positions and response according to them
    func movePlayer(player: Player, steps: Int) {
        var position = player.getPosition() + steps
        
        // Closing the loop and getting the bonus
        if position >= self.map.count {
            position -= self.map.count
            player.addToBudget(amount: MONEY_AMOUNT_FOR_EVERY_LOOP)
            print("\nYou received \(MONEY_AMOUNT_FOR_EVERY_LOOP) bonus for completing the map🔁")
        }
        
        // Setting position and informing the player
        player.setPosition(position: position)
        
        let cell = self.map[position]
        let cellType = cell["cellType"] as! CellType
        print("\nYou are on cell number \(position + 1)(\(cell["label"]!)) now")
        
        // Response on the cell type
        switch cellType {
        case CellType.police:
            position = 10
            player.setPosition(position: position)
            print("\nPolice caught you, welcome to prison!🚓")
        case CellType.start:
            player.addToBudget(amount: START_CELL_BONUS)
            print("\nYou were awarded with \(START_CELL_BONUS) by standing at start cell💰")
        case CellType.luxuryTax:
            player.reduceBudget(amount: LUXURY_TAX)
            print("\nYou need to pay luxury tax of \(LUXURY_TAX)💎")
        case CellType.prison:
            print("\nWelcome to prison!👮🏻‍♂️")
        case CellType.rest:
            print("\nIt's a vacation cell, take a rest!🏝️")
        case CellType.salary:
            player.reduceBudget(amount: SALARY_REDUCE)
            print("\nYou fckd up! Salary reduce!💸")
        case CellType.random:
            let randomAction = Int.random(in: 1...3)
            if randomAction == 1 {
                player.addToBudget(amount: RANDOM_CELL)
                print("\nYou were given \(RANDOM_CELL) from random cell💰")
            } else if randomAction == 2 {
                player.reduceBudget(amount: RANDOM_CELL)
                print("\nYou must pay \(RANDOM_CELL) for random cell💸")
            } else {
                let randomNumOfSteps = Int.random(in: 1...39)
                print("\nYou are going to travel to a randomly chosen cell!✈️")
                movePlayer(player: player, steps: randomNumOfSteps)
            }
        case CellType.company:
            let company = cell["company"] as! Company
            let companyOwner = company.getOwner()
            
            // The logic if the company is already owned by someone
            if companyOwner != nil {
                if companyOwner === player {
                    print("It's your cell, so you don't need to pay a rent😎")
                } else {
                    let rentPrice = company.getRentPrice()
                    print("This cell belongs to \(companyOwner!.getName()) so you need to pay him rent amount of \(rentPrice)💸")
                    player.reduceBudget(amount: rentPrice)
                    company.getOwner()?.addToBudget(amount: rentPrice)
                }
            } else {
                let companyPrice = company.getPrice()
                if player.getBudget() >= companyPrice {
                    print("You can buy \(company.getName()). Enter 1 to buy or 2 to refuse")
                    print("1. Buy 🤑")
                    print("2. Refuse ❌")
                    
                    let choice = readLine()!
                    if choice == "1" {
                        player.reduceBudget(amount: companyPrice)
                        company.setOwner(owner: player)
                        player.buyCompany(company: company)
                        
                        // Check if the player owned monopoly
                        var isMonopoly = true
                        for i in 0..<self.allCompanies.count {
                            if allCompanies[i].getType() == company.getType() && allCompanies[i].getOwner() !== player {
                                isMonopoly = false
                                break
                            }
                        }
                        if (isMonopoly) {
                            player.addMonopolies(companyType: company.getType())
                            for i in 0..<self.allCompanies.count {
                                allCompanies[i].setInMonopoly(inMonopoly: true)
                            }
                        }
                    }
                }
            }
        }
            
        
    }
    
    // Providing the list of available actions to a player
    func printMenu() {
        print("Menu:")
        print("1. Roll dice 🎲")
        print("2. Show players info ℹ️")
        print("3. Show map 🗺️")
        print("\nChoose your action")
    }
    
    // Providing current info to players
    func printPlayersInfo() {
        print("\nPlayers state:")
        for i in 0..<self.players.count {
            print(players[i].toString())
        }
    }
    
    // Providing the map information
    func printMapInfo() {
        for i in 0..<self.map.count {
            let cell = self.map[i]
            if cell["cellType"] as! CellType == CellType.company {
                var cellInfo: [String] = []
                let company = cell["company"] as! Company
                let companyOwner = company.getOwner()
                cellInfo.append("Cell #\(i+1): \(cell["label"]!)")
                cellInfo.append("Company type: \(company.getType())")
                if (companyOwner != nil) {
                    cellInfo.append("Owner: \(companyOwner!.getName())")
                    cellInfo.append("Rent price: \(company.getRentPrice())")
                } else {
                    cellInfo.append("Price: \(company.getPrice())")
                }
                print(cellInfo.joined(separator: ", "))
            } else {
                print("Cell #\(i+1): \(cell["label"]!)")
            }
        }
    }
    
    // Checking if only one player is not bankrupt
    func isGameOver() -> Bool {
        var nonBankruptsCount = 0
        for i in 0..<self.players.count {
            if !self.players[i].getIsBankrupt() {
                nonBankruptsCount += 1
            }
        }
        return nonBankruptsCount == 1
    }
}

var game = Game()
game.start()
