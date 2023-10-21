import SwiftUI

struct test: View {
    @State private var text = ""
    @State private var isSearching = false
    @State private var isListVisible = false
    @State private var filteredCountries: [CountryDataObject] = []

        let countries = [
            CountryDataObject(id: 1, name: "Kazakhstan", city: [
                "Astana": ("51.1333", "71.4333"),
                "Almaty": ("43.2567", "76.9286"),
                "Aktau": ("43.65", "51.1667"),
                "Karaganda": ("49.8019", "73.1021")
            ]),
            CountryDataObject(id: 2, name: "Russian", city: [
                "Moscow": ("55.7525", "37.6178"),
                "Saint Petersburg": ("59.9386", "30.3141"),
                "Yekaterinburg": ("56.8519", "60.6122"),
                "Nizhny Novgorod": ("56.3287", "44.002")
            ]),
            CountryDataObject(id: 3, name: "USA", city: [
                "New York": ("40.7143", "-74.006"),
                "Washington": ("38.8951", "-77.0364"),
                "Los Angeles": ("34.0522", "-118.244"),
                "Chicago": ("41.85", "-87.65")
            ]),
            CountryDataObject(id: 4, name: "China", city: [
                "Beijing": ("39.9075", "116.397"),
                "Shanghai": ("31.2222", "121.458"),
                "Guangzhou": ("23.1167", "113.25"),
                "Shenzhen": ("22.5455", "114.068")
            ]),
            CountryDataObject(id: 5, name: "Brazil", city: [
                "Rio de Janeiro": ("-22.9064", "-43.1822"),
                "Sao Paulo": ("-23.5475", "-46.6361"),
                "Salvador": ("-12.9711", "-38.5108"),
                "Brasilia": ("-15.7797", "-47.9297")
            ]),
            CountryDataObject(id: 6, name: "Japan", city: [
                "Tokyo": ("35.6895", "139.692"),
                "Yokohama": ("35.4333", "139.65"),
                "Osaka": ("34.6937", "135.502"),
                "Nagoya": ("35.1815", "136.906")
            ]),
            CountryDataObject(id: 7, name: "Australia", city: [
                "Sydney": ("-33.8679", "151.207"),
                "Melbourne": ("-37.814", "144.963"),
                "Brisbane": ("-27.4679", "153.028"),
                "Adelaide": ("-34.9287", "138.599")
            ]),
        ]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("background_color")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center){
                    if text.count == 0{
                        Text("Discover")
                            .font(
                                .system(size: 40)
                                .weight(.heavy)
                            )
                          .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                          .padding(.bottom,30)
                        
                    }
                   
                    VStack{
                        HStack {
                            Image("search")
                                .padding(.horizontal, 10)
                            TextField("Search ...", text: $text)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .padding(.vertical, 8)
                                .font(
                                    Font.custom("Noto Sans", size: 16)
                                    .weight(.medium)
                                )
                                .onChange(of: text) { newText in
                                    if let firstCharacter = newText.first {
                                        text = firstCharacter.uppercased() + newText.dropFirst()
                                    }
                                }

                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .cornerRadius(25)
                        .shadow(color: .black.opacity(0.07), radius: 7.5, x: 0, y: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 23)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.91, green: 0.91, blue: 0.91), lineWidth: 1)
                        )
                        .padding()
                        .animation( isListVisible ? .easeIn(duration: 0.5) : .easeIn(duration: 0.2))
                        .onAppear(){
                            withAnimation {
                                isSearching = true
                            }
                        }
                        
                        if text.count >= 1{
                            if isListVisible{
                                List(filteredCountries, id: \.id) { country in
                                    ForEach(country.city.keys.sorted(), id: \.self) { city in
                                        NavigationLink(destination: HomeView(country: country.name, city: city, latitude: country.city[city]?.0 ?? "", longitude: country.city[city]?.1 ?? "")) {
                                            HStack {
                                                Text("\(country.name),")
                                                Text(city)
                                            }
                                        }
                                    }
                                }
                                .listStyle(PlainListStyle())
                            } else{
                                Text("К сожалению, мы не нашли подходящих стран.")
                                    .font(.system(size: 21, weight: .medium))
                                    .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal)
                                Image("ne")
                                    .resizable()
                                    .frame(width: 250,height: 250)
                            }
                           
                        }
                    }
                    .animation(isListVisible ? .easeIn(duration: text.count == 0 ? 0 : 1.5) : .easeIn(duration: text.count == 0 ? 0 : 0.5))
                    .onAppear(){
                        withAnimation {
                            isSearching = true
                        }
                    }
                    .onChange(of: text) { newValue in
                        filteredCountries = countries.filter { country in
                            let firstLetter = text.isEmpty ? "" : text.prefix(1)
                            return country.name.lowercased().hasPrefix(firstLetter.lowercased())
                        }
                        isListVisible = {
                            return !filteredCountries.isEmpty
                        }()
                    }
       
                    //MARK: -no info
                    if text.count == 0{
                        VStack(alignment:.center){
                            Text("Пожалуйста, введите сначала название страны, а затем название города.")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                            Image("ye")
                                .resizable()
                                .frame(width: 200,height: 200)
                            
                        }
                        .padding(.vertical,30)
                        .padding(.top,20)
                    }
                }
                .padding()
                .padding(.bottom,20)
            }

        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
