import SwiftUI
import Indicators

struct ContentView: View {
    @State var counter = 0
    @State var progress: Double = 0
    @State var progress2: Double = 0
    @State var show = false
    
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            
            if show {
                Group {
                    VStack {
                        if counter == 0 {
                            SuccessIndicator()
                                .onAppear {
                                    Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                                        self.counter += 1
                                    }
                            }
                            
                            Text("Success Indicator")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                        }
                        else if counter == 1 {
                            FailureIndicator()
                                .onAppear {
                                    Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                                        self.counter += 1
                                    }
                            }
                            
                            Text("Failure Indicator")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                        }
                        else if counter == 2 {
                            InfoIndicator()
                                .onAppear {
                                    Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                                        self.counter += 1
                                    }
                            }
                            
                            Text("Info Indicator")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                        }
                        else if counter == 3 {
                            CircularWaitingIndicator("Waiting...")
                                .onAppear {
                                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                                        self.counter += 1
                                    }
                            }
                            
                            Text("Circular Waiting Indicator")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                        }
                        else if counter == 4 {
                            LinearWaitingIndicator("Waiting...")
                                .onAppear {
                                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                                        self.counter += 1
                                    }
                            }
                            Text("Liniear Waiting Indicator")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                                .multilineTextAlignment(.center)
                        }
                        else if counter == 5 {
                            CircularProgressIndicator(progress, text: "Waiting...")
                                .onAppear {
                                    self.progress = 0
                                    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { t in
                                        guard self.progress < 1 else {
                                            t.invalidate()
                                            self.counter += 1
                                            return
                                        }
                                        if self.progress < 1 {
                                            self.progress += 0.1
                                        }
                                    }
                            }
                            
                            Text("Circular Progress Indicator")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                        }
                        else if counter == 6 {
                            LinearProgressIndicator(progress2, text: "Waiting...")
                                .onAppear {
                                    self.progress2 = 0
                                    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { t in
                                        guard self.progress2 < 1 else {
                                            t.invalidate()
                                            self.counter = 0
                                            return
                                        }
                                        if self.progress2 < 1 {
                                            self.progress2 += 0.1
                                        }
                                    }
                            }
                            
                            Text("Linear Progress Indicator")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                        }
                    }
                }
                .frame(width: 300, height: 250)
            }
            
            
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                self.show = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
