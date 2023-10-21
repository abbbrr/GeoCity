//import SwiftUI
//
//struct FieldExample: View {
//    var country: CountryDataObject
//    @Binding var selectedCity: String?
//    
//    var body: some View {
//        ForEach(country.city.keys.sorted(), id: \.self) { city in
//            if country.city[city] != nil {
//                NavigationLink(destination: HomeView()) {
//                    HStack {
//                        Text("\(country.name),")
//                        Text(city)
//                    }
//                    .contentShape(Rectangle())
//                    .padding()
//                    .onTapGesture {
//                        let fullName = country.name + " " + city
//                        selectedCity = fullName
//                    }
//                }
//            }
//        }
//    }
//}
