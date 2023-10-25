import SwiftUI

struct PageScreen: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment:.leading){
            VStack{
                if (restaurant.photo != nil) {
                    Image("\(restaurant.photo)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 240)
                        .cornerRadius(40)
                        .clipped()
                } else{
                    Image("404")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 240)
                        .cornerRadius(40)
                        .clipped()
                }
               
            }
            
            HStack{
                Text("\(restaurant.name ?? "no name" )")
                  .font(
                    Font.custom("Noto Sans", size: 28)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                  .padding()
                
                Spacer()
                
                Image(systemName: "star.fill")
                    .padding(0)
                    .frame(width: 25, height: 26, alignment: .center)
                    .foregroundColor(.yellow)
                
                if let rating = restaurant.rating{
                    Text("\(rating)")
                      .font(
                        Font.custom("Noto Sans", size: 20)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                }else{
                    Text("1.0")
                      .font(
                        Font.custom("Noto Sans", size: 20)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                }
                    
            }
            
            VStack(spacing:23){
                if let address = restaurant.address{
                    Text("Street: \(address)")
                      .font(Font.custom("Noto Sans", size: 20))
                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                }else{
                    Text("Street: no addrees")
                      .font(Font.custom("Noto Sans", size: 20))
                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                }
               
                if let website = restaurant.website{
                    Text("Link: \(website)")
                      .font(Font.custom("Noto Sans", size: 20))
                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                } else{
                    Text("Link: no link")
                      .font(Font.custom("Noto Sans", size: 20))
                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                }
              
                if let phone = restaurant.phone{
                    Text("Phone: \(phone)")
                      .font(Font.custom("Noto Sans", size: 20))
                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                }else{
                    Text("Phone: no phone")
                      .font(Font.custom("Noto Sans", size: 20))
                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                }
               
            }.padding()
            
                
            Spacer()
            
        }
        .padding(.horizontal, 19)
        .padding(.top, 15)
        .padding(.bottom, 24)
        .background(Color(red: 0.99, green: 0.99, blue: 0.99))
        .cornerRadius(26)
        .shadow(color: .black.opacity(0.07), radius: 7.5, x: 0, y: 4)

    }
}

//struct PageScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        PageScreen(restaurant: Restaurantx)
//    }
//}
