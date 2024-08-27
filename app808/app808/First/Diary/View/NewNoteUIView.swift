//
//  NewNoteUIView.swift
//  app808
//
//  Created by Dias Atudinov on 27.08.2024.
//

import SwiftUI

struct NewNoteUIView: View {
    @State private var title = ""
    @State private var description = ""
    @State private var emoji = ""
    @ObservedObject var viewModel: DiaryViewModel
    @Binding var showAddNoteSheet: Bool
    
    var emojies = ["😍","🙂","🙁","😭"]
    var body: some View {
        ZStack {
            Color.viewBg.ignoresSafeArea()
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: 36,height: 5)
                    .foregroundColor(.white.opacity(0.1))
                    .padding()
                
                Text("New entry")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                HStack {
                    Text("Title:")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom)
                ZStack {
                    Color.white.opacity(0.05)
                    HStack {
                        
                        if title.isEmpty {
                            Text("Text")
                                .foregroundColor(.white.opacity(0.3))
                        }
                        Spacer()
                    }.padding()
                    HStack() {
                        TextField("", text: $title)
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                         
                    }.padding()
                }.frame(height: 56)
                    .cornerRadius(16)
                    .padding(.bottom,10)
                
                HStack {
                    Text("Description:")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom)
                
                ZStack {
                    Color.white.opacity(0.05)
                    VStack {
                        HStack {
                            
                            if description.isEmpty {
                                Text("Text")
                                    .foregroundColor(.white.opacity(0.3))
                            }
                            Spacer()
                        }.padding()
                            .padding(.top, 6)
                        Spacer()
                    }
                    HStack() {
                        TextEditor(text: $description)
                            .font(.system(size: 17))
                            .scrollContentBackgroundHidden()
                            .foregroundColor(.white)
                        
                            
                         
                    }.padding()
                }.frame(height: 142)
                    .cornerRadius(16)
                    .padding(.bottom,10)
                    .onAppear {
                        UITextView.appearance().backgroundColor = .clear
                    }
                
                HStack {
                    Text("Emotion:")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom)
                
                HStack {
                    ForEach(0...emojies.count - 1, id: \.self) { index in
                        ZStack {
                            Rectangle()
                                .frame(width: 40, height: 40)
                                .cornerRadius(8)
                                .foregroundColor(emoji == emojies[index] ? Color.mainBtn : .white.opacity(0.05))
                            Text(emojies[index])
                                .font(.system(size: 32))
                                .onTapGesture {
                                    emoji = emojies[index]
                                    print(emoji)
                                }
                        }
                    }
                    Spacer()
                }
                
                Spacer()
                
                Button {
                    if !title.isEmpty && emoji != "" {
                        print("Saved")
                        let diaryNote = Diary(emoji: emoji, title: title, description: description)
                        viewModel.addNote(for: diaryNote)
                        showAddNoteSheet = false
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(height: 54)
                            .foregroundColor(.mainBtn)
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(12)
                        
                        HStack {
                            Image(systemName: "checkmark")
                            Text("Save")
                        }.font(.system(size: 17)).foregroundColor(.white)
                        
                    }.opacity((!title.isEmpty && emoji != "") ? 1 : 0.5)
                }
            }.padding(.horizontal)
        }
    }
}

#Preview {
    NewNoteUIView(viewModel: DiaryViewModel(), showAddNoteSheet: .constant(false))
}

extension View {
    /// Hides the standard system background of the view.
    ///
    func scrollContentBackgroundHidden() -> some View {
        if #available(iOS 16.0, *) {
            return self.scrollContentBackground(.hidden)
        } else {
            return self
        }
    }

    /// Layers the given views behind this ``TextEditor``.
    ///
    func textEditorBackground<V>(@ViewBuilder _ content: () -> V) -> some View where V : View {
        self
            .onAppear {
                UITextView.appearance().backgroundColor = .clear
            }
            .background(content())
    }
}
