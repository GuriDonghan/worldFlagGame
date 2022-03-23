//
//  ContentView.swift
//  worldFlagGame
//
//  Created by USER on 2022/03/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var questionCount = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var countGame = 0
    
    
    @State var countries = ["가나",
                            "가봉",
                            "가이아나",
                            "감비아",
                            "건지섬",
                            "과들루프",
                            "과테말라",
                            "괌",
                            "그레나다",
                            "그리스",
                            "그린란드",
                            "기니",
                            "기니비사우",
                            "나미비아",
                            "나우르",
                            "나이지리아",
                            "남극",
                            "남수단",
                            "남아프리카공화국",
                            "네델란드",
                            "네팔",
                            "노르웨이",
                            "노퍽섬",
                            "뉴질랜드",
                            "뉴칼리도니아",
                            "니우에",
                            "니제르",
                            "니카라과",
                            "대만",
                            "대한민국",
                            "덴마크",
                            "도미니카",
                            "도미니카연방",
                            "독일",
                            "동티모르",
                            "라오스",
                            "라이베리아",
                            "라트비아",
                            "러시아",
                            "레바논",
                            "레소토",
                            "루마니아",
                            "룩셈부르크",
                            "르완다",
                            "리비아",
                            "리유니언",
                            "리투아니아",
                            "리히텐슈타인",
                            "마다가스카르",
                            "마르티니크",
                            "마셜제도",
                            "마요트",
                            "마카오",
                            "마케도니아",
                            "말라위",
                            "말레이시아",
                            "말리",
                            "맨섬",
                            "멕시코",
                            "모나코",
                            "모로코",
                            "모리셔스",
                            "모리타니",
                            "모잠비크",
                            "몬테네그로",
                            "몬트세라트",
                            "몰도바",
                            "몰디브",
                            "몰타",
                            "몽골",
                            "미국",
                            "미국령버진아일랜드",
                            "미국령사모아",
                            "미얀마",
                            "미크로네시아",
                            "바누아투",
                            "바레인",
                            "바베이도스",
                            "바티칸",
                            "바하마",
                            "방글라데시",
                            "버뮤다",
                            "베냉",
                            "베네수엘라",
                            "베트남",
                            "벨기에",
                            "벨라루스",
                            "벨리즈",
                            "보스니아헤르체고비나",
                            "보츠와나",
                            "볼리비아",
                            "부르키나파소",
                            "부탄",
                            "북마리아나제도",
                            "북아일랜드",
                            "북한",
                            "불가리아",
                            "브라질",
                            "브루나이",
                            "브룬디",
                            "사모아",
                            "사우디아라비아",
                            "사이프러스",
                            "산마리노",
                            "상투메프린시페",
                            "생피에르미클롱",
                            "서사하라",
                            "세네갈",
                            "세르비아",
                            "세이셸",
                            "세인트루시아",
                            "세인트빈센트그레나딘",
                            "세인트키츠네비스",
                            "세인트헬레나",
                            "소말리아",
                            "솔로몬제도",
                            "수단",
                            "수리남",
                            "스리랑카",
                            "스웨덴",
                            "스위스",
                            "스코틀랜드",
                            "스페인",
                            "슬로바키아",
                            "슬로베니아",
                            "시리아",
                            "신트마르턴",
                            "싱가포르",
                            "아랍에미리트",
                            "아루바",
                            "아르메니아",
                            "아르헨티나",
                            "아이슬랜드",
                            "아이티",
                            "아일랜드",
                            "아제르바이잔",
                            "아프가니스탄",
                            "안도라",
                            "알바니아",
                            "알제리",
                            "앙골라",
                            "앤티가바부다",
                            "앵귈라",
                            "에리트레아",
                            "에스와티니",
                            "에스토니아",
                            "에콰도르",
                            "에티오피아",
                            "엘살바도르",
                            "영국",
                            "영국령버진아일랜드",
                            "영인도제도",
                            "예맨",
                            "오만",
                            "오스트리아",
                            "온두라스",
                            "올란드제도",
                            "요르단",
                            "우간다",
                            "우루과이",
                            "우즈베키스탄",
                            "우크라이나",
                            "웨일즈",
                            "이라크",
                            "이란",
                            "이스라엘",
                            "이집트",
                            "이탈리아",
                            "인도",
                            "인도네시아",
                            "일본",
                            "잉글랜드",
                            "자메이카",
                            "잠비아",
                            "저지",
                            "적도기니",
                            "조지아",
                            "중국",
                            "중앙아프리카공화국",
                            "지부티",
                            "지브롤터",
                            "짐바브웨",
                            "차드",
                            "체코",
                            "칠레",
                            "카메룬",
                            "카보베르데",
                            "카자흐스탄",
                            "카타르",
                            "캄보디아",
                            "캐나다",
                            "케냐",
                            "케이맨섬",
                            "코모르",
                            "코스타리카",
                            "코코스제도",
                            "코트디부아르",
                            "콜롬비아",
                            "콩고",
                            "콩고민주공화국",
                            "쿠바",
                            "쿠웨이트",
                            "쿡제도",
                            "퀴라소",
                            "크로아티아",
                            "크리스마스섬",
                            "키르기스스탄",
                            "키리바시",
                            "타지키스탄",
                            "탄자니아",
                            "태국",
                            "터크스케이커스",
                            "터키",
                            "토고",
                            "토켈라우",
                            "통가",
                            "투르크메니스탄",
                            "투발루",
                            "튀니지",
                            "트리니다드토바고",
                            "파나마",
                            "파라과이",
                            "파키스탄",
                            "파푸아뉴기니",
                            "팔라우",
                            "팔레스타인",
                            "페로제도",
                            "페루",
                            "포르투갈",
                            "포클랜드섬",
                            "폴란드",
                            "푸에르토리코",
                            "프랑스",
                            "프랑스령기아나",
                            "프랑스령폴리네시아",
                            "피지",
                            "핀단드",
                            "필리핀",
                            "핏케언제도",
                            "헝가리",
                            "호주",
                            "홍콩",].shuffled()
    
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    //Animation
    
    @State private var animationAmount = 0.0
    @State private var opacityAmount = 1.0
    var body: some View {
        
        ZStack {
            
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("셰계 국기를 맞춰보자!")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                
                VStack(spacing: 15) {
                    VStack {
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                        Text("국기를 맞춰 보세요!")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            // flag was tapped
                            flagTapped(number)
                            withAnimation {
                                animationAmount += 360
                                opacityAmount = 0.5
                            }
                        } label: {
                            FlagImage(text: countries[number])
                                .rotation3DEffect(.degrees((number == correctAnswer) ? animationAmount: 0.0), axis: (x:0, y:1, z:0))
                                .opacity((number == correctAnswer) ? opacityAmount : 1.0)
                            // Custom View 만들기 테스트
//                            Image(countries[number])
//                                .renderingMode(.original)
//                                .clipShape(Capsule())
//                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                
                Text("점수: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("확인", action: askQuestion)
        } message: {
            Text("현재 점수는 \(userScore)")
        }
        
        .alert("게임종료!", isPresented: $questionCount) {
            Button("다시 하기", action: reset )
        } message: {
            Text("선우의 최종 점수는 \(userScore)점")
        }

    }
    
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "정답입니다!"
            userScore += 5
            SoundSetting.instance.playSound(sound: .correctAnswer2)
        } else {
            scoreTitle = "앗! 이건 \(countries[number]) 국기입니다."
            userScore -= 2
            SoundSetting.instance.playSound(sound: .wrongAnswer2)
        }
        
        showingScore = true
        
        // 게임 횟수를 제한 하는 Code
        countGame += 1
        //        print(countGame)
        if countGame >= 243 {
            questionCount = true
        } else {
            questionCount = false
        }
        //        print(questionCount)
        
    }
    
    func askQuestion() {
        opacityAmount = 1.0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
//        countries.shuffle()
        countGame = 0
        userScore = 0
        showingScore = false

    }
    
}



// custom View 만들기
struct FlagImage: View {
   
    var text: String
    
    var body: some View {
        Image(text)
            .renderingMode(.original)
//            .clipShape(Capsule())
            .shadow(radius: 5)
    }
    
}


// 버튼 클릭시 Sound 재생 할 수 있는 코드
class SoundSetting: ObservableObject {
    //1. soundSetting의 단일 인스턴스를 만듬
    /// singleton ? :
    /// 싱글 톤은 한 번만 생성 된 다음 사용해야하는 모든 곳에서 공유해야하는 객체입니다.
    
    static let instance = SoundSetting()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case correctAnswer2
        case wrongAnswer2
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


