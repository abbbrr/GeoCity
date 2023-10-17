import Foundation

class MockSevice{
    public static let shared = MockSevice()
    
    func getData() -> [CountryDataObject]{
        return[
            CountryDataObject(id: 1, name: "Kazakhstan", city: ["Astana", "Almaty", "Aktau", "Shymkent"]),
            CountryDataObject(id: 2, name: "Russia", city: ["Moscow", "Saint Petersburg", "Yekaterinburg", "Nizhny Novgorod"]),
            CountryDataObject(id: 3, name: "Ukraine", city: ["Kyiv", "Kharkiv", "Odesa", "Dnipro"]),
            CountryDataObject(id: 4, name: "USA", city: ["Washington", "New York", "Los Angeles", "Chicago"]),
            CountryDataObject(id: 5, name: "China", city: ["Beijing", "Shanghai", "Guangzhou", "Shenzhen"]),
            CountryDataObject(id: 6, name: "India", city: ["New Delhi", "Mumbai", "Chennai", "Bangalore"]),
            CountryDataObject(id: 7, name: "Brazil", city: ["Rio de Janeiro", "Sao Paulo", "Salvador", "Brasilia"]),
            CountryDataObject(id: 8, name: "Japan", city: ["Tokyo", "Yokohama", "Osaka", "Nagoya"]),
            CountryDataObject(id: 9, name: "Australia", city: ["Sydney", "Melbourne", "Brisbane", "Adelaide"]),

        ]
    }
}
