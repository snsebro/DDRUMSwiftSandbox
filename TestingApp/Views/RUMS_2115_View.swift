////
////  RUMS_2115_View.swift
////  TestingApp
////
////  Created by Shayne Sebro on 12/14/23.
////
//
//import SwiftUI
//
//struct RUMS_2115_View: View {
//    @State private var isPresenting = false
//    var body: some View {
//        let frameDim = CGRect(x:-2, y:-50000, width:5 ,height:999990)
//        let viewTest = UIView(frame: frame)
//        self.ViewTest?.addSubview(viewTest)
//        Button("Present Full-Screen Cover") {
//            isPresenting.toggle()
//        }
//        .fullScreenCover(isPresented: $isPresenting, onDismiss: didDismiss) {
//            VStack{
//                Text("A full-screen modal view.")
//                    .font(.title)
//                Text("Tap to Dismiss")
//            }
//            .onTapGesture {
//                isPresenting.toggle()
//            }
//            .frame(frameDim)
//            .ignoresSafeArea(edges: .all)
//        }
//    }
//    func didDismiss() {
//        
//    }
//}
//
//struct RUMS_2115_View_Previews: PreviewProvider {
//    static var previews: some View {
//        RUMS_2115_View()
//    }
//}
