//
//  DataProvider.swift
//  monopoly
//
//  Created by Aisha Nurgaliyeva on 15.02.2023.
//

class DataProvider {
    init(){}
    
    static func getMapData() -> [[String: Any]] {
        return [
            [
                "cellType": CellType.start,
                "name": "Start"
            ],
            [
                "name": "Chanel",
                "type": CompanyType.brand,
                "price": 78_000_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.random,
                "name": "Random action"
            ],
            [
                "name": "Hugo Boss",
                "type": CompanyType.brand,
                "price": 78_000_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.salary,
                "name": "Salary tax"
            ],
            [
                "name": "Mercedes",
                "type": CompanyType.car,
                "price": 260_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Adidas",
                "type": CompanyType.cloth,
                "price": 102_400_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.random,
                "name": "Random action"
            ],
            [
                "name": "Puma",
                "type": CompanyType.cloth,
                "price": 130_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Lacoste",
                "type": CompanyType.cloth,
                "price": 146_000_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.prison,
                "name": "Prison"
            ],
            [
                "name": "Facebook",
                "type": CompanyType.socialNetwork,
                "price": 169_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Rockstar",
                "type": CompanyType.game,
                "price": 234_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Telegram",
                "type": CompanyType.socialNetwork,
                "price": 182_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Twitter",
                "type": CompanyType.socialNetwork,
                "price": 182_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Audi",
                "type": CompanyType.car,
                "price": 260_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Coca Cola",
                "type": CompanyType.drink,
                "price": 195_000_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.random,
                "name": "Random action"
            ],
            [
                "name": "Pepsi Cola",
                "type": CompanyType.drink,
                "price": 208_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Fanta",
                "type": CompanyType.drink,
                "price": 221_000_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.rest,
                "name": "Take a rest"
            ],
            [
                "name": "American Airlines",
                "type": CompanyType.airline,
                "price": 234_000_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.random,
                "name": "Random action"
            ],
            [
                "name": "Lufthansa",
                "type": CompanyType.airline,
                "price": 247_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "British Airlines",
                "type": CompanyType.airline,
                "price": 260_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Ford",
                "type": CompanyType.car,
                "price": 260_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "MacDonalds",
                "type": CompanyType.food,
                "price": 273_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Burger King",
                "type": CompanyType.food,
                "price": 286_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "UbiSoft",
                "type": CompanyType.game,
                "price": 234_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "KFC",
                "type": CompanyType.food,
                "price": 299_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Police",
                "cellType": CellType.police
            ],
            [
                "name": "Holiday Inn",
                "type": CompanyType.hotel,
                "price": 390_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Radisson Blue",
                "type": CompanyType.hotel,
                "price": 416_000_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.random,
                "name": "Random action"
            ],
            [
                "name": "Novotel",
                "type": CompanyType.hotel,
                "price": 442_000_000,
                "cellType": CellType.company
            ],
            [
                "name": "Land Rover",
                "type": CompanyType.car,
                "price": 260_000_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.luxuryTax,
                "name": "Luxury tax"
            ],
            [
                "name": "Apple",
                "type": CompanyType.tech,
                "price": 468_000_000,
                "cellType": CellType.company
            ],
            [
                "cellType": CellType.random,
                "name": "Random action"
            ],
            [
                "name": "Nokia",
                "type": CompanyType.tech,
                "price": 520_000_000,
                "cellType": CellType.company
            ],
        ]
    }
}
