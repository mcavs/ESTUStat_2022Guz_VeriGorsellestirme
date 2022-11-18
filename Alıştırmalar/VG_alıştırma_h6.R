# ----------------------------------------------------------------------------
# Veri Görselleştirme Alıştırmaları - Hafta 6
# 25.11.2022
# ----------------------------------------------------------------------------
# gerekli paketlerin yüklenmesi
library(ggplot2)
library(dplyr)

# mtcars veri setinin çağrılması
# veriseti hakkında detaylı bilgiler için buraya göz atabilirsiniz:
# https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/mtcars
data("mtcars")

# ----------------------------------------------------------------------------
# Saçılım grafiğinin çizilmesi
# ----------------------------------------------------------------------------

# mtcars verisetinde yer alan beygir gücü (hp) ve bir galon petrol ile aldığı 
# yol miktarı (mpg) değişkenleri arasındaki ilişkiyi görselleştirelim:

# bunu yapabilmek için plot() fonksiyonunu ya da ggplot paketini kullanabiliriz.
# plot() ile görselleştirilmesi:
plot(mtcars$hp, mtcars$mpg,
     xlab = "hp",
     ylab = "mpg",
     main = "mpg ve hp değişkenleri arasındaki ilişkinin görselleştirilmesi")

# ggplot ile görselleştirilmesi:
ggplot(mtcars, aes(x = hp, y = mpg)) + 
  geom_point() + 
  labs(title = "mpg ve hp değişkenleri arasındaki ilişkinin görselleştirilmesi")

# bu ilişkiyi bir de araçların vites türüne göre ele alalım.
# böylelikle bu iki değişken arasındaki ilişkinin aracın 
# vites türüne (otomatik, düz) göre farklılık gösterip
# göstermediğine bakalım:

ggplot(mtcars, aes(x = hp, y = mpg, colour = am)) + 
  geom_point() + 
  labs(title = "mpg ve hp değişkenleri arasındaki ilişkinin görselleştirilmesi")

# yukarıdaki komutları kullandığınızda yalnızca iki değer alan 
# vites türü (am) değişkeninin sanki 0 ve 1 arasında 5 farklı
# değer alan bir değişken gibi görselleştirildiğini göreceksiniz.
# Bunun nedeni vites türü değişkeninin kategorik değişken olarak
# tanımlanmamış olmasıdır. Bu gibi durumlarla karşılaştığımızda
# factor() fonksiyonunu kullanarak ilgili değişkeni kategorik 
# değişkene dönüştürebiliriz.

ggplot(mtcars, aes(x = hp, y = mpg, colour = factor(am))) + 
  geom_point() + 
  labs(title = "mpg ve hp değişkenleri arasındaki ilişkinin görselleştirilmesi")

# yukarıdaki komutları çalıştırdığınızda vites türünü gösteren
# renk estetiğinin etiketlerinin 0 ve 1 olduğunu göreceksiniz.
# Burayı daha anlaşılır hale getirebilmek için 0 ve 1 etiketinin
# otomatik mi düz mü olduğunu tespit etmeliyiz. Bunun için bu 
# dökümanın üst kısmında verilen verisetinin detaylarının yer
# aldığı bağlantıya gitmeliyiz. 

ggplot(mtcars, aes(x = hp, y = mpg, colour = factor(am))) + 
  geom_point() + 
  labs(title = "mpg ve hp arasındaki ilişkinin vites türüne göre görselleştirilmesi",
       colour = "Vites Türü") + 
  scale_colour_discrete(labels = c("Otomatik", "Düz"))

# aynı görselleştirmeyi yan yana (side by side) düzeninde çizmek için 
# facet_grid özelliğini kullanmamız gerekiyor:

ggplot(mtcars, aes(x = hp, y = mpg)) + 
  geom_point() + 
  labs(title = "mpg ve hp arasındaki ilişkinin vites türüne göre görselleştirilmesi") + 
  facet_grid(~am)

# yukarıdaki komutları çalıştırdığınızda her bir vites türü için oluşan
# grid'in etiketinin düzenlenmesi gerektiğini farkedeceksiniz. Bunun 
# için vites türü değişkeninin 0 ve 1 olan değerlerini "Otomatik" ve 
# "Düz" olarak değiştirilmesi gerekmektedir. Bu işlem için aşağıdaki 
# kodlar kullanılabilir:

mtcars$am <- ifelse(mtcars$am == 1, "Düz", "Otomatik")

ggplot(mtcars, aes(x = hp, y = mpg)) + 
  geom_point() + 
  labs(title = "mpg ve hp arasındaki ilişkinin vites türüne göre görselleştirilmesi") + 
  facet_grid(~am)

# Veriye dair neredeyse tüm analizlerde verisetinde yer alan tüm 
# sürekli değişkenlerin arasındaki ilişkiler araştırılır. Bunun için
# en kullanışlı araç saçılım matrisidir (scatter matrix). Öncelikle
# verisetinde yer alan sürekli değişkenler belirlenmelidir. 

# veriseti hakkındaki detaylı bilgiler göz attığımızda, mpg, disp,hp,
# drat ve wt olmak üzere 5 değişken süreklidir. Yalnızca bu değişkenlerin
# yer aldığı sütunlar çağrılarak saçılım matrisi çizdirilebilir:

plot(mtcars[, c(1,3:6)])


# ----------------------------------------------------------------------------
# Korelogram grafiğinin çizilmesi
# ----------------------------------------------------------------------------

# Korelogram grafiklerinin çizilmesi için GGally, corrgram ve ellipse 
# paketlerinde yer alan fonksiyonlar kullanılabilir. Detaylı bilgi için
# buraya göz atabilirsiniz: https://www.r-graph-gallery.com/correlogram.html

library(GGally)
ggcorr(mtcars[, c(1,3:6)]) 

# ----------------------------------------------------------------------------
# 
# ----------------------------------------------------------------------------

# Korelogram grafiğinin daha iyi okunabilmesi için şekil estetiğinden 
# yararlanılabilir. Bunun için ellipse paketinde yer alan plotcorr 
# fonksiyonunu kullanabiliriz. Öncelikle cor() fonksiyonu ile veri setinde
# yer alan değişkenlerin korelasyon katsayılarını hesaplamamız gerekiyor.
# Bunu cor_mtcars nesnesine atayalım. Sonrasında bu nesneyi plotcorr
# fonksiyonuna aktardığımızda görseli elde edebiliriz:

library(ellipse)
library(MetBrewer)
cor_mtcars <- cor(mtcars[, c(1,3:6)])
plotcorr(cor_mtcars[order(cor_mtcars[,1]),order(cor_mtcars[,1])], 
         col = met.brewer("Cassatt1"))











