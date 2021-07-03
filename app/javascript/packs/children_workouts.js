// 50音の文字がクリックされたら、名前検索欄にクリックされた文字を挿入する関数を呼び出し
function clickOnInsertCharacter(event) {
    // event.preventDefault() // 要素のデフォルト動作を回避。今回は <a/> なので、リンクへの遷移を中断する
    // ボタンに対してイベントを仕掛ける
    // targetプロパティ = イベントによって呼び出された要素がわかる
    // ここでは、28行目の element を指す (a.fity-character のうちのひとつ)

    console.log('Hello')
    console.log(event.target)

    let input = document.querySelector('input#name')
    // textContent プロパティ 
    // [Node.textContent - Web API | MDN](https://developer.mozilla.org/ja/docs/Web/API/Node/textContent)
    let updateValue = event.target.textContent

    // TODO: 挿入対象の <input/> にクリックされた要素の文字を挿入する
    // TODO: 一文字ずつ、<input/> に覚えてもらいつつ、文字を挿入する
    input.value = updateValue
}


// 挿入された文字に変化があったら、挿入された文字をRails側に送る関数

// 検索結果を受け取り、view 側で検索候補を更新する関数

// ページが読み込まれたら、JavaScriptの各機能を初期化する

function initPageLoad() {
    // inputタグのidの値がnameであるものを探す
    // let name = document.querySelector('input#name')

    // TODO: 50音を探してきて、クリックイベントを仕掛けたい
    // document.querySelector('a') // TODO: HTML Collection なので、配列に変換する
    // 配列の一要素を Array.from メソッドで呼び出す
    Array.from(document.querySelectorAll('button.fifty-character')).forEach((element) => {
        // クリックされたら clickOnInsertCharacter 関数を呼び出し
        element.addEventListener('click', clickOnInsertCharacter)
    })
}

document.addEventListener('DOMContentLoaded', initPageLoad)
// document.addEventListener('tubolinks:load', initPageLoad)


// let fiftyWords = document.querySelector('a')


// Array.from(fiftyWords).forEach((element) => {
//     // クリックされたら showInput 関数を呼び出し
//     element.addEventListener('click', clickOnInsertCharacter)
// })