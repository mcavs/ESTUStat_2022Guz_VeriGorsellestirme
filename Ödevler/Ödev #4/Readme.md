# Ödev 4

İpuçları için [buraya](https://github.com/mcavs/ESTUStat_2022Guz_VeriGorsellestirme/issues/10) göz atabilirsiniz. 

(1) Özet bölümü, (2) atanan case'ler yer alan veri setinin tanıtımını içeren bir bölüm ve (3) case'lerde yer alan araştırma sorularının her biri bir bölüm olacak şekilde hazırladığınız (bu bölümlerde kullanılan kodlar, grafik ve grafiğe ilişkin işe yarar, özenli yorumlar yer almalı), Quarto kullanarak hazırladığınız ve "İsimSoyisim" şeklinde isimlendirdiğiniz PDF veya HTML formatındaki raporunuzu 27 Kasım Pazar günü saat 23:59'a kadar bu klasöre yüklemeniz gerekmektedir.

**OPSİYONEL**: Ödeviniz ile ilgili R kodları, çıktıları ve grafik yorumlarını içeren **(opsiyonel olarak)** hazırlayacağınız GitHub reposunu ödevinize eklemeniz durumunda, ayrıca geri bildirim yapacağımın altını çizmek isterim. 

## Atamalar

SÖ - 6, 2, 3; BYÖ - 2, 7, 8; KD - 10, 6, 2; AGC - 1, 7, 9; MG - 11, 10, 1; MD - 3, 7, 2; BT - 4, 6, 5; DRB - 10, 11, 1; ZAS - 3, 11, 7; BÜ - 2, 11, 3; HK - 8, 7, 2; Sİ - 6, 3, 11; RK - 3, 5, 9; Listede ismi bulunmayanlar herhangi 3 case'i seçip ödevlerini hazırlayabilirler.


## Case'ler

**1. NBA oyuncu istatistikleri** - Veri kaynağı: [https://www.kaggle.com/datasets/vivovinco/20222023-nba-player-stats-regular](https://www.kaggle.com/datasets/vivovinco/20222023-nba-player-stats-regular)

* Pozisyonlarına göre oyuncu sayılarını (attıkları sayılar değil) veri görselleştirme yöntemleriyle araştırınız. Tüm oyuncular arasında en yüksek ve en düşük orana sahip olan pozisyonları belirtiniz.

* Atılan sayıların oyuncuların oynadıkları pozisyonlarına göre oranını veri görselleştirme yöntemleriyle araştırınız. Tüm oyuncular arasında en fazla ve en az sayı atan oyuncuların oynadıkları pozisyonları belirtiniz? 

* Atılan sayıların oyuncuların pozisyonlarına ve yaş gruplarına (1. grup: 19-23, 2. grup: 24-28 yaş, 3.grup: 28-32 yaş, 4.grup: 32+ yaş) göre oranını araştırınız. Tüm oyuncular arasında en fazla ve en az sayı atan yaş grubu ve pozisyonu belirleyiniz.

 
**2. Veri bilimci maaşları** - [https://www.kaggle.com/datasets/whenamancodes/data-science-fields-salary-categorization](https://www.kaggle.com/datasets/whenamancodes/data-science-fields-salary-categorization)

* Tecrübelerine göre veri bilimci sayılarının oranını veri görselleştirme yöntemleriyle araştırınız. Veri bilimciler arasında en yüksek ve en düşük orana sahip tecrübe düzeylerini belirtiniz.

* Veri bilimcilerinin çalışma sistemine göre oranlarını veri görselleştirme yöntemleriyle araştırınız. 

* Firma büyüklüğüne ve tecrübe düzeyine göre veri bilimci sayılarının oranını araştırınız. Tecrübesiz ve tecrübeli veri bilimcilerin sayıca en fazla ve en az çalıştıkları firma büyüklüklerini belirtiniz.


**3. En çok satan kitaplar** - [https://www.kaggle.com/datasets/sootersaalu/amazon-top-50-bestselling-books-2009-2019](https://www.kaggle.com/datasets/sootersaalu/amazon-top-50-bestselling-books-2009-2019)

* En çok satan kitapların türlerine göre oranlarını veri görselleştirme yöntemleriyle araştırınız. 

* En çok satan kitapların türlerine  ve kullanıcı reytingine (iki gruba ayırınız: 4 puan altı ve üstü) göre oranlarını veri görselleştirme yöntemleriyle araştırınız. 


**4. Pokemon çizgi filmi** - [https://www.kaggle.com/datasets/kingabzpro/pokmon-legendary-data](https://www.kaggle.com/datasets/kingabzpro/pokmon-legendary-data)

* Tiplerine göre pokemonların oranlarını veri görselleştirme yöntemleriyle araştırınız. 

* Jenerasyon ve efsane olup olmadıklarına göre pokemonların oranlarını veri görselleştirme yöntemleriyle araştırınız. 


**5. Game of Thrones dizisi** – [https://www.kaggle.com/datasets/rezaghari/game-of-thrones](https://www.kaggle.com/datasets/rezaghari/game-of-thrones)

* Başrol (Star1) oyuncularının oranlarını veri görselleştirme yöntemleriyle araştırınız. 

* Başrol (Star2) oyuncularının oranlarını reyting değelerlerine göre (iki gruba ayırınız: 8 puan altı ve üstü) veri görselleştirme yöntemleriyle araştırınız. 

* Başrol (Star3) oyuncularının oranlarını reyting değelerlerine göre (iki gruba ayırınız: 8 puan altı ve üstü) veri görselleştirme yöntemleriyle araştırınız. 


**6. Breaking Bad dizisi** - https://www.kaggle.com/datasets/varpit94/breaking-bad-tv-show-all-seasons-episodes-data

* Bölümlerin yazar sayısına göre oranlarını veri görselleştirme yöntemleriyle araştırınız.

* Bölümlerin yazar sayısına ve reyting puanlarına (iki gruba ayırınız: 9 puan altı ve üstü) göre oranlarını veri görselleştirme yöntemleriyle araştırınız.


**7. Marvel filmleri** - https://www.kaggle.com/datasets/jcraggy/marvel-vs-dc-imdb-rotten-tomatoes

* Filmlerin türlerine göre oranlarına veri görselleştirme yöntemleriyle araştırınız. (Her bir türü grafikte ayrı ayrı kullanınız, oranları iki veya daha fazla tür üzerinden etiketlemeyiniz.)

* Filmlerin türlerine ve uzunluklarına (iki gruba ayırınız: 120 dakika altı ve üstü) göre oranlarına veri görselleştirme yöntemleriyle araştırınız. (Her bir türü grafikte ayrı ayrı kullanınız, oranları iki veya daha fazla tür üzerinden etiketlemeyiniz.)


**8. Avengers karikatür karakterleri*** - https://www.kaggle.com/datasets/mmmarchetti/avengers

* Karakterlerin cinsiyetlerine göre oranını veri görselleştirme yöntemleriyle araştırınız.

* Karakterlerin cinsiyetlerine ve ölüm durumlarına (yalnızca Death1) göre oranını veri görselleştirme yöntemleriyle araştırınız.


**9. Türk TV dizileri** - https://www.kaggle.com/datasets/emreokcular/turkish-tv-series

* Dizilerin türlerine göre oranlarına veri görselleştirme yöntemleriyle araştırınız. (Her bir türü grafikte ayrı ayrı kullanınız, oranları iki veya daha fazla tür üzerinden etiketlemeyiniz.)

* Dizilerin türlerine ve sezon sayılarına (iki gruba ayırınız: 1 sezon ve 1 sezondan fazla) göre oranlarına veri görselleştirme yöntemleriyle araştırınız. (Her bir türü grafikte ayrı ayrı kullanınız, oranları iki veya daha fazla tür üzerinden etiketlemeyiniz.)


**10. FIFA 23 Oyuncuları** - https://www.kaggle.com/datasets/1898257a1915cbd22dd226f16c66dc218dfb65fd6f062755f4d0243bb8365a99

* Oyuncu sayılarının en iyi oynadıkları pozisyona göre oranlarını veri görselleştirme yöntemleriyle araştırınız.

* Oyuncu sayılarının kontrat sürelerine (contract until) göre oranlarını veri görselleştirme yöntemleriyle araştırınız.

* Oyuncu sayılarının en iyi oynadıkları pozisyona ve kullandıkları ayaklarına göre oranlarını veri görselleştirme yöntemleriyle araştırınız.


**11. Harry Potter Karakterleri** - https://www.kaggle.com/datasets/gulsahdemiryurek/harry-potter-dataset (Characters.csv dosyasını kullanınız.)

* Karakterlerin cinsiyetlerine göre oranını veri görselleştirme yöntemleriyle araştırınız.

* Karakterlerin evlerine göre oranını veri görselleştirme yöntemleriyle araştırınız.

* Karakterlerin evlerine ve muggle olması (iki gruba ayırınız: muggle ve diğerleri) durumlarına göre oranını veri görselleştirme yöntemleriyle araştırınız.


## Notlandırma

* Özet - 10 puan,
* Her case - 30 puan,
* Her casede veri tanıtımı - 6 puan,
* Her casedeki soru başına - (24 / soru sayısı) puan,
* Yorum içermeyen grafikler notlandırılmayacaktır.


## Bazı Önemli İpuçları

* Grafiklerin tümüyle (evet eksenler ve lejant dahil olmak üzere) Türkçe olmasına özen gösteriniz. 

* Yorumların yüzeysel olmaması, grafikten bilgi çıkaracak nitelikte olması önemlidir. Aksi taktirde yorumlanın bir anlamı olmaz.

* Kolay okunur bir rapor oluşturabilmek için düzenli başlık kullanmaktan ve yeni sayfaya geçmekten çekinmeyin.

* Grafikleri oluştururuken karşılaşabileceğiniz bazı sorunların çözümlerini için gereken ipuçlarını [burada](https://github.com/mcavs/ESTUStat_2022Guz_VeriGorsellestirme/issues/9) bulabilirsiniz.

* OPSİYONEL bölüm ile ilgili gerekli açıklamaları derste paylaşıyorum/paylaşacağım.

* Herhangi bir sorun ile karşılaşmanız durumunda öncelikle **Google**'layabilir, ikinci seçenek olarak `Issues` bölümü üzerinden yardım isteyebilir (buradaki sorulara hep birlikte yanıt arar, bildiklerimizi yanıtlarsak çok memnun olurum), son seçenek olarak bana e-mail ile ulaşabilirsiniz.




