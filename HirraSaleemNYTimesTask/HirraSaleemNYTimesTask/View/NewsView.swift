//
//  NewsView.swift
//  HirraSaleemNYTimesTask
//
//  Created by Hirra on 22/01/2022.
//

import SwiftUI

struct NewsView: View {
    
    var item: Results
    var body: some View {
        
        HStack {
                Circle()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.gray)
                .padding(.horizontal , 5)
            
         LazyVStack(alignment: .leading, spacing: 10) {
             Text(item.byline ?? "")
                .foregroundColor(.black)
                .font(.system(size: 16))
                .fontWeight(.regular)
                .lineLimit(2)

             HStack {
                 Text(item.abstract ?? "")
                     .foregroundColor(.gray)
                     .font(.system(size: 12))
                     .fontWeight(.regular)
                 
                 Spacer()
                 
                 Label(item.published_date ?? "" , systemImage: "calendar")
                     .lineLimit(1)
                     .font(.system(size: 10))
             }
            Divider()
                .padding(.top , 5)
        }.padding(.horizontal , 10)
            Image(systemName:  "chevron.forward")
                .foregroundColor(Color(UIColor.systemGray))
                .padding()
        }
    }
}
