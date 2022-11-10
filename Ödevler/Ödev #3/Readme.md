# Ödev 3

Yalnızca atandığınız Case üzerindeki gerekli çalışmaları yaptığınız, "İsimSoyisim.pdf" şeklinde isimlendirdiğiniz ve Quarto kullanarak hazırladığınız raporunuzu 16 Kasım Perşembe günü saat 23:59'a kadar bu klasöre yüklemeniz gerekmektedir.

**Case 1)** NBA Stats - Veri kaynağı: [https://www.kaggle.com/datasets/vivovinco/20222023-nba-player-stats-regular](https://www.kaggle.com/datasets/vivovinco/20222023-nba-player-stats-regular)

* Pozisyonlarına göre oyuncuların yaş dağılımını veri görselleştirme yöntemleriyle araştırınız.  Yaş dağılımı en çarpık olan pozisyonu araştırınız.

* Pozisyonlarına göre oyuncuların attıklarını sayıların dağılımını veri görselleştirme yöntemleriyle araştırınız. En dengeli sayı dağılımının gözlendiği pozisyon hangisidir? 

* Oyuncuların pozisyonlarına göre serbest atış yüzdelerinin dağılımını araştırınız. Serbest atış yüzdesi en düşük olan oyuncular hangi pozisyonda oynamaktadırlar?

 
 
**Case 2)** Data Science Salary - [https://www.kaggle.com/datasets/whenamancodes/data-science-fields-salary-categorization](https://www.kaggle.com/datasets/whenamancodes/data-science-fields-salary-categorization)

* Tecrübe düzeylerine göre veri bilimi pozisyonları aylık maaşlarının dolar karşılığı bazında dağılımını araştırınız.

* Firma büyüklüğüne ve tecrübe düzeyine göre aylık maaş tutarı dağılımlarını araştırınız. Tecrübesiz adaylar için çalışmaya başlamak için en uygun firma ölçeği hangisidir?

* Uzaktan çalışma yüzdesi sistemine göre yıllık maaş ücreti dağılımlarının değişimini araştırınız.


**Case 3)** Bestseller books - [https://www.kaggle.com/datasets/sootersaalu/amazon-top-50-bestselling-books-2009-2019](https://www.kaggle.com/datasets/sootersaalu/amazon-top-50-bestselling-books-2009-2019)

* Yıllara göre en çok satan kitapların fiyat dağılımının değişimini araştırınız.

* Yıllara göre en çok satan kitapların aldıkları okuyucu puanı dağılımının değişimini araştırınız.

* Türüne göre kitap fiyatlarının dağılımını araştırınız. 


**Case 4)** Pokemon - [https://www.kaggle.com/datasets/kingabzpro/pokmon-legendary-data](https://www.kaggle.com/datasets/kingabzpro/pokmon-legendary-data)

* Jenerasyonlarına göre pokemonların atak güçlerinin dağılımını araştırınız.

* Jenerasyon ve efsane olup olmadıklarına göre atak güçlerinin dağılımını araştırınız.

* Jenerasyonlarına göre hızlarının dağılımını araştırınız. En hızlı jenerasyonu belirleyiniz.


**Case 5)** 


**Case 6)** 


**Case 7)** 


**Case 8)** 



## Bazı Önemli İpuçları

* Lütfen yorumlarınıza, ödev başlığı ve alt başlıklarınıza özen gösteriniz. Daha iyi yorum yapabilmek için, öncelikle veri setini tanımanız gerektiğini unutmayınız. Google üzerinde aratarak, veri seti hakkında detaylı bilgi edinebilirsiniz.
* R üzerinden bir paketten veri çağırmak için öncelikle paketi yükleyip `install.packages("paket_ismi")`, sonrasında paketi çağırıp `library(paket_ismi)` ve son adımda veri setini çağırmanız `data(verisetinin_ismi)` gerekmektedir. Enviroment ekranında verisetini gördüğünüzden emin olunuz.
* Görselleştirme sırasında kullandığınız kategorik değişkenin `factor` tipinde bir R değişkeni olduğundan emin olmanız gerekmektedir. Bunu `class(değişken)` komutu ile konsol üzerinden kontrol edebilirsiniz. Eğer değilse `ggplot()` fonksiyonunda değişkeni kullandığınız yerde `factor(değişken)` şeklinde kullanmalısınız. 
* Veri üzerinde yapmanız gereken ön işlemler için [3.hafta R alıştırmaları](https://github.com/mcavs/ESTUStat_2022Guz_VeriGorsellestirme/blob/main/Al%C4%B1%C5%9Ft%C4%B1rmalar/VG_al%C4%B1s%CC%A7t%C4%B1rma_h3.R)na göz atabilirsiniz. 
* Herhangi bir sorun ile karşılaşmanız durumunda öncelikle **Google**'layabilir, ikinci seçenek olarak `Issues` bölümü üzerinden yardım isteyebilir (buradaki sorulara hep birlikte yanıt arar, bildiklerimizi yanıtlarsak çok memnun olurum), son seçenek olarak bana e-mail ile ulaşabilirsiniz.



