# ---------------------------------------------------------------------------
# Veri Görselleştirme Alıştırmaları - Hafta 3
# Miktar görselleştirme uygulamaları
# 21.10.2022
# ---------------------------------------------------------------------------
install.packages("palmerpenguins") # veri setine erişmek için
install.packages("ggplot2") # ggplot görselleştirme araçlarını kullanmak için
install.packages("dplyr") # pipe (%>%) operatörü kullanabilmek ve veri manipülasyonu işlemlerini yapabilmek için
install.packages("tidyverse")
library(palmerpenguins)
library(ggplot2)
library(dplyr)
library(tidyverse)

# ---------------------------------------------------------------------------
# Wilke'nin kitabında sayfa 45'te yer alan sinema filmi verisinin görselleştirilmesi
# ---------------------------------------------------------------------------
# Öncelikle veriyi data.frame formatiında tanımlamamız gerekiyor:

filmler <- data.frame(isim = c("Star Wars",
                               "Jumanji",
                               "Pitch Perfect 3",
                               "Greatest Showman",
                               "Ferdinand"),
                      hasılat = c(71565498,
                                  36169328,
                                  19928525,
                                  8805843,
                                  7316746))

# Veri setini inceleyelim
# Veri setini inceleyelim

# Bar-plot çizmek için "geom_bar()" katmanını kullanmamız gerekiyor:
library(ggplot2)
ggplot(filmler, aes(x = isim, y = hasılat)) +
  geom_bar()

# Yukarıda yer alan kodda geom_bar() katmanında stat argümanını belirtmediğimiz için bir hata aldık.
# stat argümanı genellikle "identity" veya "count" seçeneği ile kullanılıyor.
ggplot(filmler, aes(x = isim, y = hasılat)) +
  geom_bar(stat = "identity")

# stat argümanının "count" seçeneği veri setinde kesikli bir değişken yer alması durumunda kullabılabilir. 
# Aksi taktirde bu seçeneği kullandığınızda hata ile karşılaşacaksınız.
ggplot(filmler, aes(x = isim, y = hasılat)) +
  geom_bar(stat = "count") 

# Yukarıda yer alan grafikte y ekseninde yer alan değerlerin farklı bir formatta olduğunu göreceksiniz.
# Örneğin, 2e+07 = 2 x 10^7 şeklinde ondalık forma dönüştürülür. Eksende yer alan tüm değerleri ondalık
# forma dönüştürmemiz daha okunaklı bir grafik elde etmemizi sağlar. 
ggplot(filmler, aes(x = isim, y = hasılat)) +
  geom_bar(stat = "identity") + 
  scale_y_continuous(labels = scales::comma)

# Bu grafiğin daha kolay okunabilmesi için yapmamız gereken bir diğer işlem, çubukları uzunluklarına göre
# artan ya da azalan düzende sıralamaktır. Mesajın içeriğine uygun olarak hangisini seçeceğimize karar
# verebiliriz.
ggplot(filmler, aes(x = reorder(isim, +hasılat), y = hasılat)) +
  geom_bar(stat = "identity")

