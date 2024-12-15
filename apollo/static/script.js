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


const senhaInput = document.getElementById("senha");
const toggleSenha = document.getElementById("toggle-senha");
const iconeSenha = document.getElementById("icone-senha");
const textoSenha = document.querySelector("#toggle-senha p");

toggleSenha.addEventListener("click", () => {
    if (senhaInput.type === "password") {
        senhaInput.type = "text"; // Exibir senha
        iconeSenha.src = "static/assets/view.png"; // Ícone de olho aberto
        iconeSenha.alt = "Ocultar senha";
        textoSenha.textContent = "Ocultar senha"; // Atualizar texto
    } else {
        senhaInput.type = "password"; // Ocultar senha
        iconeSenha.src = "static/assets/hide.png"; // Ícone de olho fechado
        iconeSenha.alt = "Visualizar senha";
        textoSenha.textContent = "Visualizar senha"; // Atualizar texto
    }
});


// Acessa a div de erro e a div do alerta
const erroDiv = document.getElementById("erro");
const alertaDiv = document.getElementById("alerta");
const alertaMsg = document.getElementById("alerta-msg");

// Verifica se a div de erro tem conteúdo
if (erroDiv && erroDiv.textContent.trim() !== "") {
    // Exibe o alerta com a mensagem de erro
    alertaMsg.textContent = erroDiv.textContent.trim();
    alertaDiv.style.display = "block"; // Torna o alerta visível

    // Após 5 segundos, oculta o alerta com efeito de transição
    setTimeout(() => {
        alertaDiv.style.opacity = "0"; // Aplica a transição de desvanecimento
    }, 5000); // Espera 5 segundos antes de iniciar o efeito

    // Depois que o efeito de transição for concluído, esconde o alerta completamente
    setTimeout(() => {
        alertaDiv.style.display = "none"; // Esconde completamente o alerta
        alertaDiv.style.opacity = "1"; // Reseta a opacidade para o estado inicial
    }, 5500); // 5000ms + 500ms de transição
}

// Função para fechar o alerta
function fecharAlerta() {
    alertaDiv.style.display = "none"; // Oculta o alerta
}


var textoFormatado = nicEditors.findEditor('area1').getContent();
console.log(textoFormatado); // Verifique o conteúdo formatado
document.getElementById('form_historia').addEventListener('submit', function(event) {
    var textoFormatado = nicEditors.findEditor('area1').getContent();
    document.getElementById('area1').value = textoFormatado;  // Atualiza o valor da textarea
});
