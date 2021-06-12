// TODO: 来月分のワークアウトも クリックで編集する機能を追加する

// フォームの値を更新する
function updateFormValue() {
    let updatingValue = this.parentNode.querySelector('input').value
    let updatingId = this.parentNode.querySelector('input').dataset.id // data-id 属性値から値を取得

    if (updatingValue === '') { return }

    let valueTarget = document.querySelector('#workout_name')
    let idTarget = document.querySelector('#id')

    // 値を更新
    valueTarget.value = updatingValue
    idTarget.value = updatingId

    formSubmit()
}

// フォームを submit する
function formSubmit() {
    let form = document.getElementById('form')
    form.submit()
}

// <div class="toggle"/> がクリックされたら 動作する
function showInput() {
    // document.querySelector() メソッド で input 要素を探す
    // views/workout_entries/index.html.erb 26行目 が見つかる
    let inputElement = this.querySelector('input')

    // style プロパティ（属性）を設定している
    inputElement.style = 'display: block;'
    // focus メソッド...指定された要素にフォーカスを設定できる場合、フォーカスを設定する
    // 関数の呼び出しには、()がついている
    inputElement.focus()
    // querySelector メソッドで span 要素を探して、styleプロパティで display を非表示化している
    this.querySelector('span').style = 'display: none;'
}

// Node.parentNode プロパティ...指定されたノードの DOM ツリー内の親ノードを返す
// <input/> を非表示化
function hideInput() {
    // this...文脈依存、今回は input要素 を指す
    this.parentNode.querySelector('span').style = 'display: inline;'
    this.style = 'display: none;'
    // valueプロパティ...string: そのコントロールの現在の値を返却または設定する
    // <input type="text" name="foo" value="bar">
    // input.value # => "bar"
    // updateSpanValue 関数呼び出しに対して、value プロパティの値を引数として渡す...2番目の引数
    // input 要素...1番目の引数
    updateSpanValue(this, this.value)
}

// <span/> の値を更新
// TODO: updateSpanValue 関数を読み解く
function updateSpanValue(context, value) {
    if (value === '') { return }

    // 現在の場所から親要素を参照し、そこから <span/> の値を更新する
    context.parentNode.querySelector('span').textContent = value
}

// elements は配列を期待
// func は関数を期待
// function myForEach(elements, func) {
//     for(let i = 0; i < elements.length; i++) {
//         // 配列からインデックスを指定して 値を取り出す
//         let element = elements[i]

//         func(element)
//     }
// }

// def foo
// end

// foo
// let someArray = [0, 1, 2]
// myForEach(someArray, (_) => {})
// myForEach(someArray, (foo) => { console.log(foo) })

function initPageLoad() {
// views/workout_entries/index.html.erb 25行目のdiv要素を探し出す
let toggleElements = document.getElementsByClassName('toggle')
// let toggleElements = document.querySelectorAll('.toggle') は 上と等価

// toggleElements は、HTMLCollection 型、配列に似た形式をもつ
// HTMLCollection 型 に forEach メソッドは定義されていない
// Array.from メソッドで配列に変換する

// (element) => { console.log(element) }
// function printer(element) { console.log(element) }
Array.from(toggleElements).forEach((element) => {
    // クリックされたら showInput 関数を呼び出し
    element.addEventListener('click', showInput)

    Array.from(element.querySelectorAll('input'), (elm) => {
        // フォーカスが外れたら hideInput 関数を呼び出し
        elm.addEventListener('blur', hideInput)
    })

})
// input.toggleInput...class名が toggleInput の input 要素を探す
// rails 側に 取得した値を送信するための設定
Array.from(document.querySelectorAll('input.toggleInput')).forEach((element) => {
    // フォーカスが外れたら updateFormValue 関数を呼び出し
    element.addEventListener('blur', updateFormValue)
    element.style = "display: none;"
})
}
// 「ページが読み込まれたら」のイベント処理を設定する
// Document: DOMContentLoaded イベント
// DOMContentLoaded イベントが発生したら、initPageLoad 関数が呼び出される
document.addEventListener('DOMContentLoaded', initPageLoad)
