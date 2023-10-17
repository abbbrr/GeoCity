import SwiftUI
import SpriteKit

struct HelloView: View {
    @State private var isTextVisible = false
    var checkInternet:Bool
    
    var counries = [
        Country(id: 1, name: "JAPAN", image: "japan", isWeather: true),
        Country(id: 2, name: "MEXICO", image: "mexico", isWeather: false),
        Country(id: 3, name: "TURKEY", image: "turkey", isWeather: false),
        Country(id: 4, name: "GERMANY", image: "germany", isWeather: true),
        Country(id: 5, name: "GEORGIA", image: "georgia", isWeather: false),
        Country(id: 6, name: "FRANCE", image: "francia", isWeather: false),
        Country(id: 7, name: "CHINA", image: "china", isWeather: false),
    ]
    
    var body: some View {
        if let randomCountry = counries.randomElement(){
            ZStack(alignment: .leading){
                GeometryReader { geometry in
                    Image("\(randomCountry.image)")
                        .resizable()
                        .scaledToFill()
                        .frame(width:  geometry.size.width, height: .infinity)
                        .clipped()
                        .edgesIgnoringSafeArea(.all)
                    
                    if randomCountry.name == "JAPAN"{
                        SpriteView(scene: Sakura(), options: [.allowsTransparency])
                    } else if randomCountry.name == "GERMANY"{
                        SpriteView(scene: Snow(), options: [.allowsTransparency])
                    }
                }
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Image(systemName: "mappin.and.ellipse")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            
                        Text("\(randomCountry.name)")
                            .foregroundColor(.white)
                            .font(
                                .system(size: 50)
                                .weight(.heavy)
                            )
                            
                        Text("Checkpoint")
                            .foregroundColor(.white)
                            .font(
                                .system(size: 25)
                                .weight(.light)
                            )
                        Spacer()
                    }
                    .opacity(isTextVisible ? 1 : 0)
                    .animation(.easeIn(duration: 1))
                    .onAppear(){
                        withAnimation {
                            isTextVisible = true
                        }
                    }
                    .padding(.top)
                    .padding(20)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    if checkInternet{
                        VStack{
                            NavigationLink(destination: test()) {
                                HStack{
                                    VStack(alignment:.leading){
                                        Text("Discover Trending")
                                            .foregroundColor(.white.opacity(0.5))
                                            .fontWeight(.semibold)
                                        Text("Checkpoint in Japan")
                                            .foregroundColor(.white.opacity(0.5))
                                            .fontWeight(.semibold)
                                    }.padding(.leading,40)
                                    
                                    ZStack {
                                        Circle()
                                            .frame(width: 120, height: 55)
                                            .foregroundColor(.white)
                                            .shadow(color: .red.opacity(0.9), radius: 25, x: 0, y: 0)
                                        Image(systemName: "arrow.right.circle.fill")
                                            .resizable()
                                            .frame(width: 55, height: 55)
                                            .foregroundColor(.red.opacity(0.8))
                                    }
                                    .offset(x: 10)
                                }
                                .padding(.vertical, 10)
                                .frame(width: 330)
                                .background(Color("best_color").opacity(0.8))
                                .cornerRadius(50)
                            }
                        }
                        .padding()
                        .padding(.horizontal)
                        .opacity(isTextVisible ? 1 : 0)
                        .animation(.easeIn(duration: 1))
                        .onAppear(){
                            withAnimation {
                                isTextVisible = true
                            }
                        }
                    } else{
                        VStack(alignment:.center){
                            Text("Ooops!")
                                .font(.system(size: 50, weight: .bold, design: .default))
                                .foregroundColor(.white.opacity(0.7))
                                .padding(.bottom, 1)
                            
                            Text("Slow or no internet conncetion.")
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(.white.opacity(0.7))
                            Text("Check your internet settings.")
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .padding(.leading, 30)
                        .padding()
                        .padding(.bottom,1)
                    }
                }
            }
        }else{
            Text("No countries available")
        }
    }
}

//MARK: -snow,rain,sakura
class Sakura:SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5, y: 1.1)
        
        backgroundColor = .clear
        
        let node = SKEmitterNode(fileNamed: "SakuraFall.sks")!
        addChild(node)
        
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}

class Rain:SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5, y: 1.1)
        
        backgroundColor = .clear
        
        let node = SKEmitterNode(fileNamed: "RainFall.sks")!
        addChild(node)
        
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}

class Snow:SKScene{
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5, y: 1.1)
        
        backgroundColor = .clear
        
        let node = SKEmitterNode(fileNamed: "SnowFall.sks")!
        addChild(node)
        
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}



struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView(checkInternet: true)
    }
}
