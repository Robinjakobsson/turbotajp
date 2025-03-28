//
//  WordManager.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//
//hej

import Foundation

class WordManager {
    
    static let shared = WordManager()
    
    private(set) var englishWords : [Word] = [
        Word(word: "Apple", answer: "Äpple"),
        Word(word: "Banana", answer: "Banan"),
        Word(word: "Kiwi", answer: "Kiwi"),
        Word(word: "Car", answer: "Bil"),
        Word(word: "Mouse", answer: "Mus"),
        Word(word: "Orange", answer: "Apelsin"),
        Word(word: "Strawberry", answer: "Jordgubbe"),
        Word(word: "Pineapple", answer: "Ananas"),
        Word(word: "Grapes", answer: "Druvor"),
        Word(word: "Watermelon", answer: "Vattenmelon"),
        Word(word: "Dog", answer: "Hund"),
        Word(word: "Cat", answer: "Katt"),
        Word(word: "Horse", answer: "Häst"),
        Word(word: "Cow", answer: "Ko"),
        Word(word: "Bird", answer: "Fågel"),
        Word(word: "Train", answer: "Tåg"),
        Word(word: "Bicycle", answer: "Cykel"),
        Word(word: "Airplane", answer: "Flygplan"),
        Word(word: "Boat", answer: "Båt"),
        Word(word: "House", answer: "Hus"),
        Word(word: "Door", answer: "Dörr"),
        Word(word: "Window", answer: "Fönster"),
        Word(word: "Table", answer: "Bord"),
        Word(word: "Chair", answer: "Stol"),
        Word(word: "Lamp", answer: "Lampa"),
        Word(word: "Computer", answer: "Dator"),
        Word(word: "Phone", answer: "Telefon"),
        Word(word: "Clock", answer: "Klocka"),
        Word(word: "Sun", answer: "Sol"),
        Word(word: "Moon", answer: "Måne"),
        Word(word: "Star", answer: "Stjärna"),
        Word(word: "Sky", answer: "Himmel"),
        Word(word: "Tree", answer: "Träd"),
        Word(word: "Flower", answer: "Blomma"),
        Word(word: "Grass", answer: "Gräs"),
        Word(word: "Mountain", answer: "Berg"),
        Word(word: "River", answer: "Flod"),
        Word(word: "Lake", answer: "Sjö"),
        Word(word: "Ocean", answer: "Hav"),
        Word(word: "Fish", answer: "Fisk"),
        Word(word: "Bear", answer: "Björn"),
        Word(word: "Wolf", answer: "Varg"),
        Word(word: "Snake", answer: "Orm"),
        Word(word: "Elephant", answer: "Elefant"),
        Word(word: "Lion", answer: "Lejon"),
        Word(word: "Tiger", answer: "Tiger"),
        Word(word: "Monkey", answer: "Apa"),
        Word(word: "Butterfly", answer: "Fjäril"),
        Word(word: "Bee", answer: "Bi"),
        Word(word: "Carrot", answer: "Morot"),
        Word(word: "Potato", answer: "Potatis"),
        Word(word: "Tomato", answer: "Tomat"),
        Word(word: "Cucumber", answer: "Gurka"),
        Word(word: "Onion", answer: "Lök"),
        Word(word: "Milk", answer: "Mjölk"),
        Word(word: "Bread", answer: "Bröd"),
        Word(word: "Cheese", answer: "Ost"),
        Word(word: "Egg", answer: "Ägg"),
        Word(word: "Sugar", answer: "Socker"),
        Word(word: "Salt", answer: "Salt"),
        Word(word: "Pepper", answer: "Peppar"),
        Word(word: "Chocolate", answer: "Choklad"),
        Word(word: "Ice cream", answer: "Glass"),
        Word(word: "Peach", answer: "Persika"),
        Word(word: "Plum", answer: "Plommon"),
        Word(word: "Cherry", answer: "Körsbär"),
        Word(word: "Lemon", answer: "Citron"),
        Word(word: "Pear", answer: "Päron"),
        Word(word: "Blueberry", answer: "Blåbär"),
        Word(word: "Raspberry", answer: "Hallon"),
        Word(word: "Blackberry", answer: "Björnbär"),
        Word(word: "Mango", answer: "Mango"),
        Word(word: "Avocado", answer: "Avokado"),
        Word(word: "Rabbit", answer: "Kanin"),
        Word(word: "Frog", answer: "Groda"),
        Word(word: "Turtle", answer: "Sköldpadda"),
        Word(word: "Fox", answer: "Räv"),
        Word(word: "Deer", answer: "Hjort"),
        Word(word: "Dolphin", answer: "Delfin"),
        Word(word: "Whale", answer: "Val"),
        Word(word: "Shark", answer: "Haj"),
        Word(word: "Octopus", answer: "Bläckfisk"),
        Word(word: "Crab", answer: "Krabba"),
        Word(word: "Bus", answer: "Buss"),
        Word(word: "Truck", answer: "Lastbil"),
        Word(word: "Motorcycle", answer: "Motorcykel"),
        Word(word: "Helicopter", answer: "Helikopter"),
        Word(word: "Submarine", answer: "Ubåt"),
        Word(word: "Roof", answer: "Tak"),
        Word(word: "Wall", answer: "Vägg"),
        Word(word: "Floor", answer: "Golv"),
        Word(word: "Ceiling", answer: "Innertak"),
        Word(word: "Mirror", answer: "Spegel"),
        Word(word: "Shelf", answer: "Hylla"),
        Word(word: "Cupboard", answer: "Skåp"),
        Word(word: "Couch", answer: "Soffa"),
        Word(word: "Bed", answer: "Säng"),
        Word(word: "Pillow", answer: "Kudde"),
        Word(word: "Backpack", answer: "Ryggsäck"),
        Word(word: "Eraser", answer: "Suddgummi"),
        Word(word: "Scissors", answer: "Sax"),
        Word(word: "Marker", answer: "Märkpenna"),
        Word(word: "Sunflower", answer: "Solros"),
        Word(word: "Rose", answer: "Ros"),
        Word(word: "Lily", answer: "Lilja"),
        Word(word: "Tulip", answer: "Tulpan"),
        Word(word: "Daisy", answer: "Prästkrage"),
        Word(word: "Rain", answer: "Regn"),
        Word(word: "Snow", answer: "Snö"),
        Word(word: "Storm", answer: "Storm"),
        Word(word: "Wind", answer: "Vind"),
        Word(word: "Fog", answer: "Dimma"),
        Word(word: "Lightning", answer: "Blixt"),
        Word(word: "Thunder", answer: "Åska"),
        Word(word: "Bread", answer: "Bröd"),
        Word(word: "Rice", answer: "Ris"),
        Word(word: "Pasta", answer: "Pasta"),
        Word(word: "Butter", answer: "Smör"),
        Word(word: "Yogurt", answer: "Yoghurt"),
        Word(word: "Meat", answer: "Kött"),
        Word(word: "Chicken", answer: "Kyckling"),
        Word(word: "Fish", answer: "Fisk"),
        Word(word: "Soup", answer: "Soppa"),
        Word(word: "Salad", answer: "Sallad"),
    ]
    