# Çubukları sıralamak için kullandığımız reorder() fonksiyonu ile y eksenindeki etiket değerlerinin formunu
# değiştirmek için kullandığımız çözümün hata mesajına neden olduğunu görecekseniz. Bu sorunun çözümü için 
# aşağıdaki çözümü kullanabilirsiniz:
ggplot(filmler, aes(x = reorder(isim, +hasılat), y = hasılat)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

# Gördüğünüz gibi ortaya çıkan bir sorunun birden fazla çözümü olabilmekte, bazı durumlarda tüm çözümler işe 
# yarayamayabilmektedir. Bu gibi sorunlar ile karşılaştığınızda ilk başvuracağınız kaynağın Google, ya da 
# stackoverflow.com olduğunu unutmayınız.

# Oluşan bu grafikte son yapmamız gereken işlem eksen başlıklarının düzenlenmesi ve grafik başlığının 
# eklenmesidir.
ggplot(filmler, aes(x = reorder(isim, +hasılat), y = hasılat)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) + 
  labs(x = "Film",
       y = "Hasılat ($)",
       title = "22-24 Aralık 2017 Tarihlerinde En Çok Hasılat Yapan Filmler",
       caption = "Veri Kaynağı: Box Office Mojo") + 
  theme_bw()

# Bu gibi grafiklerde karşılaşabileceğiniz en önemli sorun kategorik değişkenin yer aldığı eksende çubuk
# etiketlerinin çok uzun olmasından dolayı, üst üste binmeleri ve okunmalarının zorlaşması durumudur. 
# Bu sorunun çözümü için ilk akla gelen ve kötü bir pratik olan çubuk etiketlerinin 45 ya da 90
# derece döndürülmesi okunmalarını zorlaştırmaktadır.
ggplot(filmler, aes(x = reorder(isim, +hasılat), y = hasılat)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) + 
  labs(x = "Film",
       y = "Hasılat ($)",
       title = "22-24 Aralık 2017 Tarihlerinde En Çok Hasılat Yapan Filmler",
       caption = "Veri Kaynağı: Box Office Mojo") + 
  theme_bw() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  

# Bunun yerine eksenlerin yerlerini değiştirmek, grafiğin okunmasını zorlaştırmamak adına daha iyi 
# bir çözümdür.
ggplot(filmler, aes(x = reorder(isim, +hasılat), y = hasılat)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) + 
  labs(x = "Film",
       y = "Hasılat ($)",
       title = "22-24 Aralık 2017 Tarihlerinde En Çok Hasılat Yapan Filmler",
       caption = "Veri Kaynağı: Box Office Mojo") + 
  coord_flip() +
  theme_bw()

# ---------------------------------------------------------------------------
# Wilke'nin kitabında sayfa 49'da yer alan US median income verisinin görselleştirilmesi
# ---------------------------------------------------------------------------
# Öncelikle US_income_age veri setinde yer alan sürekli 'age' değişkenini kategorik bir değişkene
# dönüştürelim. Bunun için within() fonksiyonunu kullanabiliriz.

US_age_cat <- within(US_income_age, {   
  age.cat <- NA 
  age.cat[25 <= age & age <= 34] <- "25-34"
  age.cat[35 <= age & age <= 44] <- "35-44"
  age.cat[45 <= age & age <= 54] <- "45-54"
  age.cat[55 <= age & age <= 64] <- "55-64"
  age.cat[65 <= age & age <= 74] <- "65-74"})

final_US_income <- US_age_cat %>% 
  drop_na() %>% 
  group_by(age.cat) %>% 
  summarise(moi = median(income))

ggplot(final_US_income, aes(x = age.cat, y = moi)) + 
  geom_bar(stat = "identity")

# Yukarıda yer alan grafiğin öncesinde veriyi hazırlarken drop_na() fonksiyonu kullanmadan, 
# yani eksik gözlem değerlerini dışarıda bırakmadan çizmeyi denersek, x ekseninde NA isminde 
# bir çubuğun ortaya çıktığını göreceksiniz.

# Grafik üzerinde bir kaç düzenleme ile son şeklini vermemiz gerekiyor:
ggplot(final_US_income, aes(x = age.cat, y = moi)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Yaş",
       y = "Medyan Gelir ($)",
       title = "Amerika Hanehalkının Yaş Aralıklarına Göre 2016 Yılı Medyan Geliri",
       caption = "Veri Kaynağı: US Census Bureau (https://github.com/clauswilke/dviz.supp/blob/master/data/US_income_age.rda)") + 
  theme_bw()

# Eğer yukarıdaki grafiği, bir önceki örnektekine benzer şekilde çubukları temsil ettikleri 
# değerlere göre artan ya da azalan düzende sıralamayı denersek, sıralı bir kategorik değişkene 
# dönüştürdüğümüz yaş üzerinden yorum yapmak zorlaşır. Yaşın artışına ya da azalışına bağlı gelir
# değişimi üzerinden çıkarım yapmak güçleşir. 
# Ancak bu durum her zaman geçerli olmayabilir. Her ne kadar ilgili değişken sıralı ve kategorik 
# olsada yapısına aykırı olarak sıralama işlemini vermek istediğimiz mesaja göre yapabiliriz. Bu
# durum ile pratikte çok sık karşılaşmayacağımız konusunda sizleri uyarmak isterim.

ggplot(final_US_income, aes(x = reorder(age.cat, +moi), y = moi)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Yaş",
       y = "Medyan Gelir ($)",
       title = "Amerika Hanehalkının Yaş Aralıklarına Göre 2016 Yılı Medyan Geliri",
       caption = "Veri Kaynağı: US Census Bureau (https://github.com/clauswilke/dviz.supp/blob/master/data/US_income_age.rda)") + 
  theme_bw()

# Aynı veri seti üzerinde Gruplandırılmış çubuk grafiği uygulaması yapalım.
# Bunun için yine bir veri hazırlığına girişmemiz gerekiyor. Gruplandırmayı ele alacağımız bazı
# eyaletler üzerinden yapalım. filter() fonksiyonu ile eyaletlere karşılık gelen gözlemleri seçebilir,
# sonrasında group_by() ile yaş ve eyaletlere göre gruplanmış veriler için medyan geliri hesaplayarak,
# görselleştirmek için kullanacağımız veriye ulaşırız.
final_US_income2 <- US_age_cat %>% 
  drop_na() %>% 
  filter(state %in% c("Michigan", "Colorado", "Virginia", "Texas")) %>%
  group_by(age.cat, state) %>% 
  summarise(moi = median(income))

# Gruplandırılmış çubuk grafiği çizmek için, iki argüman kullanmamız gerekiyor. aes() içerisinde 
# gruplandırmayı yapacağımız değişkeni 'fill' argümanını kullanarak belirtmeli ve geom_bar() 
# katmanında 'position' argümanının "dodge" değerine eşlemeliyiz. 
ggplot(final_US_income2, aes(x = age.cat, y = moi, fill = state)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  labs(x = "Yaş",
       y = "Medyan Gelir ($)",
       fill = "Eyalet",
       title = "Amerika Hanehalkının Yaş Aralıklarına Göre 2016 Yılı Medyan Geliri",
       caption = "Veri Kaynağı: US Census Bureau (https://github.com/clauswilke/dviz.supp/blob/master/data/US_income_age.rda)") + 
  theme_bw()

# reorder() fonksiyonu ile yaş gruplarını artan ya da azalan düzeyde sıralayabiliriz.
ggplot(final_US_income2, aes(x = reorder(age.cat, +moi), y = moi, fill = state)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  labs(x = "Yaş",
       y = "Medyan Gelir ($)",
       fill = "Eyalet",
       title = "Amerika Hanehalkının Yaş Aralıklarına Göre 2016 Yılı Medyan Geliri",
       caption = "Veri Kaynağı: US Census Bureau (https://github.com/clauswilke/dviz.supp/blob/master/data/US_income_age.rda)") + 
  theme_bw()

# Ya da facet_wrap() katmanını kullanarak istenilen bir değişkene göre çok panelli bir grafik elde edebilirsiniz.
ggplot(final_US_income2, aes(x = age.cat, y = moi)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Yaş",
       y = "Medyan Gelir ($)",
       fill = "Eyalet",
       title = "Amerika Hanehalkının Yaş Aralıklarına Göre 2016 Yılı Medyan Geliri",
       caption = "Veri Kaynağı: US Census Bureau (https://github.com/clauswilke/dviz.supp/blob/master/data/US_income_age.rda)") +
  facet_wrap(~final_US_income2$state) + 
  theme_bw()

# Aynı veri seti üzerinde Yığılmış çubuk grafiği uygulaması yapalım.
# Burada gruplandırılmış çubuk grafiği için hazırladığımız veri setini kullanabiliriz:
# Grafiği çizebilmek için ise yapmamız gereken farklı tek işlem geom_bar() katmanında
# yer alan 'position' argümanını "stack" olarak belirtmektir.
ggplot(final_US_income2, aes(x = age.cat, y = moi, fill = state)) + 
  geom_bar(stat = "identity", position = "stack") + 
  labs(x = "Yaş",
       y = "Medyan Gelir ($)",
       fill = "Eyalet",
       title = "Amerika Hanehalkının Yaş Aralıklarına Göre 2016 Yılı Medyan Geliri",
       caption = "Veri Kaynağı: US Census Bureau (https://github.com/clauswilke/dviz.supp/blob/master/data/US_income_age.rda)") + 
  theme_bw()

# ---------------------------------------------------------------------------
# Nokta Grafiği Uygulamaları
# ---------------------------------------------------------------------------
# Bu bölümdeki uygulamalar için "US_income_age" veri setini kullanacağız.
# Nokta grafiğinden önce çubuk grafiği çizerek başlayalım.

final_US_income3 <- US_income_age %>%
  drop_na() %>%
  group_by(state) %>%
  summarise(ortalama_gelir = mean(income))

ggplot(final_US_income3, aes(x = ortalama_gelir, y = state)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Ortalama Gelir ($)",
       y = "Eyalet",
       fill = "Eyalet",
       title = "Amerika Hanehalkının Eyaletlere Göre 2016 Yılı Ortalama Geliri",
       caption = "Veri Kaynağı: US Census Bureau (https://github.com/clauswilke/dviz.supp/blob/master/data/US_income_age.rda)") + 
  theme_bw()

# Grafiği okumak güç olduğu için çubukları aldıkları değerlere uygun olarak sıralamak gerekiyor.
ggplot(final_US_income3, aes(x = ortalama_gelir, y = reorder(state, +ortalama_gelir))) + 
  geom_bar(stat = "identity") + 
  labs(x = "Medyan Gelir ($)",
       y = "Eyalet",
       fill = "Eyalet",
       title = "Amerika Hanehalkının Eyaletlere Göre 2016 Yılı Ortalama Geliri",
       caption = "Veri Kaynağı: US Census Bureau (https://github.com/clauswilke/dviz.supp/blob/master/data/US_income_age.rda)") + 
  theme_bw()

# Bu grafik üzerinde şu ana kadar gördüğümüz tüm gerekli düzenlemeleri yapmamıza rağmen, eyaletlerin
# birbirine oldukça yakın değerler alması ve sık uzun çubuklar iyi bir görüntü (ayırt edilebilir) 
# oluşturmamaktadır. Bu gibi durumlarda bar-plot yerine nokta grafiği kullanmak daha iyi bir 
# seçimdir. Nokta grafiği oluşturmak için geom_point() katmanını kullanabiliriz.
ggplot(final_US_income3, aes(x = ortalama_gelir, y = reorder(state, +ortalama_gelir))) + 
  geom_point() + 
  labs(x = "Medyan Gelir ($)",
       y = "Eyalet",
       fill = "Eyalet",
       title = "Amerika Hanehalkının Eyaletlere Göre 2016 Yılı Ortalama Geliri",
       caption = "Veri Kaynağı: US Census Bureau (https://github.com/clauswilke/dviz.supp/blob/master/data/US_income_age.rda)") + 
  theme_bw()






