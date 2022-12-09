#######################################################################################
##            {harrypotter} paketi ile metin görselleştirme uygulaması               ##
#######################################################################################

# Bu uygulama Bradley Boehmke'nin Text-Mining-Tutorials 
# (https://github.com/bradleyboehmke/Text-Mining-Tutorials) ismindeki kaynaklarından 
# derlenmiştir.

# Metin madenciliği yapmak için temel gereksinim, metninizi düzenli bir biçimde elde 
# etmek ve kelime frekans analizi yapmaktır. Metin genellikle yapılandırılmamış bir 
# formattadır, bu nedenle en temel analizin gerçekleştirilmesi bile biraz yeniden 
# yapılanma gerektirir. Bu nedenle, bu ilk metin madenciliği öğreticisi, metin 
# düzenlemenin temellerini ve temel kelime sıklığı analizini kapsar.

# Bu eğitim, temel metin madenciliğine giriş niteliğindedir. İlk olarak, bu eğitimde 
# analizi çoğaltmak için gereken verileri ve paketleri sağlıyorum ve ardından 
# yapılandırılmamış metni düzenlemek ve kelime sıklığı analizi yapmak için temel 
# işlemleri adım adım anlatıyorum.

# 1. Metin düzenleme: Metni düzenli bir veri yapısına dönüştürme
# 2. Kelime sıklığı analizi: Metindeki en yaygın sözcükleri belirleme
# 3. Duygu analizi: Metindeki sözcüklere karşılık gelen duyguları belirleme

# Bu öğretici, [`harrypotter` paketinde](https://github.com/bradleyboehmke/harrypotter) 
# sağlanan verilerden yararlanır. Bu paketi, metin madenciliği ve analiz yeteneklerini 
# göstermek için Harry Potter serisinin ilk yedi romanını sağlamak üzere oluşturdum. 
# "harrypotter" paketini aşağıdakilerle yükleyebilirsiniz:

library(devtools)
devtools::install_github("bradleyboehmke/harrypotter")
library(harrypotter)

library(tidyverse)      # veri manipülasyonu ve görselleştirme
library(stringr)        # metin temizleme ve düzenli ifadeler
library(tidytext)       # ek metin madenciliği fonksiyonları içerir
library(harrypotter)    # Harry Potter serisinin ilk yedi romanını içeren paket

# Üzerinde çalıştığımız ve 'harrypotter' paketi tarafından sağlanan yedi roman şunları içerir:

# 1. `philosophers_stone`: Harry Potter and the Philosophers Stone, published in 1997
# 2. `chamber_of_secrets`: Harry Potter and the Chamber of Secrets, published in 1998
# 3. `prisoner_of_azkaban`: Harry Potter and the Prisoner of Azkaban, published in 1999
# 4. `goblet_of_fire`: Harry Potter and the Goblet of Fire, published in 2000
# 5. `order_of_the_phoenix`: Harry Potter and the Order of the Phoenix, published in 2003
# 6. `half_blood_prince`: Harry Potter and the Half-Blood Prince, published in 2005
# 7. `deathly_hallows`: Harry Potter and the Deathly Hallows, published in 2007

# Her metin, her öğenin tek bir bölümü temsil ettiği bir karakter vektörü içindedir. 
# Örneğin, aşağıda "philosophers_stone" ilk iki bölümünün ham metnini gösterilmektedir:

philosophers_stone[1:2]

#######################################################################################
##                               1. Metin düzenleme                                  ##
#######################################################################################

# Bu karakter vektörü üzerinde bazı basit regex analizleri yapabilsek de, bu metni 
# düzgün bir şekilde analiz etmek için onu bir veri çerçevesine veya data.frame'e 
# dönüştürmek istiyoruz. Bunu "philosophers_stone" romanında yapmak için aşağıdakileri 
# gerçekleştirebiliriz:

