import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

struct Player {
    let score: BehaviorSubject<Int>

    init(score: Int) {
        self.score = BehaviorSubject(value: score)
    }
}

let 👦🏻 = Player(score: 80)
let 👧🏼 = Player(score: 90)

let player = BehaviorSubject(value: 👦🏻)

player
    .asObservable()
    .flatMapLatest { $0.score.asObservable() } // flatMap -> flatMapLatestに
    .subscribe(onNext: { print($0) })
    .disposed(by: disposeBag)

👦🏻.score.onNext(85)

player.onNext(👧🏼)

// flatMapを使用すると印刷されますが、flatMapLatestを使用すると印刷されません
// 上の行を変更するとわかる
// 👧にonNextが変わったから。flatMapだと過去のイベントを流すというはそういうこと
👦🏻.score.onNext(95)

👧🏼.score.onNext(100)
