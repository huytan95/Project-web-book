(() => {
        'use strict'

        feather.replace({ 'aria-hidden': 'true' })
        const months =${months} ;
        const totalPrices = ${totalPrices};
        // Grap
        const ctx = document.getElementById('myChart')
        // eslint-disable-next-line no-unused-vars
        const myChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: months,
            datasets: [{
              data: totalPrices,
              lineTension: 0,
              backgroundColor: 'transparent',
              borderColor: '#007bff',
              borderWidth: 4,
              pointBackgroundColor: '#007bff'
            }]
          },
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: false
                }
              }]
            },
            legend: {
              display: false
            }
          }
        })
      })()