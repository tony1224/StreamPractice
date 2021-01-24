### 概要
- 1回のみのElement or Error返すことを保証してるObservable
- 1回イベント送信後にdisposeされる
- SuccessとErrorのみ定義
    - Resultみたいな感じ
- 実装者はcompelteを呼び出せないのが特徴
    - createの内部でonNext(element)したらすぐにonCompletedしてる

### Single -> asObservable -> asSingleすると最後でストリームが切れるっぽい
- 対応方不明だったのでasObservableな形で対応することに

### Observableにあるようなストリームをマージしたりする機能は持っていない
- combineLatestとか無かった