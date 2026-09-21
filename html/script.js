window.addEventListener('message', async (event) => {
    if (event.data.action !== 'copy') return;

    try {
        await navigator.clipboard.writeText(event.data.text);
    } catch (error) {
        const textarea = document.createElement('textarea');
        textarea.value = event.data.text;
        document.body.appendChild(textarea);
        textarea.select();
        document.execCommand('copy');
        textarea.remove();
    }
});
