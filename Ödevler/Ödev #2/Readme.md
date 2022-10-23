# Ödev 2

Yalnızca atandığınız (**Case 1:** AGC, ZAS, BT, BNA, ABÖ; **Case 2:** BYÖ, Sİ, BÜ, SÖ, MK; **Case 3:** DRB, RK, SUO, HK, ES; **Case 4:** BŞ, MG, MD, KD, CU) Case üzerindeki gerekli çalışmaları yaptığınız, "İsimSoyisim.pdf" şeklinde isimlendirdiğiniz ve Quarto kullanarak hazırladığınız raporunuzu Perşembe günü saat 23:59'a kadar bu klasöre yüklemeniz gerekmektedir.

**Case 1)** `DALEX` paketinde bulunan `apartments` veri setini kullanarak aşağıda verilen sorulara yanıt olabilecek görselleştirme çalışmalarını gerçekleştiriniz:
  
  * Bölgelere (`district`) göre evlerin ortalama metre kare (`m2.price`) fiyatlarını görselleştiriniz ve yorumlayınız. (20 + 20 puan)
  * Bölgelere (`district`) göre evlerin ortalama metre kare (`m2.price`) fiyatlarının, evde yer alan oda sayısına (`no.rooms`) göre nasıl bir değişim gösterdiğini görselleştirerek araştırınız ve yorumlayınız. (30 + 30 puan)
 
 
 **Case 2)** `carData` paketinde bulunan `Salaries` veri setini kullanarak aşağıda verilen sorulara yanıt olabilecek görselleştirme çalışmalarını gerçekleştiriniz:
 
  * Akademik ünvana (`district`) göre ortalama maaş (`salary`) miktarını görselleştiriniz ve yorumlayınız. (20 + 20 puan)
  * Akademik ünvana (`district`) göre ortalama maaş (`salary`) miktarının, cinsiyete (`sex`) göre nasıl bir değişim gösterdiğini görselleştirerek araştırınız ve yorumlayınız. (30 + 30 puan)


 **Case 3)** `MASS` paketinde bulunan `Insurance` veri setini kullanarak aşağıda verilen sorulara yanıt olabilecek görselleştirme çalışmalarını gerçekleştiriniz:
 
  * Yaşa (`Age`) göre ortalama poliçe sayısını (`Claims`) görselleştiriniz ve yorumlayınız. (20 + 20 puan)
  * Yaşa (`Age`) göre ortalama poliçe sayısının (`Claims`), araç motor hacmine (`Group`) göre nasıl bir değişim gösterdiğini görselleştirerek araştırınız ve yorumlayınız. (30 + 30 puan)


**Case 4)** `rpart` paketinde bulunan `cu.summary` veri setini kullanarak aşağıda verilen sorulara yanıt olabilecek görselleştirme çalışmalarını gerçekleştiriniz:
 
  * Araç tipine (`Type`) göre ortalama araç fiyatını (`Price`) görselleştiriniz ve yorumlayınız. (20 + 20 puan)
  * Araç tipine (`Type`) göre ortalama araç fiyatının (`Price`), aracın güvenilirlik (`Reliability`) düzeyine göre nasıl bir değişim gösterdiğini görselleştirerek araştırınız ve yorumlayınız. (30 + 30 puan)


## Bazı Önemli İpuçları

* Lütfen yorumlarınıza, ödev başlığı ve alt başlıklarınıza özen gösteriniz. Daha iyi yorum yapabilmek için, öncelikle veri setini tanımanız gerektiğini unutmayınız. Google üzerinde aratarak, veri seti hakkında detaylı bilgi edinebilirsiniz.
* R üzerinden bir paketten veri çağırmak için öncelikle paketi yükleyip `install.packages("paket_ismi")`, sonrasında paketi çağırıp `library(paket_ismi)` ve son adımda veri setini çağırmanız `data(verisetinin_ismi)` gerekmektedir. Enviroment ekranında verisetini gördüğünüzden emin olunuz.
* Görselleştirme sırasında kullandığınız kategorik değişkenin `factor` tipinde bir R değişkeni olduğundan emin olmanız gerekmektedir. Bunu `class(değişken)` komutu ile konsol üzerinden kontrol edebilirsiniz. Eğer değilse `ggplot()` fonksiyonunda değişkeni kullandığınız yerde `factor(değişken)` şeklinde kullanmalısınız. 
* Veri üzerinde yapmanız gereken ön işlemler için [3.hafta R alıştırmaları](https://github.com/mcavs/ESTUStat_2022Guz_VeriGorsellestirme/blob/main/Al%C4%B1%C5%9Ft%C4%B1rmalar/VG_al%C4%B1s%CC%A7t%C4%B1rma_h3.R)na göz atabilirsiniz. 
* Herhangi bir sorun ile karşılaşmanız durumunda öncelikle **Google**'layabilir, ikinci seçenek olarak `Issues` bölümü üzerinden yardım isteyebilir (buradaki sorulara hep birlikte yanıt arar, bildiklerimizi yanıtlarsak çok memnun olurum), son seçenek olarak bana e-mail ile ulaşabilirsiniz.


