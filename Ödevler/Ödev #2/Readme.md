# Ödev 2

Yalnızca atandığınız (**Case 1:** AGC, ZAS, BT, BNA, ABÖ; **Case 2:** BYÖ, Sİ, BÜ, SÖ, MK; **Case 3:** DRB, RK, SUO, HK, ES; **Case 4:** BŞ, MG, MD, KD, CU) Case üzerindeki gerekli çalışmaları yaptığınız, "İsimSoyisim.pdf" şeklinde isimlendirdiğiniz ve Quarto kullanarak hazırladığınız raporunuzu Perşembe günü saat 23:59'a kadar bu klasöre yüklemeniz gerekmektedir.

**Case 1)** `DALEX` paketinde bulunan `apartments` veri setini kullanarak aşağıda istenen görselleştirme çalışmalarını gerçekleştiriniz:
  
  * Bölgelere (`district`) göre evlerin ortalama metre kare (`m2.price`) fiyatlarını görselleştiriniz ve yorumlayınız.
  * Bölgelere (`district`) göre evlerin ortalama metre kare (`m2.price`) fiyatlarının, evde yer alan oda sayısına (`no.rooms`) nasıl bir değişim gösterdiğini görselleştirerek araştırınız ve yorumlayınız.
 
 
 **Case 2)** `carData` paketinde bulunan `Salaries` veri setini kullanarak aşağıda istenen görselleştirme çalışmalarını gerçekleştiriniz:
 
  * Akademik ünvana (`district`) göre ortalama maaş (`salary`) miktarını görselleştiriniz ve yorumlayınız.
  * Akademik ünvana (`district`) göre ortalama maaş (`salary`) miktarının, cinsiyet (`sex`) göre nasıl bir değişim gösterdiğini görselleştirerek araştırınız ve yorumlayınız.


 **Case 3)** `MASS` paketinde bulunan `Insurance` veri setini kullanarak aşağıda istenen görselleştirme çalışmalarını gerçekleştiriniz:
 
  * Yaşa (`Age`) göre ortalama poliçe sayısını (`Claims`) görselleştiriniz ve yorumlayınız.
  * Yaşa (`Age`) göre ortalama poliçe sayısının (`Claims`), araç motor hacmine (`Group`) göre nasıl bir değişim gösterdiğini görselleştirerek araştırınız ve yorumlayınız.


**Case 4)** `rpart` paketinde bulunan `cu.summary` veri setini kullanarak aşağıda istenen görselleştirme çalışmalarını gerçekleştiriniz:
 
  * Araç tipine (`Type`) göre ortalama araç fiyatını (`Price`) görselleştiriniz ve yorumlayınız.
  * Araç tipine (`Type`) göre ortalama araç fiyatının (`Price`), aracın güvenilirlik (`Reliability`) düzeyine göre nasıl bir değişim gösterdiğini görselleştirerek araştırınız ve yorumlayınız.


## Bazı Önemli İpuçları

* Görselleştirme sırasında kullandığınız kategorik değişkenin `factor` tipinde bir R değişkeni olduğundan emin olmanız gerekmektedir. Bunu `class(değişken)` komutu ile konsol üzerinden kontrol edebilirsiniz. 
* Veri üzerinde yapmanız gereken ön işlemler için [3.hafta R alıştırmaları](https://github.com/mcavs/ESTUStat_2022Guz_VeriGorsellestirme/blob/main/Al%C4%B1%C5%9Ft%C4%B1rmalar/VG_al%C4%B1s%CC%A7t%C4%B1rma_h3.R)na göz atabilirsiniz. 


