function generatePassword() {
    const length = parseInt(document.getElementById('length').value);
    if (isNaN(length) || length < 1) {
        document.getElementById('result').textContent = 'Please enter a valid number!';
        return;
    }
    if (length < 8) {
        document.getElementById('result').textContent = 'Password should be min. 8 characters long for security purposes.';
        return;
    }

    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()';
    let password = '';
    let previousChar = '';

    for (let i = 0; i < length; i++) {
        let char;
        do {
            char = chars[Math.floor(Math.random() * chars.length)];
        } while (char === previousChar);
        password += char;
        previousChar = char;
    }

    document.getElementById('result').textContent = password;
}
