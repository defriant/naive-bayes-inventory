getDashboardData()

function getDashboardData() {
    ajaxRequest.get({
        "url": "/dashboard/produk-terlaris"
    }).then(function(result){
        console.log(result);
        $('#total-produk').html(result.total_produk)
        $('#total-terjual').html(result.total_terjual)
        produkTerlaris(result.produk_terlaris)
        chartProduk(result.chart_data)
    })
}

function produkTerlaris(params) {
    let tbody = ``
    let no = 1
    $.each(params, function(i, v){
        tbody = tbody + `<tr>
                            <td>${no}</td>
                            <td>${v.nama}</td>
                            <td><i class="fal fa-sack-dollar" style="margin-right: .6rem"></i>${v.terjual}</td>
                        </tr>`

        no = no + 1
    })

    $('#tbody-produk-terlaris').html(tbody)
}

function chartProduk(params) {
    $('#chart-content').html(`<canvas id="chart-produk"></canvas>`)

    let chartHeight = params.label.length * 70
    $('#chart-content').css('height', `${chartHeight}px`)
    $('#chart-produk').css('max-height', `${chartHeight}px`)
    $('#chart-produk').attr('height', `${chartHeight}px`)

    let ctx = document.getElementById("chart-produk").getContext('2d')
    
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: params.label,
            datasets: [
                {
                    label: 'Terjual',
                    data: params.value,
                    borderWidth: 3,
                    borderColor: mainColor,
                    backgroundColor: chartBarColor,
                    barThickness: 25
                }
            ]
        },
        options: {
            indexAxis: 'y',
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
}

// chartPendapatan()

// function chartPendapatan() {
//     let mychart
//     $.ajax({
//         type:'get',
//         url:'/data-pendapatan',
//         success:function(response){
//             console.log(response)
//             let ctx = document.getElementById("data-penjualan-chart").getContext('2d')
//             mychart = new Chart(ctx, {
//                 type: 'line',
//                 data: {
//                     labels: ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'],
//                     datasets: [
//                         {
//                             label: 'Pendapatan',
//                             data: response.pendapatan,
//                             borderColor: mainColor,
//                             backgroundColor: mainColor
//                         }
//                     ]
//                 },
//                 options: {
//                     plugins: {
//                         legend: {
//                             display: false
//                         }
//                     }
//                 }
//             });
//         }
//     })

    
//     $('.change-periode').on('click', function(){
//         $('.change-periode').removeClass('active')
//         $(this).addClass('active')
//         let periode = $(this).data('periode')
//         updateChartPendapatan(mychart, periode)
//     })
// }

// function updateChartPendapatan(mychart, periode) {
//     $.ajax({
//         type:'get',
//         url:'/data-pendapatan?tahun='+periode,
//         success:function(response){
//             $('#terjual').html(response.terjual)
//             $('#totalPendapatan').html(response.totalPendapatan)
//             mychart.data = {
//                 labels: ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'],
//                 datasets: [
//                     {
//                         label: 'Pendapatan',
//                         data: response.pendapatan,
//                         borderColor: mainColor,
//                         backgroundColor: mainColor
//                     }
//                 ]
//             }
//             mychart.update()
//         }
//     })
// }