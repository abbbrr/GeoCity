import SwiftUI

struct test3: View {
    @State private var searchText = ""
    @State private var filteredCountries: [CountryDataObject] = []

        let countries = [
            CountryDataObject(id: 1, name: "Kazakhstan", city: [
                "Astana": ("51.1333", "51.1333"),
                "Almaty": ("51.1333", "51.1333"),
                "Aktau": ("51.1333", "51.1333"),
                "Karaganda": ("51.1333", "51.1333")
            ])
        ]

        var body: some View {
            VStack {
                TextField("Поиск", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                List(filteredCountries, id: \.id) { country in
                    ForEach(country.city.keys.sorted(), id: \.self) { city in
                        HStack{
                            Text("\(country.name),")
                            Text(city)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .onChange(of: searchText) { newValue in
                filteredCountries = countries.filter { country in
                    let countryName = country.name.lowercased()
                    return countryName.contains(newValue.lowercased())
                }
            }
        }
}


struct test3_perview: PreviewProvider {
    static var previews: some View {
        test3()
    }
}
