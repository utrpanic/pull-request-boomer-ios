import SwiftUI

protocol MainViewDelegate: AnyObject {
    
}

struct MainView: View {
    
    weak var delegate: MainViewDelegate?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