    private(set) var spanishWords  : [Word] = [
        Word(word: "Agua", answer: "Vatten"),
        Word(word: "Leche", answer: "Mjölk"),
        Word(word: "Pan", answer: "Bröd"),
        Word(word: "Queso", answer: "Ost"),
        Word(word: "Miel", answer: "Honung"),
        Word(word: "Sal", answer: "Salt"),
        Word(word: "Azúcar", answer: "Socker"),
        Word(word: "Carne", answer: "Kött"),
        Word(word: "Pez", answer: "Fisk"),
        Word(word: "Pollo", answer: "Kyckling"),
        Word(word: "Huevo", answer: "Ägg"),
        Word(word: "Fruta", answer: "Frukt"),
        Word(word: "Manzana", answer: "Äpple"),
        Word(word: "Pera", answer: "Päron"),
        Word(word: "Uva", answer: "Druva"),
        Word(word: "Fresa", answer: "Jordgubbe"),
        Word(word: "Limón", answer: "Citron"),
        Word(word: "Nuez", answer: "Nöt"),
        Word(word: "Café", answer: "Kaffe"),
        Word(word: "Té", answer: "Te"),
        Word(word: "Jugo", answer: "Juice"),
        Word(word: "Sopa", answer: "Soppa"),
        Word(word: "Arroz", answer: "Ris"),
        Word(word: "Pasta", answer: "Pasta"),
        Word(word: "Ensalada", answer: "Sallad"),
        Word(word: "Papa", answer: "Potatis"),
        Word(word: "Zanahoria", answer: "Morot"),
        Word(word: "Cebolla", answer: "Lök"),
        Word(word: "Tomate", answer: "Tomat"),
        Word(word: "Pepino", answer: "Gurka"),
        Word(word: "Maíz", answer: "Majs"),
        Word(word: "Mantequilla", answer: "Smör"),
        Word(word: "Harina", answer: "Mjöl"),
        Word(word: "Galleta", answer: "Kaka"),
        Word(word: "Pastel", answer: "Tårta"),
        Word(word: "Helado", answer: "Glass"),
        Word(word: "Chocolate", answer: "Choklad"),
        Word(word: "Mermelada", answer: "Sylt"),
        Word(word: "Aceite", answer: "Olja"),
        Word(word: "Vinagre", answer: "Vinäger"),
        
        ]
    
