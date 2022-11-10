# ----------------------------------------------------------------------------
# Veri Görselleştirme Alıştırmaları - Hafta 4
# 11.11.2022
# ----------------------------------------------------------------------------
# Gereken paketlerin yüklenmesi ve çağırılması
install.packages("DALEX") # titanic veri setine erişmek için
install.packages("dplyr") # pipe operatörünü kullanmak için
library(DALEX)
library(dplyr)

# titanic veri setinin çağırılması
data(titanic)
# Artık verisetini titanic komutunu kullanarak görebiliriz.

# ----------------------------------------------------------------------------
# Titanic gemisinde yer alan yolcuların yaşlarının dağılımının histogram ile 
# görselleştirilmesi
# ----------------------------------------------------------------------------
ggplot(titanic, aes(x = age)) + 
  geom_histogram()
# Bu komutu kullandıktan sonra histogramı çizdirmiş olacaksınız ancak bir hata 
# da alacaksınız. Bunun nedeni yüksek yaş değerleri için histogram bin'lerini 
# hesaplamak için yeterli sayıda gözlem kalmaması nedeniyledir. 

# geom_histogram katmanında binwidth argümanını değiştirerek farklı bin 
# değerleri için histogram çizdirebiliriz.
ggplot(titanic, aes(x = age)) + 
  geom_histogram(binwidth = 5)

# Çizdirdiğiniz histogramlarda binlerin birbirinden ayrılmadığını göreceksiniz.
# Bunun sebebi hem bin'lerin hem de bin çerçevelerinin siyah renkte çizilmesidir.
# Değiştirmek için geom_histogram katmanındaki color ve fill argümanlarını
# değiştirmek gereklidir.
ggplot(titanic, aes(x = age)) + 
  geom_histogram(binwidth = 5, color = "black", fill = "white")

# eksen isimleri ve grafik başlığını düzenleyelim:
ggplot(titanic, aes(x = age)) + 
  geom_histogram(binwidth = 5, color = "white", fill = "grey30") + 
  labs(x = "Yaş", 
       y = "Frekans",
       title = "Titanic Yolcularının Yaşlarının Dağılımı")

# x ekseninde yer alan en büyük değer etiketi 60 olmasına rağmen bu değerden
# daha büyük gözlemler olduğunu görüyoruz. Benzer durum y ekseninde de 
# gözleniyor. Bu nedenle eksen sınırlarının bir düzenlemeye ihtiyacı var:
ggplot(titanic, aes(x = age)) + 
  geom_histogram(color = "white", fill = "black") +
  labs(x = "Yaş", 
       y = "Frekans",
       title = "Titanic Yolcularının Yaşlarının Dağılımı",
       subtitle = "Histogram") + 
  lims(x = c(0, 80), y = c(0, 300))

# ----------------------------------------------------------------------------
# Titanic gemisinde yer alan yolcuların yaşlarının dağılımının farklı
# binwidth genişlikleri ile histogramının çizdirilmesi
# ----------------------------------------------------------------------------
install.packages("gridExtra")
library(gridExtra)
library(ggplot2)

g1 <- ggplot(titanic, aes(x = age)) + 
  geom_histogram(binwidth = 1, color = "white", fill = "grey30") + 
  labs(x = "Yaş", 
       y = "Frekans",
       title = "binwidth = 1")

g2 <- ggplot(titanic, aes(x = age)) + 
  geom_histogram(binwidth = 3, color = "white", fill = "grey30") + 
  labs(x = "Yaş", 
       y = "Frekans",
       title = "binwidth = 3")

g3 <- ggplot(titanic, aes(x = age)) + 
  geom_histogram(binwidth = 5, color = "white", fill = "grey30") + 
  labs(x = "Yaş", 
       y = "Frekans",
       title = "binwidth = 5")

g4 <- ggplot(titanic, aes(x = age)) + 
  geom_histogram(binwidth = 10, color = "white", fill = "grey30") + 
  labs(x = "Yaş", 
       y = "Frekans",
       title = "binwidth = 10")

grid.arrange(
  g1,
  g2,
  g3, 
  g4
)


# ----------------------------------------------------------------------------
# Titanic gemisinde yer alan yolcuların yaşlarının dağılımının kernel yoğunluk
# tahmini ile görselleştirilmesi
# ----------------------------------------------------------------------------
ggplot(titanic, aes(x = age)) + 
  geom_density(fill = "skyblue", color = "skyblue") +
  labs(x = "Yaş", 
       y = "Yoğunluk",
       title = "Titanic Yolcularının Yaşlarının Dağılımı",
       subtitle = "Kernel Yoğunluk Tahmini") + 
  lims(x = c(0, 80), y = c(0, 0.04))

