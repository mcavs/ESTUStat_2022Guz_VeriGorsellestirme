# ---------------------------------------------------------------------------
# Veri Görselleştirme
# 25.11.2022
# Zaman Serilerinin Görselleştirilmesi
# ---------------------------------------------------------------------------install.packages("ggplot2")
# gerekli paketler
library(ggplot2)
library(dplyr)
# ---------------------------------------------------------------------------
# Zaman serisinin görselleştirilmesi
# Nokta grafiği
# ---------------------------------------------------------------------------

# preprint verisetinde yer alan yalnızca "bioRxiv" arşivinin 6 Eylül 2013
# tarihi sonrasındaki verileri kullanılım:
preprint_bio <- preprint %>%
  filter(archive == "bioRxiv") %>%
  filter(date > "2013-09-06")

# Nokta grafiği oluşturmak için geometri katmanını geom_point olarak 
# kullanalım:
ggplot(preprint_bio, aes(x = date, y = count)) +
  geom_point(color = "dodgerblue3") + 
  labs(x = "year",
       y = "preprints/month") + 
  theme_classic() # bu katman arka planı sadeleştirmek için kullanılmıştır.
                  #

# ---------------------------------------------------------------------------
# Zaman serisinin görselleştirilmesi
# Nokta + çizgi grafiği
# ---------------------------------------------------------------------------
ggplot(preprint_bio, aes(x = date, y = count)) +
  geom_point(color = "dodgerblue3") + 
  geom_line(color = "dodgerblue3") +
  labs(x = "year",
       y = "preprints/month") + 
  theme_classic()


# ---------------------------------------------------------------------------
# Zaman serisinin görselleştirilmesi
# Çizgi grafiği
# ---------------------------------------------------------------------------
ggplot(preprint_bio, aes(x = date, y = count)) +
  geom_line(color = "dodgerblue3") +
  labs(x = "year",
       y = "preprints/month") + 
  theme_classic()

# ---------------------------------------------------------------------------
# Zaman serisinin görselleştirilmesi
# Çizgi + alan grafiği
# ---------------------------------------------------------------------------
ggplot(preprint_bio, aes(x = date, y = count)) +
  geom_line(color = "deepskyblue4", size = 1.4) +
  theme_classic() +
  geom_area(fill = "deepskyblue") +
  labs(x = "year",
       y = "preprints/month") 

# ---------------------------------------------------------------------------
# Birden fazla zaman serisinin görselleştirilmesi
# Nokta grafiği
# ---------------------------------------------------------------------------

# Bu bölümde ise yine aynı tarih sonrasındaki 3 farklı arşive ilişkin verileri
# kullanılım:
preprint_arc3 <- preprint %>%
  filter(archive %in% c("bioRxiv", "PeerJ Preprints", "arXiv q-bio")) %>%
  filter(date > "2013-09-06")

# Farklı arşivleri belirtmek için renk estetiğini kullanabiliriz. Bunun 
# için aes içerisindeki color argümanına ilgili değişkeni eşleyelim:
ggplot(preprint_arc3, aes(x = date, y = count, color = archive)) +
  geom_point() +
  theme_classic() +
  labs(x = "year",
       y = "preprints/month",
       color = "") # bazı durumlarda lejant başlığı kullanmamız gerekmez.


# ---------------------------------------------------------------------------
# Birden fazla zaman serisinin görselleştirilmesi
# Nokta + çizgi grafiği
# ---------------------------------------------------------------------------
ggplot(preprint_arc3, aes(x = date, y = count, color = archive)) +
  geom_point() +
  geom_line() +
  theme_classic() +
  labs(x = "year",
       y = "preprints/month",
       color = "") 


# ---------------------------------------------------------------------------
# Birden fazla zaman serisinin görselleştirilmesi
# Çizgi grafiği
# ---------------------------------------------------------------------------
ggplot(preprint_arc3, aes(x = date, y = count, color = archive)) +
  geom_line() +
  theme_classic() +
  labs(x = "year",
       y = "preprints/month",
       color = "") 

# ---------------------------------------------------------------------------
# Birden fazla zaman serisinin görselleştirilmesi
# alt alta facet grafik oluşturma
# ---------------------------------------------------------------------------

# Facet türü grafikler birden fazla grubu aynı grafik üzerinde
# çizmek yerine alt alta, yan yana ya da ızgara düzeninde farklı
# grafikler şeklinde çizmemize imkan sağlar. 

# Facet türü grafik çizebilmek için ggplot fonksiyonuna facet_grid
# katmanını eklememiz gerekiyor. Sonrasında ise hangi kategorik değişkene
# göre facet düzeni oluşturmak istediğimizi katman içerisinde belirtmemiz
# gerekiyor. Eğer katman içerisinde rows argümanını kullanırsak grafikleri
# yan-yana, cols argümanını kullanırsak alt-alta düzende oluşturabiliriz.

ggplot(preprint_arc3, aes(x = date, y = count)) +
  geom_line() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  labs(x = "year",
       y = "preprints/month") +
  facet_grid(rows = vars(archive))


# ---------------------------------------------------------------------------
# yan yana facet grafik düzeni
# ---------------------------------------------------------------------------
# Facet grafikleri yan yana sıralamak için facet_grid()
# fonksiyonu içerisinde ilgili değişkeni col argümanında
# belirtmemiz gerekiyor:

ggplot(preprint_arc3, aes(x = date, y = count)) +
  geom_line() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  labs(x = "year",
       y = "preprints/month") +
  facet_grid(cols = vars(archive))


# ---------------------------------------------------------------------------
# Trendin Görselleştirilmesi
# ---------------------------------------------------------------------------
#

ggplot(preprint_bio, aes(x = date, y = count)) +
  geom_line() +
  geom_smooth(se = FALSE) +
  labs(x = "year",
       y = "preprints/month") + 
  theme_classic()


# ---------------------------------------------------------------------------
# Trendin Pürüzsüzleştirilmesinin Görselleştirilmesi
# pürüzsüzlüğün ayarlanması
# ---------------------------------------------------------------------------

ggplot(preprint_bio, aes(x = date, y = count)) +
  geom_line() +
  geom_smooth(se = FALSE,
              span = 0.3) +
  labs(x = "year",
       y = "preprints/month") + 
  theme_classic()


# ---------------------------------------------------------------------------
# Birden fazla zaman serisi için
# Trendin Pürüzsüzleştirilmesinin Görselleştirilmesi
# ---------------------------------------------------------------------------

ggplot(preprint_arc3, aes(x = date, y = count, color = archive)) +
  geom_line() +
  geom_smooth(se = FALSE) +
  theme_classic() +
  labs(x = "year",
       y = "preprints/month",
       color = "") 


