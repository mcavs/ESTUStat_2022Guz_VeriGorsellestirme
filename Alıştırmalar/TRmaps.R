##################################################################
##                   {TRmaps} ile uygulamalar                   ##
##################################################################
# {TRmaps} paketi GitHub üzerinden yüklenebildiği için öncelikle 
# GitHub üzerinden paket yüklemeye yarayan {devtools} paketi 
# yüklenmelidir.
# Paket detaylarına https://github.com/htastan/TRmaps üzerinden
# göz atabilirsiniz.
install.packages("devtools")
library(devtools)

# {devtools} paketini kullanarak, {TRmaps} paketini yükleyelim.
devtools::install_github("htastan/TRmaps")
library(TRmaps)

# Ayrıca {sf} paketini yüklemek gerekiyor. Bunun nedeni spatial
# tipteki verileri görselleştirebilmektir.
install.packages("sf")
library(sf)

# tr_nuts3 verisi, Türkiye'de il düzeyinde görselleştirme 
# yapabilmek için gerekli olan bilgileri taşır.
data("tr_nuts3")


# il düzeyinde basit bir görsel oluşturalım.
ggplot(tr_nuts3) + 
  geom_sf()

# ilçe düzeyinde basit bir görsel oluşturalım.
ggplot(tr_ilce) + 
  geom_sf()

#################################################################
##             İl düzeyinde koroplet oluşturulması             ##
#################################################################
# İl düzeyinde 2015 yılı Türkiye mutluluk endeksi verisetinin yüklenmesi
data("trdata2015")

# Yalnızca şehir ve mutluluk endeksi değişkenlerinden oluşan
# bir veriseti oluşturulması
tr_happiness <- trdata2015 %>% 
  select(province, happiness_level)

# OLuşturulan veri setinin spatial veri noktaları ile birleştirilmesi
tr_happiness2 <- left_join(tr_nuts3, tr_happiness, by = c("name_tr" = "province"))

# Türkiye haritası üzerinde mutluluk endekslerinin görselleştirilmesi
ggplot(tr_happiness2) + 
  geom_sf(aes(fill = happiness_level)) +
  theme_void()

#################################################################
##             İlçe düzeyinde koroplet oluşturulması           ##
#################################################################
# İlçe düzeyinde nüfus bilgilerini içeren veri setini yükleyelim.
data("trpopdata_ilce")

# Yalnızca ilçe kodu ve nüfus değişkenlerinden oluşan veri setinin oluşturulması
ilce_pop_2019 <- trpopdata_ilce %>% 
  filter(year == 2019) %>% 
  select(no, pop) 

# OLuşturulan veri setinin spatial veri noktaları ile birleştirilmesi
ilce_pop_2019_comb <- left_join(tr_ilce, ilce_pop_2019, by = c("tuik_no" = "no"))

# Son olarak veri setine yeni oluşturulan alan ve nüfus yoğunluğu değişkenlerini
# ekleyelim.
ilce_pop_2019_comb <- ilce_pop_2019_comb %>% 
  mutate(area = st_area(ilce_pop_2019_comb)) %>% 
  mutate(density = pop / (Shape_Area * 10000), 
         logdensity = log(density))

# istanbul üzerinde nüfus yoğunluğu haritaının oluşturulması
ilce_pop_2019_comb %>% filter(adm1 == "TUR034") %>%
  ggplot() +
  geom_sf(aes(fill = density)) + 
  scale_fill_viridis_c(trans = "log10", 
                       breaks=c(0, 100, 1000, 10000)) +
  labs(fill = "Nüfus Yoğunluğu") + 
  theme_void()