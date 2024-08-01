//
//  ActivityIndicator.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 31/07/24.
//

import Foundation
import SwiftUI

//struct ActivityIndicator:UIViewControllerRepresentable,UIViewRepresentable,View {
//
//    let style = UIActivityIndicatorView.Style.medium
//    @Binding var animate:Bool
//
//    private let spinner:UIActivityIndicatorView = {
//        $0.hidesWhenStopped = true
//        return $0
//    }(UIActivityIndicatorView(style: .medium))
//
//    func makeUIView(context:UIViewControllerRepresentableContext<ActivityIndicator>)->UIActivityIndicatorView{
//        spinner.style = style
//        return spinner
//    }
//    func updateUIView(uiView:UIActivityIndicatorView,context:UIViewControllerRepresentableContext<ActivityIndicator>){
//        animate ? uiView.startAnimating() : uiView.stopAnimating()
//    }
//
//    func updateUIView(indicator:(UIActivityIndicatorView) -> Void)->some View{
//        indicator(spinner)
//        return self
//    }
//
//}


struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        return activityIndicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
