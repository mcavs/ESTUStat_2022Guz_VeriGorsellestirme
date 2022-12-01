install.packages("leaflet")
library(leaflet)


leaflet() %>% addTiles()

# servis sağlayıcıları
names(providers)

leaflet() %>% 
  addProviderTiles("CartoDB")

# {ggmap} paketinde yer alan geocode() fonksiyonu
# bir noktanın enlem ve boylam bilgilerini döndürür.
# Böylelikle istenilen bölgeleri işaretleyebilir ya 
# da üzerinde işlemler yapabiliriz.
install.packages("ggmap")
library(ggmap)

# ggcode() fonksiyonunu kullanmak için Google girişi
# yapmak gerekiyor. Bunun nedeni Google gibi bir çok
# veri sağlayıcısının API'lar aracılığıyla bu işlemi
# yapmaya imkan sağlamasıdır.
geocode("Eskisehir Technical University")

#################################################################
##           Varsayılan harita görüntüsünü hazırlama           ##
#################################################################
leaflet() %>%
  addTiles() %>% 
  setView(lng = -45,
          lat = 62,
          zoom = 5)

# fitBounds() fonksiyonu ile harita görüntüsünün sınırlarını
# belirlenebilir.
leaflet() %>%
  addTiles() %>% 
  fitBounds(lng1 = -2, lat1 = 55,
            lng2 = -5, lat2 = 57)

# 
leaflet() %>%
  addTiles() %>%
  setView(lng = -73, lat = 40, zoom = 8) %>%
  setMaxBounds(lng1 = -73, lat1 = 40,
               lng2 = -73.2, lat2 = 40.2)

# Bir noktayı işaretleme
# Google Maps üzerinde herhangi bir noktaya sağ tıklayarak 
# koordinat bilgilerine ulaşabiliriz.
leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 30.529772062009766,
             lat = 39.81620398425738)

# pop-up eklenerek isim verilebilir.
# pin işaretine tıklandığında popup görüntülenir.
leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 30.529772062009766,
             lat = 39.81620398425738,
             popup = "ESTÜ")

# daire işaretçisi eklenebilir.
leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 30.529772062009766,
             lat = 39.81620398425738,
             popup = "ESTÜ") %>%
  addCircleMarkers(lng = 30.529772062009766,
                   lat = 39.81620398425738)

# radius argümanıyla dairenin boyutu değiştirilebilir.
leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 30.529772062009766,
             lat = 39.81620398425738,
             popup = "ESTÜ") %>%
  addCircleMarkers(lng = 30.529772062009766,
                   lat = 39.81620398425738,
                   radius = 3)

# rengi değiştirilebilir.
leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 30.529772062009766,
             lat = 39.81620398425738,
             popup = "ESTÜ") %>%
  addCircleMarkers(lng = 30.529772062009766,
                   lat = 39.81620398425738,
                   radius = 3,
                   color = "red")

# bazı üniversitelerin konum görselleştirme uygulaması
university <- data.frame(name = c("ESTÜ", "AÜ", "OGÜ", "ODTÜ", "Hacettepe",
                                  "Ankara", "Gazi", "Uludağ", "TED", "Bilkent"),
                         lng = c(30.52977206200976, 30.500723073522995, 30.48994471065330, 32.778531685761386,
                                 32.734139, 32.833861499996840, 32.82157630854144, 28.871073822600774,
                                 32.81006909235379, 32.747639120959626),
                         lat = c(39.81620398425738, 39.790170106061346, 39.75489703003624, 39.90384259197186,
                                 39.871306, 39.935365049302355, 39.94244880098397, 40.231694522295804, 
                                 40.16648886467359, 39.8747710852541),
                         group = c("Devlet", "Devlet", "Devlet","Devlet", "Devlet",
                                   "Devlet", "Devlet", "Devlet", "Özel", "Özel"))

university %>%
  filter(group == "Devlet") %>%
  leaflet() %>%
  addProviderTiles("CartoDB") %>%
  addCircleMarkers(lng = ~lng,
                   lat = ~lat,
                   popup = ~name,
                   radius = 3)





