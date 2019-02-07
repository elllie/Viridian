//
//  ActivityData.swift
//  Vridian
//
//  Created by Eleanor on 2/6/19.
//

extension Activity {
    static let a1 = Activity(id: 1, catID: 1, name: "Air-dried laundry", multiAdd: true, image: #imageLiteral(resourceName: "air-dried"), pts: 37479, kWh: 3.0, mi: nil, paper: nil, plastic: nil, water: nil)
    // a2 was Pescatarian Meal but turns out that's actually not good for the environment at all
    static let a3 = Activity(id: 3, catID: 4, name: "Ate a vegan meal", multiAdd: true, image: #imageLiteral(resourceName: "vegan-meal"), pts: 14612, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a4 = Activity(id: 4, catID: 4, name: "Ate a vegetarian meal", multiAdd: true, image: #imageLiteral(resourceName: "vegetarian-meal"), pts: 18265, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a5 = Activity(id: 5, catID: 4, name: "Ate leftovers", multiAdd: true, image: #imageLiteral(resourceName: "ate-leftovers"), pts: 20000, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a6 = Activity(id: 6, catID: 1, name: "Obtained a refurbished or used device", multiAdd: true, image: #imageLiteral(resourceName: "refurbished-used"), pts: 13900, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a7 = Activity(id: 7, catID: 1, name: "Obtained an item without packaging", multiAdd: true, image: #imageLiteral(resourceName: "no-package"), pts: 1500, kWh: nil, mi: nil, paper: 10, plastic: 10, water: nil)
    static let a8 = Activity(id: 8, catID: 4, name: "Bought local produce", multiAdd: true, image: #imageLiteral(resourceName: "harvested-food"), pts: 15000, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a9 = Activity(id: 9, catID: 4, name: "Brewed own coffee or tea", multiAdd: true, image: #imageLiteral(resourceName: "home-brewed"), pts: 1250, kWh: nil, mi: nil, paper: nil, plastic: 15, water: nil)
    // a10 is brought a reusable mug to buy coffee but it's super niche and idk what the real impact of it is
    static let a11 = Activity(id: 11, catID: 1, name: "Carried groceries in a reusable bag", multiAdd: true, image: #imageLiteral(resourceName: "reusable-bag"), pts: 794, kWh: nil, mi: nil, paper: nil, plastic: 6, water: nil)
    static let a12 = Activity(id: 12, catID: 1, name: "Composted", multiAdd: true, image: #imageLiteral(resourceName: "compost"), pts: 100000, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    // the ratio is actually 13 oz per 16 oz bottle of water, but i really want to store this as an integer
    static let a13 = Activity(id: 13, catID: 1, name: "Filled a reusable water bottle", multiAdd: false, image: #imageLiteral(resourceName: "reusable-bottle"), pts: 105, kWh: nil, mi: nil, paper: nil, plastic: 1, water: nil)
    static let a14 = Activity(id: 14, catID: 1, name: "Hand-washed laundry", multiAdd: true, image: #imageLiteral(resourceName: "hand-washed"), pts: 15432, kWh: 0.5, mi: nil, paper: nil, plastic: nil, water: 2.5)
}