# ----------------------------------------------------------------------------
# Titanic gemisinde yer alan yolcuların yaşlarının dağılımının farklı
# bandwidth genişlikleri ile kernel yoğunluk grafiğinin çizdirilmesi
# ----------------------------------------------------------------------------
k1 <- ggplot(titanic, aes(x = age)) + 
  geom_density(fill = "skyblue", 
               color = "skyblue",
               bw = 0.1) +
  labs(x = "Yaş", 
       y = "Yoğunluk",
       title = "bandwidth = 0.1") + 
  lims(x = c(0, 80), y = c(0, 0.04))

k2 <- ggplot(titanic, aes(x = age)) + 
  geom_density(fill = "skyblue", 
               color = "skyblue",
               bw = 2) +
  labs(x = "Yaş", 
       y = "Yoğunluk",
       title = "bandwidth = 2") + 
  lims(x = c(0, 80), y = c(0, 0.04))

k3 <- ggplot(titanic, aes(x = age)) + 
  geom_density(fill = "skyblue", 
               color = "skyblue",
               bw = 3) +
  labs(x = "Yaş", 
       y = "Yoğunluk",
       title = "bandwidth = 3") + 
  lims(x = c(0, 80), y = c(0, 0.04))

k4 <- ggplot(titanic, aes(x = age)) + 
  geom_density(fill = "skyblue", 
               color = "skyblue",
               bw = 5) +
  labs(x = "Yaş", 
       y = "Yoğunluk",
       title = "bandwidth = 5") + 
  lims(x = c(0, 80), y = c(0, 0.04))

grid.arrange(
  k1,
  k2,
  k3, 
  k4
)

# ----------------------------------------------------------------------------
# Titanic gemisinde yer alan yolcuların yaşlarının dağılımının cinsiyete göre
# dağılımının yığılmış histogram ile görselleştirilmesi
# ----------------------------------------------------------------------------
ggplot(titanic, aes(x = age, fill = gender)) + 
  geom_histogram(color = "black") +
  labs(x = "Yaş", 
       y = "Frekans",
       title = "Titanic Yolcularının Yaşlarının Cinsiyete Göre Dağılımı",
       subtitle = "Yığılmış Histogram",
       fill = "Cinsiyet") + 
  scale_fill_discrete(labels = c("Kadın", "Erkek")) +
  lims(x = c(0, 80), y = c(0, 300))

# ----------------------------------------------------------------------------
# Titanic gemisinde yer alan yolcuların yaşlarının dağılımının cinsiyete göre
# dağılımının kernel yoğunluk tahmini grafiği ile görselleştirilmesi
# ----------------------------------------------------------------------------
ggplot(titanic, aes(x = age, fill = gender)) + 
  geom_density() +
  labs(x = "Yaş", 
       y = "Yoğunluk",
       title = "Titanic Yolcularının Yaşlarının Cinsiyete Göre Dağılımı",
       subtitle = "Kernel Yoğunluk Tahmini",
       fill = "Cinsiyet") + 
  scale_fill_discrete(labels = c("Kadın", "Erkek")) +
  lims(x = c(0, 80), y = c(0, 0.04))

# Üstteki kodlar kullanılarak elde edilen grafikte cinsiyetlere göre yaş
# dağılım eğrileri üst üste bindiği için arkada kalan düzeye ilişkin
# resmin bütününü göremiyoruz. Bunun için renkleri saydamlaştırılması
# gerekiyor. Bunun için geom_density() katmanında yer alan alpha 
# argümanı değerinin değiştirilmesi gerekiyor. alpha argümanı 0 ve 1 
# arasında değerler almaktadır: 0 en şeffaf değeri 1 ise en opak değeri 
# temsil etmektedir. 
ggplot(titanic, aes(x = age, fill = gender)) + 
  geom_density(alpha = 0.5) +
  labs(x = "Yaş", 
       y = "Yoğunluk",
       title = "Titanic Yolcularının Yaşlarının Cinsiyete Göre Dağılımı",
       subtitle = "Kernel Yoğunluk Tahmini",
       fill = "Cinsiyet") + 
  scale_fill_discrete(labels = c("Kadın", "Erkek")) +
  lims(x = c(0, 80), y = c(0, 0.04))

