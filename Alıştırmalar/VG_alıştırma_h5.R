# ----------------------------------------------------------------------------
# Veri Görselleştirme Alıştırmaları 
# 18.11.2022
# ----------------------------------------------------------------------------
# köprü (bridge) veri setinin oluşturulması
bridge <- data.frame(material = rep(c("iron", "wood", "stell"), each = 4),
                     era = rep(c("crafts", "emerging", "mature", "modern"), 3),
                     number = c(5, 3, 3, 0,
                                13, 2, 0, 0,
                                0, 10 , 50, 19))
bridge 

# ----------------------------------------------------------------------------
# Pasta grafiği
# ----------------------------------------------------------------------------
# pasta grafiğini pie() fonksiyonu ile çizdirebiliriz.
# ancak bu fonksiyon sadece nümerik değişkenler ile çalışmaktadır.
# eğer bir kategorik değişkeni görselleştirmek istersek table() 
# fonksiyonu içerisinde kategorik değişkeninin düzeylerinin frekanslarını
# hesaplayarak, pasta graiğini elde edebiliriz.
# table() fonksiyonun işlevini keşfetmek için ayrıca çalıştırabilirsiniz.

pie(table(bridge$material),
    main = "Bridges for the materials")

# pasta grafiklerinin nasıl özelleştirildiğine buradan ulaşabilirsiniz:
# http://homepages.gac.edu/~anienow2/MCS_142/R/R-piechart.html


# ----------------------------------------------------------------------------
# Çoklu Pasta Grafiği 1
# ----------------------------------------------------------------------------

marketshare <- data.frame(percent = c(17, 18, 20, 22, 23, 20, 20, 19, 21, 20, 23, 22, 20, 18, 17),
                          company = rep(LETTERS[1:5], 3),
                          year = rep(c("2015", "2016", "2017"), each = 5))

ggplot(data = marketshare, aes(x = "", 
                               y = percent, 
                               group = year, 
                               colour = company, 
                               fill = company)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) + 
  facet_grid(.~ year) +
  theme_void()


# ----------------------------------------------------------------------------
# Çoklu Pasta Grafiği 2
# ----------------------------------------------------------------------------

# Süperlig'de 12 hafta sonunda 4 takımın attığı gollerin yüzdesel dağılımı
gol <- data.frame(Takım = rep(c("Galatasaray", 
                                "Fenerbahçe",
                                "Beşiktaş",
                                "Trabzonspor"), each = 3),
                  Bölge = rep(c("Defans",
                                "Orta Saha",
                                "Hücum"), 4),
                  golsayisi = c(6, 61, 33,
                                6, 71, 23,
                                14, 53, 33,
                                0, 74, 26))

ggplot(data = gol, aes(x = "", 
                       y = golsayisi, 
                       group = Takım, 
                       colour = Bölge, 
                       fill = Bölge)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) + 
  facet_grid(.~ Takım) +
  theme_void()

ggplot(gol, aes(fill = Bölge, 
                y = golsayisi, 
                x = Takım)) + 
  geom_bar(position = "stack", 
           stat = "identity") +
  labs(y = "Yüzde")

# ----------------------------------------------------------------------------
# yığılmış çubuk grafiğinin oluşturulması
# ----------------------------------------------------------------------------

ggplot(marketshare, aes(fill = company, 
                        y = percent, 
                        x = year)) + 
  geom_bar(position = "stack", 
           stat = "identity")


# ----------------------------------------------------------------------------
# çoklu çubuk grafiğinin oluşturulması
# ----------------------------------------------------------------------------

ggplot(marketshare, aes(fill = company, 
                        y = percent, 
                        x = year)) + 
  geom_bar(position = "dodge", 
           stat = "identity")

# ----------------------------------------------------------------------------
# yüzdesel yığılmış çubuk grafiğinin oluşturulması
# ----------------------------------------------------------------------------

library(readr) # veriyi R ortamına çekmek için gerekli
library(dplyr) # veri üzerinde manipülasyon yapılması için

# Öncelikle veriyi çekelim, veriye GitHub üzerindeki aynı klasörde yer alan
# women_tidy.csv dosyasında bulabilirsiniz.
# url olarak dosya bilgisayarınızda hangi konumdaysa onu kullanmalısınız.
# ya da R Studio üzerinden "Import Dataset" butonunu kullanabilirsiniz.
women <- read_csv("women_tidy.csv")

# Veri setindeki Türkiye satırlarını alalım, ve grafiği çizebilmek için
# ihtiyacımız olan erkek oranını hesaplayarak, veriye ekleyelim.
Turkey <- women %>% 
  filter(country == "Turkey", year > 2002) %>%
  mutate(perc_men = 100 - perc_women)

# Veriyi düzenli (tidy) hale getirmek için pivot almamız gerekiyor.
Turkey_pivoted <- Turkey[,3:5] %>% pivot_longer(!year, 
                                                names_to = "gender", 
                                                values_to = "percent")

# ggplot paketini kullanarak grafiği oluşturalım ve 
# gerekli düzenlemeleri yapalım.
ggplot(Turkey_pivoted, aes(fill = gender, 
                           y = percent, 
                           x = year)) + 
  geom_bar(position = "stack", 
           stat = "identity") +
  labs(x = "Yıl",
       y = "Göreli Yüzde (%)",
       fill = "Cinsiyet",
       title = "Türkiye Cumhuriyeti Parlamentosu Cinsiyet Oranı",
       subtitle = "2003-2016") + 
  scale_fill_discrete(labels = c("Erkek", "Kadın")) +
  theme_bw()


# ----------------------------------------------------------------------------
# mozaik grafik oluşturulması
# ----------------------------------------------------------------------------

library(ggplot2)
library(ggmosaic)
ggplot(bridge) +
  geom_mosaic(aes(x = product(era),
                  weight = number,
                  fill = material)) +
  labs(x = "Çağ",
       y = "",
       fill = "Materyal") +
  scale_fill_discrete(labels = c("Demir", "Çelik", "Ahşap")) + 
  scale_x_productlist(labels = c("El Yapımı", "Erken Dönem", "Olgunluk dönemi", "Modern")) + 
theme_bw()

# pasta grafiklerinin nasıl özelleştirildiğine buradan ulaşabilirsiniz:
# https://cran.r-project.org/web/packages/ggmosaic/vignettes/ggmosaic.html

# ----------------------------------------------------------------------------
# ağaç haritası (treemap) grafiğinin oluşturulması
# ----------------------------------------------------------------------------

library(treemapify)

ggplot(bridge, aes(area = number, 
                   fill = era, 
                   label = material,
                   subgroup = era)) +
  geom_treemap() +
  geom_treemap_text(colour = "black",
                    place = "centre",
                    size = 15) +
  scale_fill_brewer(palette = "Blues") +
  geom_treemap_subgroup_border(colour = "white", 
                               size = 5) +
  geom_treemap_subgroup_text(place = "centre", 
                             grow = TRUE,
                             alpha = 0.25, 
                             colour = "black",
                             fontface = "italic") +
  theme(legend.position = "none")

# ağaç haritalarının nasıl özelleştirildiğine buradan ulaşabilirsiniz:
# https://www.r-graph-gallery.com/treemap.html

