-- - Reconstruction de la base de donnees                                     ---
-- ------------------------------------------------------------------------------
DROP DATABASE IF EXISTS pet_shop;
CREATE DATABASE pet_shop;
USE pet_shop;


-- -----------------------------------------------------------------------------
-- - Construction de la table des utilisateurs                               ---
-- -----------------------------------------------------------------------------
CREATE TABLE T_Users (
	IdUser				int(4)		PRIMARY KEY AUTO_INCREMENT,
	Login				varchar(120)	NOT NULL,
	Password			varchar(120)	NOT NULL,
	Email			    varchar(120)	NOT NULL,
	Phone			    int(20)	NOT NULL,
	Company			    varchar(20)	,
	Adress			varchar(20)	NOT NULL
) ENGINE = InnoDB;

CREATE TABLE T_Pets(
    IdPet             int(4)		PRIMARY KEY AUTO_INCREMENT,
    Name              varchar(120)	NOT NULL,
    Type              varchar(120)	NOT NULL,
    Picture           varchar(120)	NOT NULL,
    Description       varchar(500)	NOT NULL,
    Details            varchar(1000)	NOT NULL,
    Price             int(25)        NOT NULL,
    Advices           varchar(1000)	
    
)ENGINE = InnoDB;
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 1, 'Longhaired persian','Cat','images/cat/Longhaired persian/Longhaired_persian.jpg',
'Docile et affectueux, le chat persan est l’une des races les plus populaires, d’autant que c’est un chat d’intérieur extraordinaire.',
'Comme tous les chats à poils longs, il faut le brosser régulièrement pour empêcher sa fourrure de s’emmêler. La robe des chats persans vient dans une grande gamme de coloris, mais si vous vous intéressez aux persans à fourrure blanche et yeux bleus, méfiez-vous: ces traits sont souvent des indices de surdité.',
"Persian's coat
Even though the Persian's silky coat captivates with its majestic appearance, you should never forget that long-haired cats need a lot of care! To prevent their hair from tangling, Persians should be brushed thoroughly, ideally daily, using a brush or cat comb. If the Persian's coat is very matted, talk to your veterinarian. Does your cat's coat need to be shaved because of knots? Don't worry, this one grows back very quickly! During the Persian's moulting period, this cat loses an impressive amount of hair, despite regular and thorough brushing. Malt paste and catnip can then promote natural removal of swallowed hair and prevent blockages by cleaning your Persian companion's stomach.
The watery eyes of the Persian
With a short, flattened nose, Persians often need their owner’s help to clean their eyes and nose area. Usually a damp cloth is sufficient. Chamomile products or other scented products may irritate the eye area."
,100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 2, 'Somali','Cat','images/cat/somali/somali.jpg',
'The Somali is moderate looking in all aspects with smooth planes on her head. She has a gentle dip in the triangular head. Her rather large ears sit tilted forward giving her an alert, aware look as if she is always paying attention to everything. The eyes, which look large in the face, show the alertness and intelligence inherent in the breed.',
"The coat on the Somali is full with exaggerated tufts of hair in the ears. The fur is soft without being woolly and the tail is fluffy like a fox's tail. The coloring of the Somali is special. The majority of the fur has bands of color on each individual hair, with the coat looking darker along the spine line. The color on the body softens and lightens under the neck and the underside of the cat and the insides of the legs. She has a wild look about her, but is not at all extreme except in the color of the fur, which carries bands of color giving her a richness and depth not seen in other breeds.",
"Le Somali est très facile à vivre et n’a pas besoin de soins particuliers. Son pelage mi-long n’est pas salissant, et grâce à sa faible quantité de sous poils, les maîtres n’ont recours à la brosse ou au peigne pour chat seulement une seule fois par semaine.

Une nourriture de haute qualité présentant une teneur importante en protéines saines est essentielle pour la santé de votre Somali ! En tant que carnivores, les chats ne peuvent supporter qu’une faible quantité de glucides. C’est en consommant de la viande de qualité, par exemple dans les boîtes et sachets pour chat, qu’ils assimilent les protéines et les nutriments nécessaires.

Ne faites pas l’impasse sur la visite annuelle chez le vétérinaire ! Elle est essentielle, surtout si votre Somali s’aventure en extérieur. Cette visite sera l’occasion de discuter avec votre vétérinaire des éventuels soucis de santé de votre chat. Vous pouvez vous faire conseiller d’éventuelles vaccinations ou antiparasitaires pour chat."
,100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 3, 'Bulldog','Dog','images/dogs/bouledogue/bouldogue.jpg',
'With his short, stocky body, the French Bulldog gives the impression of being a tight ball of muscle on all fours. Its weight of between 8 and 14 kg is distributed over approximately 30 cm in height at the withers.',
" What is striking about this dog are its bat ears erect on its angular head, as well as its short muzzle and small tail. Its shiny coat without undercoat comes in many colors ranging from common hues like black or white to fawn, cream or brindle.",
"Like all mastiffs, the French Bulldog needs authority. It is then very easy to educate him. Above all, don't give in to his charm and don't let him get away with it when he does something stupid. You will then have a dog that obeys you without making any difficulties. If you don't want him to climb into your bed, no exceptions should be made, even if he is still a puppy. Otherwise, it will become more complicated to make him change his habits.

