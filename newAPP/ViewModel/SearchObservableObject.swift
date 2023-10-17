import Foundation

class SearchObservableObject: ObservableObject{
    @Published var searchText = ""
    var data: [CountryDataObject] = []
    @Published var searchResult: [CountryDataObject] = []
    		
    init(){
        data = MockSevice.shared.getData()
    }
}