# ----------------------------------------------------------------------------
# Titanic gemisinde yer alan yolcuların yaşlarının dağılımının cinsiyete göre
# dağılımının yığılmış kernel yoğunluk tahmini grafiği ile görselleştirilmesi
# ----------------------------------------------------------------------------
# Yığılmış kernel yoğunluk tahmini grafiği için geom_density katmaınında 
# yer alan position argimanının "fill" olarak belirlenmesi gerekiyor. Bu seçim
# ile yığılma işlemini ggplot katmanında yer alan fill değişkenine göre 
# gerçekleştirilmiş olur.
ggplot(titanic, aes(x = age, fill = gender)) + 
  geom_density(position = "fill") +
  labs(x = "Yaş", 
       y = "Yoğunluk",
       title = "Titanic Yolcularının Yaşlarının Cinsiyete Göre Dağılımı",
       subtitle = "Yığılmış Kernel Yoğunluk Tahmini",
       fill = "Cinsiyet") + 
  scale_fill_discrete(labels = c("Kadın", "Erkek")) 


# ----------------------------------------------------------------------------
# Gereken paketlerin yüklenmesi ve çağırılması
install.packages("dplyr") # pipe operatörünü kullanmak için
install.packages("ggforce") # sina plot çizmek için
install.packages("ggridges") # ridgeline plot çizmek için
library(dplyr)
library(ggforce)
library(ggridges)

# Veri Kaynağı: https://data.ibb.gov.tr/tr/dataset/meteorology-observation-station-data-set
# verilerin web sayfası üzerinden çekilmesi (biraz uzun sürebilir...)
ocak    <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/8ca0081a-333c-4e86-8ea2-ab8741bbfc95/download/meteorology_observation_202001.csv"))
subat   <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/d539adaf-9a82-4a32-a4a8-3c5aa40adee8/download/meteorology_observation_202002.csv"))
mart    <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/95594d5c-c2ac-4fa1-a74b-83b5d807c898/download/meteorology_observation_202003.csv"))
nisan   <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/c2168908-2999-44a0-a25f-f06e45d763a5/download/meteorology_observation_202004.csv"))
mayis   <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/179d634e-bd8b-45c8-9703-e95789ff78a7/download/meteorology_observation_202005.csv"))
haziran <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/0deb3b37-bc2c-43e7-9f7e-ddd84c464067/download/meteorology_observation_202006.csv"))
temmuz  <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/9aa39185-b53d-42f5-8de5-1b49b80dd0fd/download/meteorology_observation_202007.csv"))
agustos <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/f0aa1cb6-7f17-4b80-b88d-ff37e02859dc/download/meteorology_observation_202008.csv"))
eylul   <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/63a56db8-fe85-4b36-b272-7769816efef9/download/meteorology_observation_202009.csv"))
ekim    <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/3c15afe0-3aba-4db2-bfb6-62cf018526ed/download/meteorology_observation_202010.csv"))
kasim   <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/31a3cdfc-6fff-48e9-9b99-ef093e92dc3b/download/meteorology_observation_202011.csv"))
aralik  <- read.csv(url("https://data.ibb.gov.tr/tr/dataset/94197af2-67f4-428a-a031-432e1848cc59/resource/8f46cd17-e322-4c3f-bad0-1cfd1e126b87/download/meteorology_observation_202012.csv"))

# Burada aylar bazında indirdiğimiz verileri tek bir nesne üzerinde satır birleştirme (rbind) işlemi ile topluyoruz.
istanbul <- rbind(ocak, subat, mart, nisan, mayis, haziran, temmuz, 
                  agustos, eylul, ekim, kasim, aralik)

istanbul_beykoz <- istanbul %>% filter(OBSERVATORY_NAME %in% c("BEYKOZ")) %>% mutate(mon = months(as.Date(DATE_TIME)))

data <- istanbul_beykoz %>% 
  group_by(mon) %>% 
  summarise(min = min(AVERAGE_TEMPERATURE), 
            max = max(AVERAGE_TEMPERATURE), 
            median = median(AVERAGE_TEMPERATURE))

# ay (mon) değişkeni sıralı bir değişken olduğu için factor() fonksiyonu ile sıralı bir hale getiriyoruz. Bunu yapmazsak R ayları
# alfabetik sıraya göre sıralar.
data$mon <- factor(data$mon, ordered = TRUE, 
                   levels = c("Ocak", "Şubat", "Mart", "Nisan",
                              "Mayıs", "Haziran", "Temmuz", "Ağustos",
                              "Eylül", "Ekim", "Kasım", "Aralık"))

