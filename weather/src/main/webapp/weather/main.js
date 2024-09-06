$(document).ready(function() {
    const cityCoords = {
        '서울': { nx: 60, ny: 127 },
        '부산': { nx: 98, ny: 76 },
        '대구': { nx: 89, ny: 90 },
        '인천': { nx: 55, ny: 124 },
        '광주': { nx: 58, ny: 74 },
        '대전': { nx: 67, ny: 100 },
        '울산': { nx: 102, ny: 84 }
        // 필요한 다른 도시들을 여기에 추가
    };

    $('#getWeather').click(function() {
        var city = $('#city').val();
        if (!cityCoords[city]) {
            $('#weatherResult').html('<p>도시 이름을 올바르게 입력해주세요.</p>');
            return;
        }

        var nx = cityCoords[city].nx;
        var ny = cityCoords[city].ny;
        var apiKey = 'TUExQsncaJ9%2BRk%2FTMH3TibMXJcgNkoVQbq99q8ZcXeevc8XJUzt7w2UUB3SOo1N%2BDEtCWTgTGfdvaA64RbHY%2BQ%3D%3D'; // 발급받은 API 키 (URL 인코딩)
        var today = new Date();
        var date = today.toISOString().slice(0, 10).replace(/-/g, ""); // YYYYMMDD 형식
        var time = "0500"; // 기준 시간 (예시: 0500)

        var url = `http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey=${apiKey}&base_date=${date}&base_time=${time}&nx=${nx}&ny=${ny}&dataType=JSON`;

        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                var items = data.response.body.items.item;
                var weather = `<h2>${city}의 날씨</h2>`;
                
                $.each(items, function(index, item) {
                    if (item.category == 'TMP') { // TMP는 기온(Temperature)
                        weather += `<p>시간: ${item.fcstTime} - 기온: ${item.fcstValue}°C</p>`;
                    }
                });

                $('#weatherResult').html(weather);
            },
            error: function(request, status, error) {
                $('#weatherResult').html('<p>날씨 정보를 가져오는데 실패했습니다.</p>');
            }
        });
    });
});
