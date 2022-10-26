/**
 * 
 */
function initMap(){
    // 위치데이터 경도, 위도로 구성된 jso 파일은 항상 이런식으로 구성되어있다.
    var ll = {lat: 37.5183691, lng: 126.9061918};
    map = new google.maps.Map(
            document.getElementById("map"),
            {zoom: 17, center: ll}
            );
    new google.maps.Marker(
        {position: ll,
            map: map,
            label: "휴먼교육센터"}        
    );
}
initMap(); // 맵 생성