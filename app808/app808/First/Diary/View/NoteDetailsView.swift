//
//  NoteDetailsView.swift
//  app808
//
//  Created by Dias Atudinov on 27.08.2024.
//

import SwiftUI

struct NoteDetailsView: View {
    @State var note: Diary
    @State private var title = ""
    @State private var description = ""
    @State private var emoji = ""
    @State var isEditing = false
    @ObservedObject var viewModel: DiaryViewModel
    @Binding var showAddNoteSheet: Bool
    
    var emojies = ["😍","🙂","🙁","😭"]
    var body: some View {
        ZStack {
            Color.viewBg.ignoresSafeArea()
            if isEditing {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(width: 36,height: 5)
                        .foregroundColor(.white.opacity(0.1))
                        .padding()
                    
                    Text("Edit entry")
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
                            print("Updated")
                            viewModel.updateNote(for: note, newEmoji: emoji, newTitle: title, newDescription: description)
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
            } else {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(width: 36,height: 5)
                        .foregroundColor(.white.opacity(0.1))
                        .padding()
                    
                    Text(note.title)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.bottom, 27)
                    HStack {
                        Text(note.description)
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                        
                    }
                    HStack {
                        Spacer()
                        Text(note.emoji)
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                        
                    }
                    
                    
                    Spacer()
                    HStack {
                        Button {
                            
                            viewModel.deleteNote(for: note)
                            showAddNoteSheet = false
                            
                        } label: {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(height: 54)
                                    .foregroundColor(.red)
                                    .font(.system(size: 17, weight: .bold))
                                    .cornerRadius(12)
                                
                                HStack {
                                    Text("Delete")
                                }.font(.system(size: 17)).foregroundColor(.white)
                                
                            }
                        }
                        
                        Button {
                            title = note.title
                            description = note.description
                            emoji = note.emoji
                            isEditing = true
                        } label: {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(height: 54)
                                    .foregroundColor(.mainBtn)
                                    .font(.system(size: 17, weight: .bold))
                                    .cornerRadius(12)
                                
                                HStack {
                                    Text("Edit")
                                }.font(.system(size: 17)).foregroundColor(.white)
                                
                            }
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    NoteDetailsView(note: Diary(emoji: "🥶", title: "Defining a goal and planning", description: "To achieve any goal, it is necessary to clearly formulate exactly what you want to achieve. The planning process includes: A description of the goal in a clear and specific for . Setting deadlines for achieving a goal (for example, in a month, six months, or a year). Dividing the overall goal into smaller steps or stages. Determining the resources needed to achieve the goal (financial, temporary, human). Create a schedule for each step. Assessment of possible obstacles and development of ways to overcome them."), viewModel: DiaryViewModel(), showAddNoteSheet: .constant(false))
}