text_ps <- data.frame(chapter = seq_along(philosophers_stone),
                      text = philosophers_stone)

# Yukarıda, 2 sütunlu bir data.frame oluşturulmuştur. İkinci sütun, her bölümün tam 
# metnini içerir; ancak, bu gelecekteki analizler için pek elverişli değildir. 
# Bu metinleri tokenize edebiliriz:

tokens_ps <- text_ps %>% 
  unnest_tokens(word, text)

# Şimdi tüm "philosophers_stone" metnini, her bölümdeki her kelimeyi sağlayan bir 
# data.frame'e ayırdık. "unnest_token" işlevinin aşağıdakileri yaptığına dikkat etmek 
# önemlidir:

# - metni kelimelere böler 
# - tüm noktalama işaretlerini kaldırır
# - kolay karşılaştırılabilirlik için her kelimeyi küçük harfe dönüştürür 
# (bunu kapatmak için 'to_lower = FALSE' argümanını kullanın)

# Bu, şimdi "filozof_taşı" metni üzerinde bazı basit analizler yapmamızı sağlıyor; 
# ancak, yedi romanın tamamındaki metni analiz etmek istersek ne olur? Bunu yapmak 
# için, aynı adımları her romanda dolaşarak ve ardından birleştirerek 
# gerçekleştirebiliriz.

titles <- c("Philosopher's Stone", 
            "Chamber of Secrets", 
            "Prisoner of Azkaban",
            "Goblet of Fire", 
            "Order of the Phoenix", 
            "Half-Blood Prince",
            "Deathly Hallows")

books <- list(philosophers_stone, 
              chamber_of_secrets, 
              prisoner_of_azkaban,
              goblet_of_fire, 
              order_of_the_phoenix, 
              half_blood_prince,
              deathly_hallows)

series <- data.frame()
for(i in seq_along(titles)) {
  
  clean <- data.frame(chapter = seq_along(books[[i]]),
                      text = books[[i]]) %>%
    unnest_tokens(word, text) %>%
    mutate(book = titles[i]) %>%
    select(book, everything())
  series <- rbind(series, clean)
}

series$book <- factor(series$book, levels = rev(titles))
series

# Artık her bir kelimeyi kitap bölüm bölüm içeren düzenli bir data.frame'imiz var. 
# Şimdi bazı basit kelime sıklık analizleri yapmaya devam edebiliriz.

#######################################################################################
##                        2. Kelime sıklığı analizi                                  ##
#######################################################################################

# En basit kelime sıklığı analizi, metinde en çok kullanılan kelimeleri 
# değerlendirmektir. Harry Potter serisindeki tüm metindeki en yaygın 
# kelimeleri değerlendirmek için "sayı" kullanabiliriz.
series %>%
  count(word, sort = TRUE)

# Fark edeceğiniz bir şey, en sık kullanılan kelimelerin çoğunun çok 
# bilgilendirici olmadığıdır (yani *the, and, to, of, a, he, ...*). 
# Bunlar __stop__ kelimeleri olarak kabul edilir. Çoğu zaman metin 
# madenciliğimizin bağlam sağlayan kelimeleri tanımlamasını isteriz 
# (örn. *harry, dumbledore, granger, korkmuş,* vb.). Böylece `anti_join` 
# ve 'tidytext` tarafından sağlanan yerleşik `stop_words` veri seti ile 
# stop word'leri tibble'ımızdan kaldırabiliriz. Artık bu seride yaygın 
# olmasını beklediğimiz karakterleri ve diğer isimleri, fiilleri ve 
# sıfatları görmeye başlıyoruz.
words <- series %>%
  anti_join(stop_words) %>%
  filter(book == "Prisoner of Azkaban") %>%
  count(word, sort = TRUE) 

# Kelime bulutu oluşturmak için {wordcloud2} paketinde yer alan
# wordcloud2() fonksiyonunu kullanabiliriz:
wordcloud2(words, shuffle = FALSE)





