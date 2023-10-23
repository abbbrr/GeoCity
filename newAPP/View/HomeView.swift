import SwiftUI

struct Categories{
    let id:Int
    let image:String
    let name:String
    let shadowColor: Color
}

//MARK: -component
struct CircleIconView: View {
    var categories = [
        Categories(id: 1, image: "food", name: "Restaurant", shadowColor: Color.red.opacity(0.8)),
        Categories(id: 2, image: "extreme", name: "Attractions", shadowColor: Color.yellow.opacity(0.8)),
    ]
    @State private var clickCard:Int? = nil
    @Binding var categor:String
    
    var body: some View {
        ForEach(categories.enumerated().map { $0 }, id: \.1.id){ index, categorie in
            VStack{
                ZStack {
                    Circle()
                        .frame(width: 77, height: 77)
                        .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
                        .shadow(
                            color: clickCard == index ? Color.orange.opacity(0.8) : Color.black.opacity(0.1),
                            radius: clickCard == index ? 7 : 10,
                            x: 0, y: 0)
                    Image("\(categorie.image)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipped()
                        .shadow(color: categorie.shadowColor, radius: 20)
                }
                Text("\(categorie.name)")
                  .font(Font.custom("Noto Sans", size: 17))
                  .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
            }
            .padding(.leading)
            .onTapGesture {
                if clickCard == index {
                    clickCard = nil
                    categor = ""
                } else {
                    clickCard = index
                    categor = categorie.name
                    print(categor)
                }
            }
        }
//        .navigationBarBackButtonHidden(true)
    }
}


struct HomeView: View {
    @State private var isLoading = false
    @State private var selectedCity: String?
    @StateObject var searchModel = SearchObservableObject()
    @State private var text = ""
    @State private var categor = ""
    
    var country:String
    var city:String
    var latitude:String
    var longitude:String
    
    var body: some View {
        ZStack(alignment: .center){
            Color("background_color")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                VStack(alignment: .center){
                    Text("\(country), \(city)")
                        .font(
                            .system(size: 31)
                            .weight(.heavy)
                        )
                        .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                        .padding()
                    
                    //MARK: -categories
                    VStack(alignment:.leading){
                        Text("Categories")
                            .font(
                                .system(size: 22)
                                .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                            .padding(.horizontal)
                            .padding(.trailing,150)
                        
                    //MARK: -card
                        HStack{
                            CircleIconView(categor: $categor)
                        }
                        
                    }.padding(.top)
                    
                //MARK: -allCard
                    VStack(alignment:.center){
                        if !categor.isEmpty{
                            if categor == "Restaurant"{
                                Text("Restaurant")
                                    .font(
                                        .system(size: 22)
                                        .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                    .padding()
                                    .padding(.horizontal)
                                    .padding(.trailing,150)
                                
                                //выгрузка данных из API
                                VStack(alignment: .trailing){
                                    if isLoading{
                                        ProgressView("Loading...")
                                                .progressViewStyle(CircularProgressViewStyle())
                                                .scaleEffect(1.5)
                                                .padding()
                                                .padding(.top,100)
                                    } else{
                                        test2(cor1: latitude, cor2: longitude, content: "restaurants")

                                    }
                                }
                            }else{
                                Text("Atractions")
                                    .font(
                                        .system(size: 22)
                                        .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                    .padding()
                                    .padding(.horizontal)
                                    .padding(.trailing,150)
                                
                                //выгрузка данных из API
                                VStack(alignment: .trailing){
                                    if isLoading{
                                        ProgressView("Loading...")
                                                .progressViewStyle(CircularProgressViewStyle())
                                                .scaleEffect(1.5)
                                                .padding()
                                                .padding(.top,100)
                                    } else{
                                        test2(cor1: latitude, cor2: longitude, content: "attractions")
                                    }
                                }
                            }
                        }else {
                            VStack(spacing: 0){
                                Image("je")
                                    .resizable()
                                    .frame(width: 285,height: 290)
                                    .padding(.horizontal)
                                
                                Text("NOTHING")
                                    .font(
                                        .system(size: 25)
                                        .weight(.bold)
                                    )
                                    .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                    .padding(.bottom,5)
                                Text("Your collection list is empty.")
                                    .font(
                                        .system(size: 20)
                                        .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                            }
                        }
                    }
                }.padding()
            } //end scrolview
            
        }
        .onAppear {
            // Начало загрузки данных
            isLoading = true
            // Ваш код для загрузки данных из API
            loadDataFromAPI()
        }
    }
    func loadDataFromAPI(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(country: "USA", city: "New York", latitude: "40.7143", longitude: "-74.006")
    }
}
