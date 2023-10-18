import SwiftUI


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
}

struct test2: View {
    @State private var restaurants: [Restaurant] = []

    var body: some View {
        NavigationView {
            List(restaurants, id: \.location_id) { restaurant in
                VStack{
                    Text("Location ID: \(restaurant.location_id)")
                        .foregroundColor(.black)
                        if let name = restaurant.name {
                            Text("Name: \(name)")
                                .foregroundColor(.black)
                        } else {
                            Text("Name: N/A")
                                .foregroundColor(.black)
                        }
                        if let latitude = restaurant.latitude {
                            Text("Latitude: \(latitude)")
                                .foregroundColor(.black)
                        } else {
                            Text("Latitude: N/A")
                                .foregroundColor(.black)
                        }
                }
            }
        }
        .onAppear(perform: fetchData)
    }

    func fetchData() {
        let headers = [
            "X-RapidAPI-Key": "a8386cc56amsh478a280d4e92cebp107863jsn07d43f128108",
            "X-RapidAPI-Host": "travel-advisor.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://travel-advisor.p.rapidapi.com/restaurants/list-in-boundary?bl_latitude=11.847676&tr_latitude=12.838442&bl_longitude=109.095887&tr_longitude=109.149359&restaurant_tagcategory_standalone=10591&restaurant_tagcategory_standalone=10591&limit=30&currency=USD&lunit=km&lang=en_US")! as URL,
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
        test2()
    }
}
