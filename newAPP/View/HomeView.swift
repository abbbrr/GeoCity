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
        Categories(id: 3, image: "park", name: "Hotels", shadowColor: Color.green.opacity(0.8)),
    ]
    @State private var clickCard:Int? = nil
    
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
                } else{
                    clickCard = index
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
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("background_color")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading){
                    Text("USA, New York")
                        .font(
                            .system(size: 35)
                            .weight(.heavy)
                        )
                        .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                        .padding()
                        .padding(.horizontal)
                    
                   
                    
                    //MARK: -categories
                    VStack(alignment:.leading){
                        Text("Categories")
                            .font(
                                .system(size: 22)
                                .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                            .padding()
                            .padding(.horizontal)
                        
//                        //MARK: -card
                        HStack{
                            CircleIconView()
                        }
                        
                    }
                    .padding(.vertical)
                    .padding(.top)
                    
                //MARK: -allCard
                    VStack(alignment:.leading){
                        Text("Most popular")
                            .font(
                                .system(size: 22)
                                .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                            .padding()
                            .padding(.horizontal)
                        
                        //MARK: -card
                        VStack(alignment:.leading,spacing: 9){
                            Image("img")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 223, height: 139)
                                .clipped()
                            HStack{
                                Text("Burj Khalifa")
                                  .font(
                                    Font.custom("Noto Sans", size: 20)
                                      .weight(.medium)
                                  )
                                  .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                                  .frame(maxWidth: .infinity, alignment: .topLeading)
                                
                                HStack{
                                    Image("star")
                                        .padding(0)
                                        .frame(width: 14, height: 14, alignment: .center)
                                    Text("4.8")
                                      .font(
                                        Font.custom("Noto Sans", size: 16)
                                          .weight(.medium)
                                      )
                                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                                }
                            }
                            //MARK: -button MAP
                            Button {
                                //
                            } label: {
                                HStack{
                                    Image(systemName: "mappin")
                                        .foregroundColor(.blue.opacity(0.7))
                                        .font(.title3)
                                    
                                    Text("Show on map")
                                        .foregroundColor(.blue.opacity(0.7))
                                        .fontWeight(.semibold)
                                }
                            }
                            .cornerRadius(50)
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 14)
                        .padding(.bottom, 24)
                        .frame(width: 250, height: 230)
                        .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                        .cornerRadius(26)
                        .shadow(color: .black.opacity(0.07), radius: 7.5, x: 0, y: 4)
                        .padding(.horizontal)
                    }
                }
            }
        }
        //end navigation
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