# Aynı değerlendirmeyi kitaba ve hatta her kitaptaki her bölüme göre 
# gruplandırarak da yapabiliriz.
series %>%
  anti_join(stop_words) %>%
  group_by(book) %>%
  count(word, sort = TRUE) %>%
  top_n(10)

# Bunu şu şekilde görselleştirebiliriz:
# library(ggplot2)
series %>%
  anti_join(stop_words) %>%
  group_by(book) %>%
  count(word, sort = TRUE) %>%
  top_n(10) %>%
  ungroup() %>%
  mutate(book = factor(book, levels = titles),
         text_order = nrow(.):1) %>%
  ggplot(aes(reorder(word, text_order), n, fill = book)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ book, scales = "free_y") +
  labs(x = "NULL", y = "Frequency") +
  coord_flip() +
  theme(legend.position="none")

# Şimdi, tüm Harry Potter serisindeki her bir kelimenin her bir kitap 
# içindeki sıklığını hesaplayalım. Bu, tüm seriyle karşılaştırıldığında 
# her kitaptaki kelime sıklığındaki güçlü sapmaları karşılaştırmamıza 
# izin verecektir.

# tüm romanlarda kelime kullanımının yüzdesini hesapla
potter_pct <- series %>%
  anti_join(stop_words) %>%
  count(word) %>%
  transmute(word, all_words = n / sum(n))

# her romanda kelime kullanımının yüzdesini hesapla
frequency <- series %>%
  anti_join(stop_words) %>%
  count(book, word) %>%
  mutate(book_words = n / sum(n)) %>%
  left_join(potter_pct) %>%
  arrange(desc(book_words)) %>%
  ungroup()

frequency

# Bunu şu şekilde görselleştirebiliriz:
ggplot(frequency, aes(x = book_words, y = all_words, color = abs(all_words - book_words))) +
  geom_abline(color = "gray40", lty = 2) +
  geom_jitter(alpha = 0.1, size = 2.5, width = 0.3, height = 0.3) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 1.5) +
  scale_x_log10(labels = scales::percent_format()) +
  scale_y_log10(labels = scales::percent_format()) +
  scale_color_gradient(limits = c(0, 0.001), low = "darkslategray4", high = "gray75") +
  facet_wrap(~ book, ncol = 2) +
  theme(legend.position="none") +
  labs(y = "Harry Potter Series", x = NULL)

# Bu olay örgülerinde çizgiye yakın kelimeler tüm romanlarda benzer frekanslara 
# sahiptir. Örneğin, "harry", "ron", "dumbledore" gibi kelimeler oldukça 
# yaygındır ve kitapların çoğunda benzer sıklıkta kullanılır. Satırdan uzak 
# kelimeler, bir metin grubunda diğerinden daha fazla bulunan kelimelerdir. 
# Dahası, çizginin üzerinde öne çıkan kelimeler dizide ortaktır, ancak o kitapta
# yoktur; oysa çizginin altındaki kelimeler söz konusu kitapta ortaktır, ancak 
# dizide yaygın değildir. Örneğin, Melez Prens'te "cedric" çizginin üzerinde 
# öne çıkıyor. Bu, "cedric"in tüm Harry Potter serisinde oldukça yaygın olduğu, 
# ancak Melez Prens'te o kadar fazla kullanılmadığı anlamına gelir. Buna karşılık,
# Felsefe Taşı'ndaki "quirrell" gibi çizginin altındaki bir kelime, bu kelimenin 
# bu romanda yaygın olduğunu, ancak dizide çok daha az yaygın olduğunu düşündürür.

# Bir korelasyon testi kullanarak bu kelime sıklıklarının ne kadar benzer ve 
# farklı olduğunu ölçelim. Tüm seri ile her bir kitap arasındaki kelime sıklıkları 
# ne kadar ilişkilidir?

