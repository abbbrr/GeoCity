import SwiftUI
import URLImage
import SDWebImageSwiftUI

struct RestaurantResponse: Codable {
    let data: [Restaurant]
}

struct Restaurant: Codable {
    let location_id: String
    let name: String?
    let latitude: String?
    let longitude: String?
    let num_reviews: String?
    let timezone: String?
    let location_string: String?
    let doubleclick_zone: String?
    let preferred_map_engine: String?
    let raw_ranking: String?
    let ranking_geo: String?
    let ranking_geo_id: String?
    let ranking_position: String?
    let ranking_denominator: String?
    let ranking_category: String?
    let ranking: String?
    let distance: String?
    let distance_string: String?
    let bearing: String?
    let rating: String?
    let open_now_text: String?
    let is_long_closed: Bool?
    let price_level: String?
    let price: String?
    let description: String?
    let web_url: String?
    let write_review: String?
    let phone:String?
    let website:String?
    let address:String?
    var photo: photo?
}

struct photo: Codable {
    var images: [String: medium]?
}
struct medium: Codable{
    var url:String?
}

struct test2: View {
    @State private var restaurants: [Restaurant] = []
    
    let cor1:String
    let cor2:String
    
    var content: String

    var body: some View {
        VStack(alignment: .leading){
            ForEach(restaurants, id: \.location_id) { restaurant in
                VStack(alignment:.leading,spacing: 9){

                    if let photo = restaurant.photo?.images, let imageURL = photo["medium"]?.url,
                       let url = URL(string: imageURL){
                        URLImage(url){image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 270, height: 139)
                                .cornerRadius(15)
                                .clipped()
                        }
                    } else{
                        Image("404")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 270, height: 139)
                            .cornerRadius(15)
                            .clipped()
                    }
                    
                   
                    HStack{
                        if let name = restaurant.name{
                            Text("\(name)")
                              .font(
                                Font.custom("Noto Sans", size: 20)
                                  .weight(.medium)
                              )
                              .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                              .frame(maxWidth: .infinity, alignment: .topLeading)
                        } else {
                            Text("no name")
                              .font(
                                Font.custom("Noto Sans", size: 20)
                                  .weight(.medium)
                              )
                              .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                              .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        
                       
                        
                        HStack{
                            Image("star")
                                .padding(0)
                                .frame(width: 14, height: 14, alignment: .center)
                            if let rating = restaurant.rating{
                                Text("\(rating)")
                                  .font(
                                    Font.custom("Noto Sans", size: 16)
                                      .weight(.medium)
                                  )
                                  .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                            }else{
                                Text("2.2")
                                  .font(
                                    Font.custom("Noto Sans", size: 16)
                                      .weight(.medium)
                                  )
                                  .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                            }
                           
                        }
                    }
                    Text("Restaurant")
                        .foregroundColor(.gray)
                    
                    //MARK: -button MAP
                    NavigationLink(destination: PageScreen(restaurant: restaurant)) {
                        Text("See Details")
                    }

                }
                .padding(.horizontal, 15)
                .padding(.top, 14)
                .padding(.bottom, 24)
                .frame(width: 300, height: 270)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                .cornerRadius(26)
                .shadow(color: .black.opacity(0.07), radius: 7.5, x: 0, y: 4)
                .padding(.horizontal)
            }
        }
        .onAppear(perform: fetchData)
    }

    func fetchData() {
        let headers = [
            "X-RapidAPI-Key": "a8386cc56amsh478a280d4e92cebp107863jsn07d43f128108",
            "X-RapidAPI-Host": "travel-advisor.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://travel-advisor.p.rapidapi.com/\(content)/list-by-latlng?latitude=\(cor1)&longitude=\(cor2)&limit=30&currency=USD&distance=2&lunit=km&lang=en_US")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(RestaurantResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.restaurants = response.data
                    }
                    
                    for restaurant in restaurants {
                        print("Location ID: \(restaurant.location_id)")
                        print("Name: \(String(describing: restaurant.name))")
                        print("Latitude: \(String(describing: restaurant.latitude))")
                        print("Longitude: \(String(describing: restaurant.longitude))")
                        print("Num Reviews: \(String(describing: restaurant.num_reviews))")
                        print("Timezone: \(String(describing: restaurant.timezone))")
                        print("Location String: \(String(describing: restaurant.location_string))")
                        print("Doubleclick Zone: \(String(describing: restaurant.doubleclick_zone))")
                        print("Preferred Map Engine: \(String(describing: restaurant.preferred_map_engine))")
                        print("Raw Ranking: \(String(describing: restaurant.raw_ranking))")
                        print("Ranking Geo: \(String(describing: restaurant.ranking_geo))")
                        print("Ranking Geo ID: \(String(describing: restaurant.ranking_geo_id))")
                        print("Ranking Position: \(String(describing: restaurant.ranking_position))")
                        print("Ranking Denominator: \(String(describing: restaurant.ranking_denominator))")
                        print("Ranking Category: \(String(describing: restaurant.ranking_category))")
                        print("Ranking: \(String(describing: restaurant.ranking))")
                        print("Distance: \(String(describing: restaurant.distance))")
                        print("Distance String: \(String(describing: restaurant.distance_string))")
                        print("Bearing: \(String(describing: restaurant.bearing))")
                        print("Rating: \(String(describing: restaurant.rating))")
                        print("Open Now Text: \(String(describing: restaurant.open_now_text))")
                        print("Is Long Closed: \(String(describing: restaurant.is_long_closed))")
                        print("Price Level: \(String(describing: restaurant.price_level))")
                        print("Price: \(String(describing: restaurant.price))")
                        print("Description: \(String(describing: restaurant.description))")
                        print("Web URL: \(String(describing: restaurant.web_url))")
                        print("Write Review: \(String(describing: restaurant.write_review))")
                        print("-----")
                    }
                } catch {
                    print("Ошибка при парсинге JSON: \(error)")
                }
            }
        })
        dataTask.resume()

    }
}
struct test2_Previews: PreviewProvider {
    static var previews: some View {
        test2(cor1: "55.7525", cor2: "37.6178", content: "attractions")
    }
}