    private(set) var germanWords : [Word] = [
        Word(word: "Wasser", answer: "Vatten"),
        Word(word: "Milch", answer: "Mjölk"),
        Word(word: "Brot", answer: "Bröd"),
        Word(word: "Käse", answer: "Ost"),
        Word(word: "Honig", answer: "Honung"),
        Word(word: "Salz", answer: "Salt"),
        Word(word: "Zucker", answer: "Socker"),
        Word(word: "Fleisch", answer: "Kött"),
        Word(word: "Fisch", answer: "Fisk"),
        Word(word: "Huhn", answer: "Kyckling"),
        Word(word: "Ei", answer: "Ägg"),
        Word(word: "Obst", answer: "Frukt"),
        Word(word: "Apfel", answer: "Äpple"),
        Word(word: "Birne", answer: "Päron"),
        Word(word: "Traube", answer: "Druva"),
        Word(word: "Erdbeere", answer: "Jordgubbe"),
        Word(word: "Zitrone", answer: "Citron"),
        Word(word: "Nuss", answer: "Nöt"),
        Word(word: "Kaffee", answer: "Kaffe"),
        Word(word: "Tee", answer: "Te"),
        Word(word: "Saft", answer: "Juice"),
        Word(word: "Suppe", answer: "Soppa"),
        Word(word: "Reis", answer: "Ris"),
        Word(word: "Nudeln", answer: "Pasta"),
        Word(word: "Salat", answer: "Sallad"),
        Word(word: "Kartoffel", answer: "Potatis"),
        Word(word: "Karotte", answer: "Morot"),
        Word(word: "Zwiebel", answer: "Lök"),
        Word(word: "Tomate", answer: "Tomat"),
        Word(word: "Gurke", answer: "Gurka"),
        Word(word: "Mais", answer: "Majs"),
        Word(word: "Butter", answer: "Smör"),
        Word(word: "Mehl", answer: "Mjöl"),
        Word(word: "Keks", answer: "Kaka"),
        Word(word: "Kuchen", answer: "Tårta"),
        Word(word: "Eis", answer: "Glass"),
        Word(word: "Schokolade", answer: "Choklad"),
        Word(word: "Marmelade", answer: "Sylt"),
        Word(word: "Öl", answer: "Olja"),
        Word(word: "Essig", answer: "Vinäger"),
    ]
    private(set) var frenchWords : [Word] = [
        Word(word: "Eau", answer: "Vatten"),
        Word(word: "Lait", answer: "Mjölk"),
        Word(word: "Pain", answer: "Bröd"),
        Word(word: "Fromage", answer: "Ost"),
        Word(word: "Miel", answer: "Honung"),
        Word(word: "Sel", answer: "Salt"),
        Word(word: "Sucre", answer: "Socker"),
        Word(word: "Viande", answer: "Kött"),
        Word(word: "Poisson", answer: "Fisk"),
        Word(word: "Poulet", answer: "Kyckling"),
        Word(word: "Oeuf", answer: "Ägg"),
        Word(word: "Fruit", answer: "Frukt"),
        Word(word: "Pomme", answer: "Äpple"),
        Word(word: "Poire", answer: "Päron"),
        Word(word: "Raisin", answer: "Druva"),
        Word(word: "Fraise", answer: "Jordgubbe"),
        Word(word: "Citron", answer: "Citron"),
        Word(word: "Noix", answer: "Nöt"),
        Word(word: "Café", answer: "Kaffe"),
        Word(word: "Thé", answer: "Te"),
        Word(word: "Jus", answer: "Juice"),
        Word(word: "Soupe", answer: "Soppa"),
        Word(word: "Riz", answer: "Ris"),
        Word(word: "Pâtes", answer: "Pasta"),
        Word(word: "Salade", answer: "Sallad"),
        Word(word: "Pomme de terre", answer: "Potatis"),
        Word(word: "Carotte", answer: "Morot"),
        Word(word: "Oignon", answer: "Lök"),
        Word(word: "Tomate", answer: "Tomat"),
        Word(word: "Concombre", answer: "Gurka"),
        Word(word: "Maïs", answer: "Majs"),
        Word(word: "Beurre", answer: "Smör"),
        Word(word: "Farine", answer: "Mjöl"),
        Word(word: "Biscuit", answer: "Kaka"),
        Word(word: "Gâteau", answer: "Tårta"),
        Word(word: "Glace", answer: "Glass"),
        Word(word: "Chocolat", answer: "Choklad"),
        Word(word: "Confiture", answer: "Sylt"),
        Word(word: "Huile", answer: "Olja"),
        Word(word: "Vinaigre", answer: "Vinäger"),
    ]
    
