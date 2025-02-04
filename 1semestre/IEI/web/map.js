var map = new L.Map("oMeuMapa", { center: [40.633258, -8.659097], zoom: 15 });
var osmUrl = "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
var osmAttrib = "Map data OpenStreetMap contributors";
var osm = new L.TileLayer(osmUrl, { attribution: osmAttrib });
map.addLayer(osm);
map.on("click", mostraCoordenadas);

function mostraCoordenadas(e) {
    var s = document.getElementById("coordenadas");
    s.innerHTML = "Latitude, Longitude = " + e.latlng.lat + ", " + e.latlng.lng;
}

var iconeUA = L.icon({ iconUrl: "http://xcoa.av.it.pt/ua.png" });

var pontos = [
    L.marker([40.633258, -8.659097], { icon: iconeUA }).bindPopup("LABI@DETI"),
    L.marker([40.621086554918406, -8.560817243223939]).bindPopup("Casa"),
    L.marker([40.62949665849681, -8.655452013695141], { icon: iconeUA }).bindPopup("Complexo Pedagógico")
];
for (i in pontos) {
    pontos[i].addTo(map);
}

var reitoria = L.polygon(
    [
        [40.63102, -8.65793],
        [40.63149, -8.65731],
        [40.63126, -8.65699],
        [40.63078, -8.65759]
    ], { color: "red" });
reitoria.addTo(map);

var DETI = L.polygon(
    [
        [40.63280324574582, -8.659118056166335],
        [40.63280324574582, -8.65928435312526],
        [40.633067863427605, -8.659295081961318],
        [40.63307193446068, -8.659402370321914],
        [40.63307193446068, -8.659402370321914],
        [40.63313218542286, -8.659416317841535],
        [40.63313218542286, -8.659416317841535],
        [40.63313707070753, -8.659483909541452],
        [40.63308821834199, -8.659494638377511],
        [40.63308821834199, -8.659650206500375],
        [40.63349857705186, -8.659664153856285],
        [40.63350671906524, -8.659492492479332],
        [40.633250245167325, -8.659492492479332],
        [40.633244545761016, -8.659362673824946],
        [40.633191622448614, -8.659357309406914],
        [40.633183480396816, -8.659292936390557],
        [40.633183480396816, -8.659292936390557],
        [40.6332209338765, -8.659287571972529],
        [40.6332209338765, -8.659121275013606]




    ], { color: "black" }).bindPopup("DETI");
DETI.addTo(map);

var grupo = new L.featureGroup(pontos);
map.fitBounds(grupo.getBounds());