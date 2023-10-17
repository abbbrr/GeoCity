import SwiftUI

struct FieldExample: View {
    var country: CountryDataObject
    @Binding var selectedCity: String?
    
    var body: some View {
        ForEach(country.city, id: \.self) { city in
            HStack{
                Text("\(country.name),")
                Text(city)
            }
            .padding()
            .onTapGesture {
                let fullName = country.name + " " + city
                selectedCity = fullName
            }
        }

    }
}

//struct FieldExample_Preview: PreviewProvider {
//    static var previews: some View {
//        FieldExample(country: CountryDataObject(id: 1, name: "Kazakstan", city:["Astana", "Almaty", "Aktau", "Shymkent"] ))
//        }
//}