    private(set) var dothrakiWords : [Word] = [
        
        Word(word: "Athdrivar", answer: "Springa"),
        Word(word: "Haji", answer: "Stopp"),
        Word(word: "Anha", answer: "Jag"),
        Word(word: "Yer", answer: "Du"),
        Word(word: "Rhaesh", answer: "Land"),
        Word(word: "Khal", answer: "Ledare"),
        Word(word: "Khaleesi", answer: "Drottning"),
        Word(word: "Khalasar", answer: "Följe"),
        Word(word: "Vezhof", answer: "Häst"),
        Word(word: "Jin", answer: "Det där"),
        Word(word: "Chiftik", answer: "Mask"),
        Word(word: "Fichas", answer: "Smuts"),
        Word(word: "Hoshori", answer: "Läcker"),
        Word(word: "Jano", answer: "Mörk"),
        Word(word: "Oakah", answer: "Hög"),
        Word(word: "Thirar", answer: "Skära"),
        Word(word: "Vezhof", answer: "Häst"),
        Word(word: "Vezhofi", answer: "Hästar"),
        Word(word: "Zaldrīzes", answer: "Drake"),
        Word(word: "Rakh", answer: "Krigare"),
        Word(word: "Athdrivar", answer: "Springa"),
        Word(word: "Vezof", answer: "Svett"),
        Word(word: "Chak", answer: "Sköld"),
        Word(word: "Oqet", answer: "Pil"),
        Word(word: "Torga", answer: "Guld"),
        Word(word: "Thirar", answer: "Skära"),
        Word(word: "Athdrivar", answer: "Springa"),
        Word(word: "Haji", answer: "Stopp"),
        Word(word: "Majin", answer: "Vatten"),
        Word(word: "Vezh", answer: "Stark"),
        Word(word: "Athchomar", answer: "Hälsning"),
        Word(word: "Chek", answer: "Nej"),
        Word(word: "Zhor", answer: "Hjärta"),
    ]
    
