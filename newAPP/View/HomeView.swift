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
        Categories(id: 1, image: "extreme", name: "Attractions", shadowColor: Color.yellow.opacity(0.8)),
        Categories(id: 2, image: "food", name: "Restaurant", shadowColor: Color.red.opacity(0.8)),
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
        .navigationBarBackButtonHidden(true)
    }
}


struct HomeView: View {
    @State private var selectedCity: String?
    @StateObject var searchModel = SearchObservableObject()
    @State private var text = ""
    @State private var categor = ""
    
    var country:String
    var city:String
    var latitude:String
    var longitude:String
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading){
                Color("background_color")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack(alignment: .leading){
                        Text("\(country), \(city)")
                            .font(
                                .system(size: 31)
                                .weight(.heavy)
                            )
                            .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                            .padding()
//                        Text(latitude)
//                        Text(longitude)
                        
                        //MARK: -categories
                        VStack(alignment:.leading){
                            Text("Categories")
                                .font(
                                    .system(size: 22)
                                    .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                .padding(.horizontal)
                            
                        //MARK: -card
                            HStack{
                                CircleIconView(categor: $categor)
                            }
                            
                        }.padding(.top)
                        
                    //MARK: -allCard
                        VStack(alignment:.center){
                            if !categor.isEmpty{
                                if categor == "Restaurant"{
                                    Text("Рестораны")
                                        .font(
                                            .system(size: 22)
                                            .weight(.medium)
                                        )
                                        .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                        .padding()
                                } else if categor == "Attractions"{
                                    Text("Атракционы")
                                        .font(
                                            .system(size: 22)
                                            .weight(.medium)
                                        )
                                        .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                        .padding()
                                }else{
                                    Text("че то вообще не то")
                                }
                            }else {
    //                                test2()
                                
                                Text("Список пуст!")
                                    .font(
                                        .system(size: 22)
                                        .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                Image("je")
                                    .resizable()
                                    .frame(width: 295,height: 320)
                                    .padding()
                                    .padding(.horizontal)
                            }
                        }
                    }.padding()
                } //end scrolview
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(country: "USA", city: "New York", latitude: "40.7143", longitude: "-74.006")
    }
}
