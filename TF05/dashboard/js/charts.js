const ctx = document.getElementById('responseTimeChart').getContext('2d');
new Chart(ctx, {
    type: 'line',
    data: { labels: ['10h', '11h', '12h', '13h', '14h'], 
    datasets: [{ label: 'ms', data: [120, 150, 100, 180, 130], borderColor: '#4ee44e' }] }
});