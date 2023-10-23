import Foundation

class MockSevice{
    public static let shared = MockSevice()

    func getData() -> [CountryDataObject]{
        return[
            CountryDataObject(id: 1, name: "Kazakhstan", city: ["Astana":("51.1333", "51.1333"), "Almaty":("51.1333", "51.1333"), "Aktau":("51.1333", "51.1333"), "Karaganda":("51.1333", "51.1333")]),


        ]
    }
}
