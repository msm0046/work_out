// TODO: 入力して、フォーカスが外れたら、フォームに値を書き込む

// function updateFormValue(idValue, workoutNameValue) {
function updateFormValue() {
    let updatingValue = this.parentNode.querySelector('input').value
    let updatingId = this.parentNode.querySelector('input').dataset.id

    let valueTarget = document.querySelector('#workout_name')
    let idTarget = document.querySelector('#id')

    valueTarget.value = updatingValue
    idTarget.value = updatingId

    formSubmit()
}

function formSubmit() {
    let form = document.getElementById('form')
    form.submit()
}

// <div class="toggle"/> がクリックされたら 動作する
function showInput() {
    let inputElement = this.querySelector('input')

    inputElement.style = 'display: block;'
    inputElement.focus()
    this.querySelector('span').style = 'display: none;'
    
}


function hideInput() {
    this.parentNode.querySelector('span').style = 'display: inline;'
    this.style = 'display: none;'

    updateSpanValue(this, this.value)
}

function updateSpanValue(context, value) {
    context.parentNode.querySelector('span').textContent = value
}

document.addEventListener('DOMContentLoaded', () => {
    let toggleElements = document.getElementsByClassName('toggle')

    Array.from(toggleElements).forEach((element) => {
        element.addEventListener('click', showInput)
        Array.from(element.querySelectorAll('input'), (elm) => {
            elm.addEventListener('blur', hideInput)
        })
        
    })

    Array.from(document.querySelectorAll('input.toggleInput')).forEach((element) => {
        element.addEventListener('blur', updateFormValue)
        element.style="display: none;"
    })
})