By staying constant and through several small sessions of a few minutes - the attention span of a young French Bulldog is not high - you will quickly teach your puppy the most important basic commands. A dog club can be a useful partner in the education and socialization of your puppy."
,100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 4, 'Golden retriever','Dog','images/dogs/golden retriever/Golden_retriever.jpg',
'The Golden Retriever is a medium-sized dog, often considered the perfect family companion, as it is very affectionate towards children. ',
" He is known to be docile and very attached to those around him. Dogs of the Golden Retriever breed need to exercise themselves physically and for their owner to take care of their plush coats.",
"Unfortunately,this rapid infatuation has had negative consequences. Non-professional 'breeders' who wanted to make a quick buck from their small puppies were breeding dogs with no idea of the health of the animals.As a result of these breeding methods,breed-specific diseases developed, which some dogs still suffer from today.By carrying out a targeted genetic selection as well as by putting in place strict breeding conditions,the risk of disease development is reduced."
,100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 5, 'The lion head dwarf ','Rabbit','images/rabbit/le lapain lionhead/lionhead.jpg',
"The lion head dwarf rabbit is a very popular rabbit.It is a very young breed, which appeared in the late 80's, early 90's, ",
" where rabbits were selected with fairly long head hairs and short body hairs.",
"Dwarf lion head rabbits can be kept in shelters large enough to thrive. The size of the cage for two rabbits should be at least 150 x 60 x 50 cm. Before adopting your new friend, you must prepare for his arrival, for example by already buying a transport cage, some toys, food, and of course a shelter."
,100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 6, 'Canary ','Bird','images/bird/canary/canary.jpg',
"The canary has been a favorite among bird keepers for hundreds of years, and has been bred into more than 200 breeds, much like dogs have, each breed prized for a particular skill or appearance. ",
" Canary enthusiasts are among the most passionate of the bird keepers — they need more than a little zeal to master the hundreds of canary types, each with its own special traits. Canaries are bred for three basic characteristics: song, color, or type (appearance), though the male bird in each of these types will sing.",
"Housing for any bird is an important factor for keeping it healthy, but proper housing for the canary is essential for keeping it happy and singing. Also, each canary should have its own cage, or the result could be deadly. Canaries are territorial and do not like to be housed together. Canaries can live more than 14 years with proper care.

Birdseed is not enough to keep a canary in its prime. A nutritious canary diet should consist of pellets, such as  Lafeber Premium Daily Diet Pellets for Canaries."
,100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 7, 'Goldfish','Fish','images/fish/redfish/redfish.jpg',
'The famous goldfish is without a doubt the first species we think of when looking for a fish to adopt. ',
"Goldfish are naturally calm and harmless. The particularity of the goldfish is that it is a peerless eater. He literally only thinks of food. It can wreak havoc in your aquarium by pulling up plants in search of food.",
" Contrary to what many people think when putting them in a tiny, ball-shaped aquarium, goldfish need space to thrive. The ideal place is obviously an outdoor pool. If this is not the case, the fish can quickly become deformed and die.

It is a freshwater fish. The water should be changed regularly at 20%. Likewise, the walls of the aquarium and the bottom should be cleaned to remove excrement. Likewise, the filter should be cleaned at least once a week to purify the water and allow it to live in a healthy environment.