# ----------------------------------------------------------------------------
# Nokta-aralık grafiği (point-range point)
# ----------------------------------------------------------------------------
ggplot(data, aes(x = mon, 
                 y = median,
                 ymin = min,
                 ymax = max)) + 
  geom_pointrange() + 
  labs(y = "Ortalama Sıcaklık (C)", 
       x = "Aylar",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Nokta-Aralık Grafiği")

# ----------------------------------------------------------------------------
# multiple boxplot
# ----------------------------------------------------------------------------
istanbul_beykoz$mon <- factor(istanbul_beykoz$mon, ordered = TRUE, 
                              levels = c("Ocak", "Şubat", "Mart", "Nisan",
                                         "Mayıs", "Haziran", "Temmuz", "Ağustos",
                                         "Eylül", "Ekim", "Kasım", "Aralık"))

ggplot(istanbul_beykoz, aes(x = mon, y = AVERAGE_TEMPERATURE)) + 
  geom_boxplot() + 
  labs(y = "Ortalama Sıcaklık (C)", 
       x = "Aylar",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Kutu Grafiği")

# aykırı değerlerin gizlenmesi
ggplot(istanbul_beykoz, aes(x = mon, y = AVERAGE_TEMPERATURE)) + 
  geom_boxplot(outlier.shape = NA) + 
  labs(y = "Ortalama Sıcaklık (C)", 
       x = "Aylar",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Kutu Grafiği")

# ----------------------------------------------------------------------------
# keman grafikleri
# ----------------------------------------------------------------------------
ggplot(istanbul_beykoz, aes(x = mon, y = AVERAGE_TEMPERATURE)) + 
  geom_violin() + 
  labs(y = "Ortalama Sıcaklık (C)", 
       x = "Aylar",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Keman Grafiği")

# ----------------------------------------------------------------------------
# şerit grafikleri (strip chart)
# ----------------------------------------------------------------------------
ggplot(istanbul_beykoz, aes(x = mon, y = AVERAGE_TEMPERATURE)) + 
  geom_jitter() + 
  labs(y = "Ortalama Sıcaklık (C)", 
       x = "Aylar",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Keman Grafiği")

# şerit grafiklerinde noktaların boyutunun küçültülmesi
ggplot(istanbul_beykoz, aes(x = mon, y = AVERAGE_TEMPERATURE)) + 
  geom_jitter(cex = 0.2, col = "red") + 
  labs(y = "Ortalama Sıcaklık (C)", 
       x = "Aylar",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Keman Grafiği")

# ----------------------------------------------------------------------------
# sina plots 
# ----------------------------------------------------------------------------
ggplot(istanbul_beykoz, aes(x = mon, y = AVERAGE_TEMPERATURE)) + 
  geom_sina() +
  labs(y = "Ortalama Sıcaklık (C)", 
       x = "Aylar",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Sina Grafiği")

# Sina grafiğinde noktalar üst üste bindiği için yoğunluğu daha iyi 
# görebilmek için nokta boyutlarını küçültmemiz gerekiyor.
ggplot(istanbul_beykoz, aes(x = mon, y = AVERAGE_TEMPERATURE)) + 
  geom_sina(cex = 0.1) +
  labs(y = "Ortalama Sıcaklık (C)", 
       x = "Aylar",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Sina Grafiği")

# ----------------------------------------------------------------------------
# ridgeline plots 
# ----------------------------------------------------------------------------
ggplot(istanbul_beykoz, aes(x = AVERAGE_TEMPERATURE, y = mon)) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none") +
  labs(y = "Aylar", 
       x = "Ortalama Sıcaklık (C)",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Ridgeline Plot")

# ridgeline plot yoğunluk eğrilerini histogram tipine çevirebiliriz:
# geom_density_ridges katmanında stat argümanını "binline" olarak
# belirlememiz gerekiyor.
ggplot(istanbul_beykoz, aes(x = AVERAGE_TEMPERATURE, y = mon)) +
  geom_density_ridges(stat = "binline") +
  theme_ridges() + 
  theme(legend.position = "none") +
  labs(y = "Aylar", 
       x = "Ortalama Sıcaklık (C)",
       title = "Beykoz 2020 Yılı Aylık Sıcaklık Dağılımları",
       subtitle = "Ridgeline Plot")