frequency %>%
  group_by(book) %>%
  summarize(correlation = cor(book_words, all_words),
            p_value = cor.test(book_words, all_words)$p.value)

#######################################################################################
##                                 2. Duygu analizi                                  ##
#######################################################################################

# Metindeki fikir veya duyguyu değerlendirmek için var olan çeşitli sözlükler vardır. 
# "tidytext" paketi, "sentiments" veri kümesinde üç duygu sözlüğü içerir.

sentiments

# Üç sözlük:
# - `AFINN` from (http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010)
# - `bing` from (https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html)
# - `nrc` from (http://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm)

# Bu sözlüklerin üçü de unigramlara (veya tek kelimelere) dayanmaktadır. Bu sözlükler 
# pek çok İngilizce kelime içerir ve kelimelere olumlu/olumsuz duygu ve ayrıca muhtemelen 
# neşe, öfke, üzüntü vb. duygular için puanlar atanır. "nrc" sözlüğü, kelimeleri ikili 
# bir tarzda ("evet"/"hayır") pozitif, negatif, öfke, beklenti, iğrenme, korku, neşe, 
# üzüntü, sürpriz ve güven kategorilerine ayırır. "bing" sözlüğü, kelimeleri ikili bir 
# tarzda pozitif ve negatif kategorilere ayırır. "AFINN" sözlüğü, sözcükleri -5 ile 5 
# arasında değişen bir puanla atar; negatif puanlar olumsuz duyguyu ve pozitif puanlar 
# olumlu duyguyu gösterir. Tüm bu bilgiler "duygular" veri kümesinde tablo haline 
# getirilir ve "tidytext", bu sözlükte kullanılmayan sütunlar olmadan belirli duygu 
# sözlüklerini almak için bir "get_sentiments()" işlevi sağlar.
get_sentiments("afinn")
get_sentiments("bing")
get_sentiments("nrc")

# install.packages("textdata")
# library(textdata)

# Şimdi Harry Potter serisinde temsil edilen farklı duyguları değerlendirmek için 
# "nrc" duygu veri setini kullanalım. Pozitiften daha güçlü bir negatif varlığın 
# olduğunu görebiliriz.

series %>%
  right_join(get_sentiments("nrc")) %>%
  filter(!is.na(sentiment)) %>%
  count(sentiment, sort = TRUE)

# Bu, genel olarak iyi bir anlam veriyor, ancak ya duygunun her roman boyunca nasıl değiştiğini anlamak istiyorsak? Bunu yapmak için aşağıdakileri gerçekleştiriyoruz:
  
# 1. her kitabı 500 kelimeye bölen bir dizin oluşturun; bu, her iki sayfadaki yaklaşık kelime sayısıdır, dolayısıyla bu, bölümler içinde bile duygulardaki değişiklikleri değerlendirmemize izin verecektir.
# 2. her kelimenin olumlu ve olumsuz duyarlılığını değerlendirmek için "bing" sözlüğünü "inner_join" ile birleştirin
# 2. Her iki sayfada kaç tane pozitif ve negatif kelime olduğunu sayın"
# 3. verilerimizi yaymak ve...
# 4. net bir duyarlılık hesaplayın (pozitif - negatif)
# 5. verilerimizi çizin

series %>%
  group_by(book) %>% 
  mutate(word_count = 1:n(),
         index = word_count %/% 500 + 1) %>% 
  inner_join(get_sentiments("bing")) %>%
  count(book, index = index , sentiment) %>%
  ungroup() %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative,
         book = factor(book, levels = titles)) %>%
  ggplot(aes(index, sentiment, fill = book)) +
  geom_bar(alpha = 0.5, stat = "identity", show.legend = FALSE) +
  facet_wrap(~ book, ncol = 2, scales = "free_x")

# Artık her romanın olay örgüsünün, öykünün gidişatı üzerinde nasıl daha 
# olumlu ya da olumsuz duygulara doğru değiştiğini görebiliriz.




