// Quiz Data
const quizData = [
    {
        question: "1. Một người xưng là 'Công an điều tra' gọi điện, yêu cầu bạn chuyển tiền vào tài khoản tạm giữ để chứng minh trong sạch. Bạn làm gì?",
        options: [
            "Chuyển tiền ngay để chứng minh mình vô tội.",
            "Cúp máy lập tức, không làm theo bất kỳ yêu cầu nào.",
            "Cung cấp mã OTP theo yêu cầu để họ tự kiểm tra."
        ],
        correctAnswer: 1,
        explanation: "Chính xác! Công an KHÔNG BAO GIỜ làm việc qua điện thoại hay yêu cầu chuyển tiền vào tài khoản cá nhân/tạm giữ."
    },
    {
        question: "2. Bạn nhận được cuộc gọi Video từ người thân mượn tiền gấp. Hình ảnh hơi mờ và âm thanh không khớp miệng. Bạn xử lý sao?",
        options: [
            "Gọi lại bằng số điện thoại di động bình thường để xác nhận.",
            "Chuyển tiền liền vì hình đúng là người thân của mình rồi.",
            "Nhắn tin lại qua Messenger/Zalo hỏi số tài khoản rồi chuyển."
        ],
        correctAnswer: 0,
        explanation: "Đúng! Công nghệ Deepfake có thể giả mạo 99% khuôn mặt và giọng nói. Gọi điện thoại mạng viễn thông thông thường là cách xác nhận an toàn nhất."
    },
    {
        question: "3. Nhận được tin nhắn 'Cập nhật VNeID' kèm theo một đường link lạ (không phải .gov.vn). Bạn sẽ làm gì?",
        options: [
            "Bấm vào link và tải app về cập nhật cho nhanh.",
            "Bỏ qua tin nhắn, tự mở app VNeID trên máy để kiểm tra.",
            "Điền thông tin CMND vào link web đó để xác thực."
        ],
        correctAnswer: 1,
        explanation: "Tuyệt vời! Cơ quan nhà nước không bao giờ gửi link lạ qua SMS/Zalo. Mọi cập nhật đều làm trực tiếp trên CH Play/App Store hoặc tại trụ sở."
    }
];

// DOM Elements
const questionNumber = document.getElementById('question-number');
const questionText = document.getElementById('question-text');
const optionsContainer = document.getElementById('options-container');
const quizContainer = document.getElementById('quiz-container');
const resultContainer = document.getElementById('result-container');
const resultTitle = document.getElementById('result-title');
const resultText = document.getElementById('result-text');
const btnRestart = document.getElementById('btn-restart');

// Quiz State
let currentQuestion = 0;
let score = 0;

// Initialize Quiz
function loadQuestion() {
    const q = quizData[currentQuestion];
    questionNumber.innerText = `Câu ${currentQuestion + 1}/${quizData.length}`;
    questionText.innerText = q.question;
    optionsContainer.innerHTML = '';

    q.options.forEach((option, index) => {
        const button = document.createElement('button');
        button.innerText = option;
        button.classList.add('option-btn');
        button.addEventListener('click', () => selectAnswer(index, button));
        optionsContainer.appendChild(button);
    });
}

// Handle Answer Selection
function selectAnswer(selectedIndex, button) {
    // Disable all buttons
    const allButtons = optionsContainer.querySelectorAll('.option-btn');
    allButtons.forEach(btn => btn.disabled = true);

    const q = quizData[currentQuestion];
    
    // Check answer
    if (selectedIndex === q.correctAnswer) {
        button.classList.add('correct');
        score++;
    } else {
        button.classList.add('wrong');
        allButtons[q.correctAnswer].classList.add('correct');
    }

    // Show explanation (Optional extra touch)
    const explanationNode = document.createElement('p');
    explanationNode.innerHTML = `<em>${q.explanation}</em>`;
    explanationNode.style.color = 'var(--text-muted)';
    explanationNode.style.marginTop = '1rem';
    optionsContainer.appendChild(explanationNode);

    // Next question timer
    setTimeout(() => {
        currentQuestion++;
        if (currentQuestion < quizData.length) {
            loadQuestion();
        } else {
            showResult();
        }
    }, 3500); // Wait 3.5s to read explanation
}

// Show Final Result
function showResult() {
    quizContainer.classList.add('hidden');
    resultContainer.classList.remove('hidden');

    if (score === quizData.length) {
        resultTitle.innerText = "🏆 Xin chúc mừng!";
        resultTitle.style.color = "#4ade80";
        resultText.innerText = "Kiến thức phòng vệ của bạn cực kỳ vững vàng. Lừa đảo không thể chạm vào bạn! Hãy gửi trang web này để giúp người thân nhé.";
    } else if (score >= 1) {
        resultTitle.innerText = "⚠️ Cần cảnh giác hơn!";
        resultTitle.style.color = "#fcd34d";
        resultText.innerText = `Bạn trả lời đúng ${score}/${quizData.length}. Vẫn còn sơ hở để kẻ gian lợi dụng. Hãy ghi nhớ quy tắc "3 KHÔNG - 3 LUÔN" ở trên nhé.`;
    } else {
        resultTitle.innerText = "🚨 Báo Động Đỏ!";
        resultTitle.style.color = "#ef4444";
        resultText.innerText = "Nguy hiểm! Bạn đang là mục tiêu rất dễ bị tấn công. Hãy nhờ người thân đọc kỹ nội dung trang web này và hướng dẫn bạn cách bảo vệ tài khoản.";
    }
}

// Restart Quiz
btnRestart.addEventListener('click', () => {
    currentQuestion = 0;
    score = 0;
    resultContainer.classList.add('hidden');
    quizContainer.classList.remove('hidden');
    loadQuestion();
});

// Smooth Scroll for Navigation
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});

// Init
loadQuestion();
