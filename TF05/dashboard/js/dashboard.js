async function updateDashboard() {
    try {
        const res = await fetch('http://localhost:5000/health/status');
        const data = await res.json();
        
        data.forEach(s => {
            if(s.service === 'web-frontend') {
                document.getElementById('frontend-response').innerText = `${s.response_time}ms`;
            }
            if(s.service === 'api-backend') {
                document.getElementById('backend-response').innerText = `${s.response_time}ms`;
            }
        });
    } catch (e) { console.error("Erro ao atualizar:", e); }
}
setInterval(updateDashboard, 5000);
updateDashboard();