    private(set) var rovarspraket: [Word] = [
        
        Word(word: "momajojsos", answer: "Majs"),
        Word(word: "gogurorkoka", answer: "Gurka"),
        Word(word: "Äpoppoplole", answer: "Äpple"),
        Word(word: "BoBrorödod", answer: "Bröd"),
        Word(word: "PoPasostota", answer: "Pasta"),
        Word(word: "Osostot", answer: "Ost"),
        Word(word: "KoKycockoklolinongog", answer: "Kyckling"),
        Word(word: "FoFisoskok", answer: "Fisk"),
        Word(word: "PoPototatotisos", answer: "Potatis"),
        Word(word: "MoMororotot", answer: "Morot"),
        Word(word: "SoSmomöror", answer: "Smör"),
        Word(word: "GoGrorönonsosakokeror", answer: "Grönsaker"),
        Word(word: "DoDjojuror", answer: "Djur"),
        Word(word: "HoHunondod", answer: "Hund"),
        Word(word: "KoKatottot", answer: "Katt"),
        Word(word: "HoHäsostot", answer: "Häst"),
        Word(word: "FoFågogelol", answer: "Fågel"),
        Word(word: "FoFisoskok", answer: "Fisk"),
        Word(word: "KoKo", answer: "Ko"),
        Word(word: "FoFåror", answer: "Får"),
        Word(word: "GoGrorisos", answer: "Gris"),
        Word(word: "ToTigogeror", answer: "Tiger"),
        Word(word: "Elolefofanontot", answer: "Elefant"),
        Word(word: "BoBokok", answer: "Bok"),
        Word(word: "SoStotolol", answer: "Stol"),
        Word(word: "BoBorordod", answer: "Bord"),
        Word(word: "SoSkokrorivovboborordod", answer: "Skrivbord"),
        Word(word: "FoFönonsostoteror", answer: "Fönster"),
        Word(word: "DoDatotoror", answer: "Dator"),
        Word(word: "SoSkokrorivovarore", answer: "Skrivare"),
        Word(word: "MoMobobiloltotelolefofonon", answer: "Mobiltelefon"),
        Word(word: "Boblolomommoma", answer: "Blomma"),
        Word(word: "Bobilolaror", answer: "Bilar")

    ]
    
    private(set) var valyrianWords : [Word] = [
        
        Word(word: "Dracarys", answer: "Eld"),
        Word(word: "Khaleesi", answer: "Drottning"),
        Word(word: "Khal", answer: "Ledare"),
        Word(word: "Vezhvenari", answer: "Hästar"),
        Word(word: "Aōha", answer: "Häst"),
        Word(word: "Rhaegar", answer: "Hjärta"),
        Word(word: "Noreth", answer: "Hav"),
        Word(word: "Zaldrīzes", answer: "Drake"),
        Word(word: "Rhaeshisar", answer: "Följare"),
        Word(word: "Māzho", answer: "Tårar"),
        Word(word: "Vezhof", answer: "Häst"),
        Word(word: "Zaldrīzes", answer: "Drake"),
        Word(word: "Jorrāelagon", answer: "Vän"),
        Word(word: "Vezhof", answer: "Häst"),
        Word(word: "Sovena", answer: "Sova"),
        Word(word: "Zhor", answer: "Hjärta"),
        Word(word: "Sōve", answer: "Skrämma"),
    ]
}