Goldfish are omnivorous. It can very well be satisfied with pellets, vegetables and greens. As the fish is greedy, it is necessary all the same to take care to give it a reasonable quantity at the rate of 2 times per day. It is recommended to invest in pellets that meet the specific needs of goldfish. Every week, you can slip small pieces of vegetables and living organisms into his aquarium."
,100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 8, 'Hamster ','Mouse','images/mouse/hamster/hamster.jpg',
"Small rodent of the Cricetidae family, the hamster will make you crack with its round face.",
"Solitary and rather autonomous, the hamster is a lively, fun and playful rodent who will be particularly pleasant to see evolving in his cage. Its life expectancy is 2 to 4 years.",
"If we take a closer look at the characteristics of the hamster, it quickly becomes apparent that their needs are not always compatible with those of children. While most children dream of having their own pet to play with and cuddle with, hamsters want peace and quiet during the day and prefer not to be disturbed.
Hamsters are not suitable as pets for young children who like to put their small animal on their little wooden train or take it for a walk in their doll stroller. On the other hand, older children who already take their pet's needs into account and go to bed later will have a lot of fun with this little rascal."
,100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 9, "Hermann's tortoise ",'Turtle',"images/turtle/Hermann's tortoise/Hermann's tortoise.jpg",
"Hermann's turtles are ideal for beginners. They are very autonomous turtles and have a very good sense of direction.",
"If you leave them in your garden, they can feed on leaves, flowers, fruits, worms and even snails on their own. They have a life expectancy of around 40 years. Enough to keep you busy for several years.",
"If housed outside, daytime temperatures should average around 80 F to 86 F (27 C to 30 C) and shouldn't fall below 65 F to 70 F (18 C to 21 C) at night. Mimic these temperatures in an indoor enclosure. Lighting will be your primary source of heating for indoor enclosures. Whether inside or outside, it is also necessary to have a cool, shaded area for your tortoise to escape the heat. Make sure the water pan that you provide is deep enough for your pet to immerse its whole body in case it wants to cool off."
,100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 10, "Transport cage",'Cat',"images/cat/Transport_Cage.jpg",
"For all your trips, regardless of the length of the journey, for the safety of your cat or your dog, place your pet in a transport cage.",
"En voiture votre chien ou votre chat peut être fortement agité, se sentir mal, prendre un choc en cas de freinage brusque. Par mesure de sécurité votre animal de compagnie ne doit pas se promener librement dans l'habitacle de votre véhicule.

La Cage de transport Capri est proposée en plusieurs tailles, chacune assure la sécurité de votre chien ou de votre chat.

Pour son confort et pour le rassurer n'oubliez pas son coussin, son jouet favoris et sa gamelle pour s'hydrater ou s'alimenter en cas de besoin.","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 11, "Cat Food ",'Cat',"images/cat/food.jpg","Dry cat food offering a 100% complete and balanced diet. For adult cats."," Selection of meat with pockets and real chicken nuggets. 4 kg bag.","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 12,"Dog Food",'Dog',"images/dogs/food.jpg","Dry dog food,enriched with vitamins and proteins,extruded,monocolour."," With the inclusion of raw materials adapted to your dog's nutritional balance.","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 13,"Dog Plate",'Dog',"images/dogs/plate.jpg","
Stainless Steel Dog Plate Metal Pet Dog Feeder Puppy Food Drinking Water Large Dog Bowls + Non-Slip Mat, 22cm","","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 14,"Rabbit Food",'Rabbit',"images/rabbit/food.jpg","Supreme Petfoods Russel Rabbit Tasty Mix Rabbit Food Mix for Small Animals"," ","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 15,"Rabbit Cage",'Rabbit',"images/rabbit/cage.jpg","Oxford Cloth Rabbit Hutch Cover Double Layer Rabbit Cage Dust Cover Waterproof Pet House Protective Cover Furniture Cover"," ","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 16,"Aquarium",'Fish',"images/fish/aquarium.jpg","L’ensemble d’aquarium Tetra 10 gallons (18,93 litres) à LED offre tout ce dont vous avez besoin pour devenir un aquariophile à succès. Que vous soyez débutant ou confirmé, cet aquarium a tout ce dont vos poissons ont besoin pour vivre une vie heureuse et saine!"," ","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 17,"Tetra Goldfish Fish Food 1 L",'Fish',"images/fish/food.jpg","Give your fish a complete feed to keep them in top shape for years to come in your aquarium."," ","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 18,"Hamster Food",'Mouse',"images/mouse/food.jpg","As part of the family, a good quality diet is just as important for your pet as it is for the rest of the household. have all the essentials for your pet to live a happy and healthy life. With vitamin-fortified pellets and a blend of wholesome grains, vegetables, and fruits.
"," ","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 19,"Hamster Cage",'Mouse',"images/mouse/cage.jpg","the assembly is simple, and it is really very functional. Thanks to the floors the hamster has much more space and possibilities than in a simple cage."," Really this cage meets all our expectations, it is practical to clean since it is enough to lift everything up, everything comes together, it is very well made since it does not take up too much space but at the same time thanks to the several floors all the space is used and the hamster really has a lot of room to grow.","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 20,"Tortoise and Turtle Pet Supplies",'Turtle',"images/turtle/cage.jpg","have a tortoise or a turtle in your house. You can’t rush things with these little guys."," So they’re a great pet to have if you want to slow your pace down after hectic hours at work, or simply if you love pet reptiles. In case you don’t know, however, tortoises and turtles are different; thus, they have distinct needs in terms of housing and other pet supplies.","",100);
INSERT INTO T_Pets (IdPet, Name, Type,Picture,Description,Details,Advices,Price) VALUES ( 21,"Turtle Food",'Turtle',"images/turtle/food.jpg","It contains all protein, vitamins and minerals to promote growth ","and keep turtles in healthy condition The size and shape of this food is specially designed to meet the habit of the turtles and it can be easily eaten and does not cloud the water","",100);


SELECT * FROM T_Users;