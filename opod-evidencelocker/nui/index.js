const progressBar = document.querySelector('div .progress');
const bar = document.querySelector('#pbar');
let sound = new Howl({
    src: ['police-dispatch.ogg'],
    volume: 0.20,
    onend: () => {
    }
})

let width = 0
let timer = null

window.addEventListener('message', e => {
    if (e.data.play) {
        sound.play();
    } else if (e.data.type === 'progressStart') {
        progressBar.style.opacity = 100
        
        setTimeout(() => {
            width = 0
            timer = setInterval(() => {
                    if (width < 100) {
                        width += 1
                        bar.setAttribute('style', `width: ${width}%;`)
                        bar.setAttribute('aria-valuenow', `${width}`)
                        bar.textContent = `${width}%`
                    } else {
                        width = 0
                        clearInterval(timer)
                        bar.setAttribute('style', `width: ${0}%;`)
                        bar.setAttribute('aria-valuenow', `${0}`)
                        bar.textContent = `${0}%`                
                    }
            }, e.data.timeout / 100)
        }, 500)

    } else if (e.data.type === 'progressStop'){
        progressBar.style.opacity = 0
        setTimeout(() => {
            width = 0
            bar.setAttribute('style', `width: ${0}%;`)
            bar.setAttribute('aria-valuenow', `${0}`)
            bar.textContent = `${0}%`
            if (timer !== null) {
                clearInterval(timer)
            }
        }, 1500)
    }
})