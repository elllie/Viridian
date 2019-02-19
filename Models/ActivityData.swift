//
//  ActivityData.swift
//  Vridian
//
//  Created by Eleanor on 2/6/19.
//

extension Activity {
    static let a1 = Activity(id: 1, catID: 1, name: "Air-dried laundry", multiAdd: true, image: #imageLiteral(resourceName: "air-dried"), viewType: "a", pts: 37479, kWh: 3.0, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a2 = Activity(id: 2, catID: 1, name: "Hand-washed laundry", multiAdd: true, image: #imageLiteral(resourceName: "hand-washed"), viewType: "a", pts: 15432, kWh: 0.5, mi: nil, paper: nil, plastic: nil, water: 2.5)
    static let a3 = Activity(id: 3, catID: 4, name: "Ate a vegan meal", multiAdd: true, image: #imageLiteral(resourceName: "vegan-meal"), viewType: "b", pts: 14612, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a4 = Activity(id: 4, catID: 4, name: "Ate a vegetarian meal", multiAdd: true, image: #imageLiteral(resourceName: "vegetarian-meal"), viewType: "b", pts: 18265, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a5 = Activity(id: 5, catID: 4, name: "Ate leftovers", multiAdd: true, image: #imageLiteral(resourceName: "ate-leftovers"), viewType: "b", pts: 10000, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a6 = Activity(id: 6, catID: 1, name: "Obtained a refurbished or used device", multiAdd: true, image: #imageLiteral(resourceName: "refurbished-used"), viewType: "b", pts: 1216952, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a7 = Activity(id: 7, catID: 1, name: "Obtained an item without packaging", multiAdd: true, image: #imageLiteral(resourceName: "no-package"), viewType: "b", pts: 10000, kWh: nil, mi: nil, paper: 10, plastic: 10, water: nil)
    static let a8 = Activity(id: 8, catID: 4, name: "Bought local produce", multiAdd: true, image: #imageLiteral(resourceName: "harvested-food"), viewType: "b", pts: 10000, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a9 = Activity(id: 9, catID: 4, name: "Brewed own coffee or tea", multiAdd: true, image: #imageLiteral(resourceName: "home-brewed"), viewType: "b", pts: 1000, kWh: nil, mi: nil, paper: nil, plastic: 15, water: nil)
    static let a10 = Activity(id: 10, catID: 4, name: "Brought a reusable mug to buy coffee", multiAdd: true, image: #imageLiteral(resourceName: "mug"), viewType: "a", pts: 10000, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a11 = Activity(id: 11, catID: 1, name: "Carried groceries in a reusable bag", multiAdd: true, image: #imageLiteral(resourceName: "reusable-bag"), viewType: "a", pts: 794, kWh: nil, mi: nil, paper: nil, plastic: 6, water: nil)
    static let a12 = Activity(id: 12, catID: 1, name: "Composted", multiAdd: true, image: #imageLiteral(resourceName: "compost"), viewType: "b", pts: 100000, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    // the ratio here is actually 13 oz per 16 oz bottle of water, but i really want to store this as an integer
    static let a13 = Activity(id: 13, catID: 1, name: "Filled a reusable water bottle", multiAdd: false, image: #imageLiteral(resourceName: "reusable-bottle"), viewType: "a", pts: 117, kWh: nil, mi: nil, paper: nil, plastic: 1, water: nil)
    static let a14 = Activity(id: 14, catID: 1, name: "Lobbied elected officials about environment", multiAdd: true, image: #imageLiteral(resourceName: "call-senators"), viewType: "b", pts: 100000, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a15 = Activity(id: 15, catID: 3, name: "Battery", multiAdd: true, image: #imageLiteral(resourceName: "recycled-battery"), viewType: "a", pts: 3150, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a16 = Activity(id: 16, catID: 3, name: "Aluminum can", multiAdd: true, image: #imageLiteral(resourceName: "recycled-can"), viewType: "a", pts: 3150, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a17 = Activity(id: 17, catID: 3, name: "Electronic device", multiAdd: true, image: #imageLiteral(resourceName: "recycled-device"), viewType: "b", pts: 3150, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a18 = Activity(id: 18, catID: 3, name: "Cardboard or paper", multiAdd: true, image: #imageLiteral(resourceName: "paper-small"), viewType: "a", pts: 3150, kWh: nil, mi: nil, paper: 28, plastic: nil, water: nil)
    static let a19 = Activity(id: 19, catID: 3, name: "Clothing/textiles", multiAdd: true, image: #imageLiteral(resourceName: "recycled-fabric"), viewType: "b", pts: 3150, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a20 = Activity(id: 20, catID: 3, name: "Glass container", multiAdd: true, image: #imageLiteral(resourceName: "recycled-glass"), viewType: "a", pts: 3150, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a21 = Activity(id: 21, catID: 3, name: "Plastic bag", multiAdd: true, image: #imageLiteral(resourceName: "plastic-bag"), viewType: "a", pts: 3150, kWh: nil, mi: nil, paper: nil, plastic: 4, water: nil)
    static let a22 = Activity(id: 22, catID: 3, name: "Plastic container", multiAdd: true, image: #imageLiteral(resourceName: "plastic-large"), viewType: "a", pts: 3150, kWh: nil, mi: nil, paper: nil, plastic: 15, water: nil)
    static let a23 = Activity(id: 23, catID: 1, name: "Wore a reusable menstrual product", multiAdd: true, image: #imageLiteral(resourceName: "tampon"), viewType: "b", pts: 10000, kWh: nil, mi: nil, paper: nil, plastic: nil, water: nil)
    static let a24 = Activity(id: 24, catID: 2, name: "Reused cardboard", multiAdd: true, image: #imageLiteral(resourceName: "paper-large"), viewType: "b", pts: 10000, kWh: nil, mi: nil, paper: 28, plastic: nil, water: nil)
    static let a25 = Activity(id: 25, catID: 2, name: "Reused plastic bag", multiAdd: true, image: #imageLiteral(resourceName: "plastic-bag"), viewType: "a", pts: 10000, kWh: nil, mi: nil, paper: nil, plastic: 4, water: nil)
    // plastic razor weighs 8 grams
    static let a26 = Activity(id: 26, catID: 1, name: "Shaved with a reusable razor", multiAdd: true, image: #imageLiteral(resourceName: "razor"), viewType: "b", pts: 10000, kWh: nil, mi: nil, paper: nil, plastic: 8, water: nil)
    static let a27 = Activity(id: 27, catID: 1, name: "Switched to e-statements/billing", multiAdd: true, image: #imageLiteral(resourceName: "e-statements"), viewType: "b", pts: 10000, kWh: nil, mi: nil, paper: 28, plastic: nil, water: nil)
    static let a28 = Activity(id: 28, catID: 1, name: "Traveled on foot or bicycle", multiAdd: false, image: #imageLiteral(resourceName: "bicycle"), viewType: "a", pts: 6526, kWh: nil, mi: 1, paper: nil, plastic: nil, water: nil)
    static let a29 = Activity(id: 29, catID: 1, name: "Traveled via public transportation", multiAdd: false, image: #imageLiteral(resourceName: "public-transport"), viewType: "a", pts: 1345, kWh: nil, mi: 1, paper: nil, plastic: nil, water: nil)
}
