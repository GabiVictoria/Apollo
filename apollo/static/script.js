const track = document.querySelector('.carousel-track');
const indicators = document.querySelectorAll('.indicator');

let currentIndex = 0;
const totalImages = document.querySelectorAll('.carousel-image').length;

function updateCarousel() {
    const width = track.clientWidth;
    track.style.transform = `translateX(-${currentIndex * width}px)`;
    updateIndicators();
}

function updateIndicators() {
    indicators.forEach((indicator, index) => {
        indicator.classList.toggle('active', index === currentIndex);
    });
}

function moveToNext() {
    currentIndex = (currentIndex + 1) % totalImages;
    updateCarousel();
}

// Inicializa o carrossel automático
setInterval(moveToNext, 5000);

// Permite o clique nos indicadores
indicators.forEach((indicator, index) => {
    indicator.addEventListener('click', () => {
        currentIndex = index;
        updateCarousel();
    });
});

// Ajuste dinâmico ao redimensionar a tela
window.addEventListener('resize', updateCarousel);
