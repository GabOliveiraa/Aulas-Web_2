"use strict";
// cores
var colors = [
    '#03fcdb', // Condicionamento - ciano neon
    '#5e03fc', // Poomsae - roxo forte
    '#222222', // Treino de luta - preto
    '#fc03c2', // Técnica - rosa choque
    '#d7fc03', // Flexibilidade - amarelo neon
];



window.onload = loadData;

function loadData() {
    getTrainingStatisticsByType();
    getTrainingStatisticsByDay();
}

function getTrainingStatisticsByType() {
    const url = "trainingStatistics?category=byType";

    fetch(url)
        .then(response => response.json())
        .then(datalist => {
            setChartDonut(datalist);
        })
        .catch(error => console.log('Erro ao buscar estatísticas por tipo', error));
}

function getTrainingStatisticsByDay() {
    const url = "trainingStatistics?category=byDay";

    fetch(url)
        .then(response => response.json())
        .then(datalist => {
            setChartBar(datalist);
        })
        .catch(error => console.log('Erro ao buscar estatísticas por dia', error));
}

function setChartDonut(datalist) {
    var donutOptions = {
        cutoutPercentage: 85,
        legend: {
            position: 'bottom',
            padding: 5,
            labels: { pointStyle: 'circle', usePointStyle: true }
        }
    };

    var chDonutData1 = {
        labels: datalist.map(data => data.type),
        datasets: [
            {
                backgroundColor: colors.slice(0, 5),
                borderWidth: 0,
                data: datalist.map(data => data.count)
            }
        ]
    };

    var chDonut1 = document.getElementById("chDonut1");
    if (chDonut1) {
        new Chart(chDonut1, {
            type: 'pie',
            data: chDonutData1,
            options: donutOptions
        });
    }
}

function setChartBar(datalist) {
    var chBar = document.getElementById("chBar");
    if (chBar) {
        new Chart(chBar, {
            type: 'bar',
            data: {
                labels: datalist.map(data => setDateFormat(data.date)),
                datasets: [{
                    data: datalist.map(data => data.totalTrainings),
                    backgroundColor: colors[0]
                }]
            },
            options: {
                legend: {
                    display: false
                },
                scales: {
                    xAxes: [{
                        barPercentage: 0.4,
                        categoryPercentage: 0.5
                    }]
                }
            }
        });
    }
}

function setDateFormat(date) {
    const dateObjet = new Date(date);
    const formattedDate = dateObjet.toLocaleDateString('pt-BR', {
        timeZone: 'UTC'
    });
    return formattedDate;
}
