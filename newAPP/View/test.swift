import SwiftUI

struct test: View {
    @State private var selctedCity: String?
    @StateObject var oo = SearchObservableObject()
    @State private var text = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color("background_color")
                    .edgesIgnoringSafeArea(.all)
                
                //MARK: -categories
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
                .padding(.vertical)
                
            }
            .navigationTitle("Discover")

        }
        .padding()
        .padding(.top, 30)
        .searchable(text: $text){
            ForEach(oo.searchResult) {country in
                FieldExample(country: country, selectedCity: $selctedCity)
            }
        }
        .onTapGesture {
            if let city = selctedCity{
                print(city)
                selctedCity = nil
                text = ""
            } else {}
        }
        .onChange(of: text) { newValue in
            oo.searchResult = oo.data.filter{ country in
                country.name.contains(text)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
