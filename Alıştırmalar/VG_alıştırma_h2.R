# Veri Görselleştirme Alıştırmaları - Hafta 2
# ------------------------------------------------------------------------------------------------------------------------
# Bu haftaki alıştırmalar derste verilen Amerika eyaletleri sıcaklık görselleştirmelerinin İstanbul verisi üzerinde
# uygulanması üzerinedir. Aşağıdaki adımları takip ederek verilere erişebilir ve grafikleri çizdirebilirsiniz.
# Anlaşılmayan herhangi bir nokta olursa "Issues" bölümünden bir başlık oluşturabilir ya da mail ile bana ulaşabilirsiniz.
# Mustafa Cavus, Ph.D.
# ------------------------------------------------------------------------------------------------------------------------
# R paketleri farklı fonksiyonları içeren alet çantaları gibidir. En iyi görselleştirme araçlarının yer aldığı R paketi 
# ggplot2'dir. Aşağıdaki kodları kullanarak paketi indirebilir ve kurabilirsiniz.
install.packages("ggplot2")
library(ggplot2)   

# Aşağıdaki kodları kullanarak İstanbul'da 2020 yılı içerisinde farklı istasyonlarda yapılan sıcaklık ölçümlerini içeren
# veri setlerini indirebilirsiniz.
#
# Veri Kaynağı: https://data.ibb.gov.tr/tr/dataset/meteorology-observation-station-data-set
# verilerin web sayfası üzerinden çekilmesi (birkaç dakika sürebilir...)
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

# 'ocak' nesnesini kontrol edelim. head() fonksiyonu uzun veri setlerinin (çok sayıda satır içeren) yalnızca 
# ilk satırlarını (default 10) konsola yazdırmak için kullanılır.
head(ocak)
# eğer nesne boş dönmüyorsa (gözlem değerleri içeriyorsa) devam edelim.

# Burada aylar bazında indirdiğimiz verileri tek bir nesne üzerinde satır birleştirme (rbind) işlemi ile topluyoruz.
istanbul <- rbind(ocak, subat, mart, nisan, mayis, haziran, temmuz, 
                  agustos, eylul, ekim, kasim, aralik)

# Veri setinin sorunsuz indiğinden emin olmak için boyutunu kontrol edelim.
dim(istanbul)
# [1] 568706     24
# eğer dim() fonksiyonu ile boyut kontrolü yaptığınızda yukarıdaki çıktıyı elde ediyorsanız veri setini sorunsuz indirmişssindir.
# bu çıktıda ilk değer yani 568706 veri setindeki satır (gözlem) sayısını, ikinci değer ise sütun (değişken) sayısını gösterir.

# Veri üzerinde bazı işlemler yapmak için "tidyverse" paketler bütününü (içerisinde bir çok paket içeren paket: metapaket) kullanacağız.
install.packages("tidyverse")
library(tidyverse) 

# ------------------------------------------------------------------------------------------------------------------------
# Line chart örneği
# ------------------------------------------------------------------------------------------------------------------------

# 'istanbul' nesnesinde yer alan yalnızca BEYKOZ, BUYUKADA, PENDIK, ARNAVUTKOY, SILE, SAMANDIRA, ZEKERIYAKOY ilçelerinde yapılan 
# ölçümleri filtreleyip 'istanbul_filtered' nesnesine atayalım. Böylelikle tüm ilçeleri içeren çok karmaşık bir grafik oluşturmaktan
# kurtulabilir ya da yalnızca ilgilendiğimiz ilçelere ilişkin grafikler oluşturabiliriz.
istanbul_filtered <- istanbul %>% filter(OBSERVATORY_NAME %in% c("BEYKOZ", "BUYUKADA", "PENDIK", "ARNAVUTKOY"))

# 'ggplot' fonksiyonu ggplot2 paketinin ana fonksiyonudur ve bu paket kullanılarak çizilecek tüm grafiklerde kullanılır.
# ggplot katman yapısında bir fonksiyona sahiptir. Her bir '+' işareti katmanları birbirine bağlar.
# 1.katmanda kullanacağımız veri setini, eksenlerde yer alacak değişkenleri ve renklerle ayıracağımız değişkeni belirteceğiz.
# 2.katmanda çizmek istediğimiz grafik tipini belirlememiz gerekiyor: geom_smooth() grafik tipini kullanacağız.
# 3.katmanda eksenlerin isimlerini düzenliyoruz ve lejant (legend) isimlendirmesi yapıyoruz.
# 4.katmanda ilçe isimlerini düzenliyoruz.
# 5.katmanda ise y ekseninin değer sınırlarını yeniden düzenliyoruz.
# 3-4-5.katmanlar opsiyoneldir. Bu katmanları silsenizde bir grafik elde edersiniz ancak iyi bir görselleştirme örneği olmayabilir (!).
ggplot(istanbul_filtered, aes(x = as.Date(DATE_TIME), 
                              y = AVERAGE_TEMPERATURE, 
                              col = OBSERVATORY_NAME)) + # 1.katman
  geom_smooth(se = FALSE) + # 2.katman
  labs(x = "Tarih", y = "Ortalama Sıcaklık", color = "Bölge") + # 3.katman
  scale_color_discrete(labels = c("Arnavutköy", "Beykoz", "Büyükada", "Pendik")) + # 4.katman
  ylim(0, 30) + # 5.katman  
  theme_bw()


# ------------------------------------------------------------------------------------------------------------------------
# mtcars veri seti ile çok öğeli görselleştirme örneği
# ------------------------------------------------------------------------------------------------------------------------

ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point(aes(shape = factor(cyl), color = factor(gear), size = wt)) +
  labs(shape = "silindir sayısı", 
       x = "motor hacmi",
       y = "km / 1 litre benzin",
       size = "ağırlık",
       color = "vites")






