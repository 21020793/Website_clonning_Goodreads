CREATE DATABASE IF NOT EXISTS DataManagement;
USE DataManagement;
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    rating FLOAT,
    book_description TEXT,
    link_image TEXT,
    date_added DATE DEFAULT CURRENT_DATE,
    publication_date DATE
);
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    account_id INT,
    parent_comment_id INT DEFAULT NULL,
    review_text TEXT,
    rating INT DEFAULT NULL,
    review_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
CREATE TABLE Reading_Lists (
    list_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    list_name VARCHAR(255) NOT NULL,
    date_created DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
CREATE TABLE List_Books (
    list_id INT,
    book_id INT,
    FOREIGN KEY (list_id) REFERENCES Reading_Lists(list_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO books(title, author, genre, rating, book_description, link_image, publication_date) 
VALUES
('The Adventures of Amina al-Sirafi', 'S.A. Chakraborty', 'Historical Fiction', 0, 
"Amina al-Sirafi should be content. After a storied and scandalous career as one of the Indian Ocean’s most notorious pirates, she’s survived backstabbing rogues, vengeful merchant princes, several husbands, and one actual demon to retire peacefully with her family to a life of piety, motherhood, and absolutely nothing that hints of the supernatural.

But when she’s tracked down by the obscenely wealthy mother of a former crewman, she’s offered a job no bandit could refuse: retrieve her comrade’s kidnapped daughter for a kingly sum. The chance to have one last adventure with her crew, do right by an old friend, and win a fortune that will secure her family’s future forever? It seems like such an obvious choice that it must be God’s will.

Yet the deeper Amina dives, the more it becomes alarmingly clear there’s more to this job, and the girl’s disappearance, than she was led to believe. For there’s always risk in wanting to become a legend, to seize one last chance at glory, to savor just a bit more power… and the price might be your very soul.",
"pics/image1.jpg", 20230513),
('Weyward', 'Emilia Hart', "Historical Fiction", 0, 
"I am a Weyward, and wild inside.

2019: Under cover of darkness, Kate flees London for ramshackle Weyward Cottage, inherited from a great aunt she barely remembers. With its tumbling ivy and overgrown garden, the cottage is worlds away from the abusive partner who tormented Kate. But she begins to suspect that her great aunt had a secret. One that lurks in the bones of the cottage, hidden ever since the witch-hunts of the 17th century.

1619: Altha is awaiting trial for the murder of a local farmer who was stampeded to death by his herd. As a girl, Altha’s mother taught her their magic, a kind not rooted in spell casting but in a deep knowledge of the natural world. But unusual women have always been deemed dangerous, and as the evidence for witchcraft is set out against Altha, she knows it will take all of her powers to maintain her freedom.

1942: As World War II rages, Violet is trapped in her family's grand, crumbling estate. Straitjacketed by societal convention, she longs for the robust education her brother receives––and for her mother, long deceased, who was rumored to have gone mad before her death. The only traces Violet has of her are a locket bearing the initial W and the word weyward scratched into the baseboard of her bedroom.

Weaving together the stories of three extraordinary women across five centuries, Emilia Hart's Weyward is an enthralling novel of female resilience and the transformative power of the natural world.",
"pics/image2.jpg", 20230513),
('Still Alice', 'Lisa Genova', 'Fiction', 0,
"Still Alice is a compelling debut novel about a 50-year-old woman's sudden descent into early onset Alzheimer's disease, written by first-time author Lisa Genova, who holds a Ph. D in neuroscience from Harvard University.

Alice Howland, happily married with three grown children and a house on the Cape, is a celebrated Harvard professor at the height of her career when she notices a forgetfulness creeping into her life. As confusion starts to cloud her thinking and her memory begins to fail her, she receives a devastating diagnosis: early onset Alzheimer's disease. Fiercely independent, Alice struggles to maintain her lifestyle and live in the moment, even as her sense of self is being stripped away. In turns heartbreaking, inspiring and terrifying, Still Alice captures in remarkable detail what's it's like to literally lose your mind...",
"pics/image3.jpg", 20230513),
('The Trackers', 'Charles Frazier', 'Historical Fiction', 0,
"From the New York Times bestselling author of Cold Mountain and Varina, a stunning new novel that paints a vivid portrait of life in the Great Depression

Hurtling past the downtrodden communities of Depression-era America, painter Val Welch travels westward to the rural town of Dawes, Wyoming. Through a stroke of luck, he's landed a New Deal assignment to create a mural representing the region for their new Post Office.

A wealthy art lover named John Long and his wife Eve have agreed to host Val at their sprawling ranch. Rumors and intrigue surround the couple: Eve left behind an itinerant life riding the rails and singing in a western swing band. Long holds shady political aspirations, but was once a WWI sniper--and his right hand is a mysterious elder cowboy, a vestige of the violent old west. Val quickly finds himself entranced by their lives.

One day, Eve flees home with a valuable painting in tow, and Long recruits Val to hit the road with a mission of tracking her down. Journeying from ramshackle Hoovervilles to San Francisco nightclubs to the swamps of Florida, Val's search for Eve narrows, and he soon turns up secrets that could spark formidable changes for all of them.

In The Trackers, singular American writer Charles Frazier conjures up the lives of everyday people during an extraordinary period of history that bears uncanny resemblance to our own. With the keen perceptions of humanity and transcendent storytelling that have made him beloved for decades, Frazier has created a powerful and timeless new classic.",
"pics/image10.jpg", 20230513),
('The Only Survivors', 'Megan Miranda', 'Thriller', 0,
"A mystery about a group of former classmates who reunite to mark the tenth anniversary of a tragic accident—only to have one of the survivors disappear, casting fear and suspicion on the original tragedy.",
"pics/image11.jpg", 20230513),
('Small Joy', 'Elvin James Mensah', 'Fiction', 0,
"An unexpected friendship saves a young man's life in this moving, utterly charming debut about chosen family, the winding road to happiness, and the grace of second chances.

Could I one day inspire happiness in others, the same way he seemed to do in me?

It's 2005 and Harley has dropped out of college to move home, back to rural England, where he works a dead-end job at a movie theater. Estranged from his father and finding every attempt at happiness futile, Harley is on the verge of making a devastating final decision. Fortunately for him, things don't go according to plan, and his attempt on his own life is interrupted by his new roommate, Muddy.

Muddy is everything Harley is not: ostensibly heterosexual, freewheeling, confident in his masculinity. Despite their differences, a deep friendship blossoms between them when Muddy takes Harley under his wing and shows him everything that, in his eyes, makes life worth living: bird-watching, karaoke, rugby, and the band Oasis.

But this newfound friendship is complicated. It has enormous repercussions for the pair's romantically entangled friend group--for Chelsea, an overbearing striver whose generosity they begrudgingly rely on; for Finlay, her raffish and uncouth boyfriend; and for Noria, who despite her simmering confidence is smarting from a series of unreturned affections. And then there's the violent affair with an older man that Harley finds himself slipping back into . . .

As secrets and jealousies endanger all that Harley has come to depend on, he finds himself faltering once again, even though he finally has something--and someone--to live for. Soul-stirring and witty, full of hope and peopled with characters who feel like close friends, Small Joys explores a young man's turbulent journey toward happiness and announces the arrival of an exciting voice in fiction.",
"pics/image12.jpg", 20230513),
('Yours Truly', 'Abby Jimenez', 'Romance', 0,
"A novel of terrible first impressions, hilarious second chances, and the joy in finding your perfect match.

Dr. Briana Ortiz’s life is seriously flatlining. Her divorce is just about finalized, her brother’s running out of time to find a kidney donor, and that promotion she wants? Oh, that’s probably going to the new man-doctor who’s already registering eighty-friggin’-seven on Briana’s “pain in my ass” scale. But just when all systems are set to hate, Dr. Jacob Maddox completely flips the game . . . by sending Briana a letter.

And it’s a really good letter. Like the kind that proves that Jacob isn’t actually Satan. Worse, he might be this fantastically funny and subversively likeable guy who’s terrible at first impressions. Because suddenly he and Bri are exchanging letters, sharing lunch dates in her “sob closet,” and discussing the merits of freakishly tiny horses. But when Jacob decides to give Briana the best gift imaginable—a kidney for her brother—she wonders just how she can resist this quietly sexy new doctor . . . especially when he calls in a favor she can’t refuse.",
"pics/image13.jpg", 20230513),
('The Thorn Bird', 'Colleen McCullough', 'Romance', 0,
"The Thorn Birds is a robust, romantic saga of a singular family, the Clearys. It begins in the early part of the 20th century, when Paddy Cleary moves his wife, Fiona, and their seven children to Drogheda, the vast Australian sheep station owned by his autocratic and childless older sister; and it ends more than half a century later, when the only survivor of the third generation, the brilliant actress Justine O'Neill, sets a course of life and love halfway around the world from her roots.

The central figures in this enthralling story are the indomitable Meggie, the only Cleary daughter, and the one man she truly loves, the stunningly handsome and ambitious priest Ralph de Bricassart. Ralph's course moves him a long way indeed, from a remote Outback parish to the halls of the Vatican; and Meggie's except for a brief and miserable marriage elsewhere, is fixed to the Drogheda that is part of her bones - but distance does not dim their feelings though it shapes their lives.

Wonderful characters people this book; strong and gentle, Paddy, hiding a private memory; dutiful Fiona, holding back love because it once betrayed her, violent, tormented Frank, and the other hardworking Cleary sons who give the boundless lands of Drogheda the energy and devotion most men save for women; Meggie; Ralph; and Meggie's children, Justine and Dane. And the land itself; stark, relentless in its demands, brilliant in its flowering, prey to gigantic cycles of drought and flood, rich when nature is bountiful, surreal like no other place on earth.",
"pics/image9.jpg", 20230513),
("Man's Search For Meaning", 'Viktor E. Frankl', 'Self Help', 0,
"Psychiatrist Viktor Frankl's memoir has riveted generations of readers with its descriptions of life in Nazi death camps and its lessons for spiritual survival. Based on his own experience and the stories of his patients, Frankl argues that we cannot avoid suffering but we can choose how to cope with it, find meaning in it, and move forward with renewed purpose. At the heart of his theory, known as logotherapy, is a conviction that the primary human drive is not pleasure but the pursuit of what we find meaningful. Man's Search for Meaning has become one of the most influential books in America; it continues to inspire us all to find significance in the very act of living.",
"pics/man'search_for_meaning.jpg", 20230513),
("Atalanta", "Jennifer Saint", "Historical", 0,
"From the beloved, bestselling author of Elektra and Ariadne , a reimagining of the myth of Atalanta, a fierce huntress raised by bears and the only woman in the world’s most famous band of heroes, the Argonauts
Princess, Warrior, Lover, Hero", "pics/image14.jpg", 20230513),
("Sisters of the Lost Nation", "Nick Medina", "Thriller", 2.5,
"A young Native girl's hunt for answers about the women mysteriously disappearing from her tribe's reservation lead her to delve into the myths and stories of her people, all while being haunted herself, in this atmospheric and stunningly poignant debut.

Anna Horn is always looking over her shoulder. For the bullies who torment her, for the entitled visitors at the reservation's casino...and for the nameless, disembodied entity that stalks her every step--an ancient tribal myth come-to-life, one that's intent on devouring her whole.

With strange and sinister happenings occurring around the casino, Anna starts to suspect that not all the horrors on the reservation are old. As girls begin to go missing and the tribe scrambles to find answers, Anna struggles with her place on the rez, desperately searching for the key she's sure lies in the legends of her tribe's past.

When Anna's own little sister also disappears, she'll do anything to bring Grace home. But the demons plaguing the reservation--both ancient and new--are strong, and sometimes, it's the stories that never get told that are the most important.

Part gripping thriller and part mythological horror, author Nick Medina spins an incisive and timely novel of life as an outcast, the cost of forgetting tradition, and the courage it takes to become who you were always meant to be.",
"pics/image15.jpg", 20230513),
("Symphony of Secrets", "Brendan Slocumb", "Fiction", 3.5,
"From the celebrated author of book club favorite The Violin Conspiracy: A gripping page-turner about a professor who uncovers a shocking secret about the most famous American composer of all time—that his music was stolen from a young Black composer named Josephine Reed. Determined to uncover the truth and right history’s wrongs, Bern Hendricks will stop at nothing to finally give Josephine the recognition she deserves.

Bern Hendricks has just received the call of a lifetime. As one of the world’s preeminent experts on the famed twentieth-century composer Frederick Delaney, Bern knows everything there is to know about the man behind the music. When Mallory Roberts, a board member of the distinguished Delaney Foundation and direct descendant of the man himself, asks for Bern’s help authenticating a newly discovered piece, which may be his famous lost opera, RED, he jumps at the chance. With the help of his tech-savvy acquaintance Eboni, Bern soon discovers that the truth is far more complicated than history would have them believe.

In 1920s Manhattan, Josephine Reed is living on the streets and frequenting jazz clubs when she meets the struggling musician Fred Delaney. But where young Delaney struggles, Josephine soars. She’s a natural prodigy who hears beautiful music in the sounds of the world around her. With Josephine as his silent partner, Delaney’s career takes off—but who is the real genius here?

In the present day, Bern and Eboni begin to uncover more clues that indicate Delaney may have had help in composing his most successful work. Armed with more questions than answers and caught in the crosshairs of a powerful organization who will stop at nothing to keep their secret hidden, Bern and Eboni will move heaven and earth in their dogged quest to right history’s wrongs.",
"pics/image16.jpg", 20230513),
("For You and Only You", "Caroline Kepnes", "Mystery Thriller", 3,
"From New York Times–bestselling author Caroline Kepnes comes the next novel in her hit You series, which follows Joe Goldberg to the hallowed halls of Harvard University where he earns a coveted place in a writing fellowship...and leaves crimson in his wake.

Joe Goldberg is ready for a change. Instead of selling books, he’s writing them. And he's off to a good start. Glenn Shoddy, an acclaimed literary author, recognizes Joe's genius and invites him to join a tight-knit writing fellowship at Harvard. Finally, Joe will be in a place where talent matters more than pedigree, where intellect is the great equalizer and anything is possible--even happy endings. Or so he thinks, until he meets his already-published, already-distinguished peers, who all seem to be cut from the same privileged cloth.

Thankfully, Wonder enters the picture. They have so much in common. No college degrees, no pretensions, no stories from prep school or grad school. Just a love for literature. If only Wonder could commit herself to the writing life they could be those rare literary soulmates who never fall prey to their demons. There is so much they’re up against, but Joe has faith in Wonder. He will sacrifice his art for hers. And if he has to, he will kill her darlings for her.

With her trademark satirical, biting wit, Caroline Kepnes explores why vulnerable people bring out the worst in others as Joe sets out to make this small, elite world a fairer place. And if a little crimson runs in the streets of Cambridge who can blame him? Love doesn't conquer all. Often, it needs a little push.",
"pics/image17.jpg", 20230513),
("23 Hours to Midnight", "James Patterson", "Mystery Thriller", 4,
"Detective Lindsay Boxer put serial killer Evan Burke behind bars. Now a new killer has recreated Burke's most infamous crimes-and disappeared without a trace.

Detective Lindsay Boxer put serial killer Evan Burke in jail.

Reporter Cindy Thomas put Burke on the bestseller list, in her true-crime book about the case.

An obsessed fan is studying every detail-and committing fresh horrors that carry Burke's signature.

Now Lindsay's tracking an elusive suspect, one who's penning a deadly playbook featuring Cindy's name in blood-red ink.",
"pics/image18.jpg", 20230513),
("The House Is on Fire", "Rachel Beanland", "Historical Fiction", 0,
"The author of Florence Adler Swims Forever returns with a masterful work of historical fiction about an incendiary tragedy that shocked a young nation and tore apart a community in a single night—told from the perspectives of four people whose actions during the inferno changed the course of history.

Richmond, Virginia 1811. It’s the height of the winter social season. The General Assembly is in session, and many of Virginia’s gentleman planters, along with their wives and children, have made the long and arduous journey to the capital in hopes of whiling away the darkest days of the year. At the city’s only theater, the Charleston-based Placide & Green Company puts on two plays a night to meet the demand of a populace that’s done looking for enlightenment in a church.

On the night after Christmas, the theater is packed with more than six hundred holiday revelers. In the third-floor boxes, sits newly widowed Sally Henry Campbell, who is glad for any opportunity to relive the happy times she shared with her husband. One floor away, in the colored gallery, Cecily Patterson doesn’t give a whit about the play but is grateful for a four-hour reprieve from a life that has recently gone from bad to worse. Backstage, young stagehand Jack Gibson hopes that, if he can impress the theater’s managers, he’ll be offered a permanent job with the company. And on the other side of town, blacksmith Gilbert Hunt dreams of one day being able to bring his wife to the theater, but he’ll have to buy her freedom first.

When the theater goes up in flames in the middle of the performance, Sally, Cecily, Jack, and Gilbert make a series of split-second decisions that will not only affect their own lives but those of countless others. And in the days following the fire, as news of the disaster spreads across the United States, the paths of these four people will become forever intertwined.

Based on the true story of Richmond’s theater fire, The House Is on Fire offers proof that sometimes, in the midst of great tragedy, we are offered our most precious—and fleeting—chances at redemption.",
"pics/image19.jpg", 20230513),
("The Golden Doves", "Martha Hall Kelly", "Historical Fiction", 0,
"Two former female spies, bound together by their past, risk everything to hunt down an infamous Nazi doctor in the aftermath of World War II—an extraordinary novel inspired by true events from the New York Times bestselling author of Lilac Girls

American Josie Anderson and Parisian Arlette LaRue are thrilled to be working in the French resistance, stealing so many Nazi secrets that they become known as the Golden Doves, renowned across France and hunted by the Gestapo. Their courage will cost them everything. When they are finally arrested and taken to the Ravensbrück concentration camp, along with their loved ones, a reclusive Nazi doctor does unspeakable things to Josie’s mother, a celebrated Jewish singer who joined her daughter in Paris when the world seemed bright. And Arlette’s son is stolen from her, never to be seen again.

A decade later the Doves fall headlong into a dangerous dual mission: Josie is working for U.S. Army intelligence and accepts an assignment to hunt down the infamous doctor, while a mysterious man tells Arlette he may have found her son. The Golden Doves embark on a quest across Europe and ultimately to French Guiana, discovering a web of terrible secrets, and must put themselves in grave danger to finally secure justice and protect the ones they love.

Martha Hall Kelly has garnered acclaim for her stunning combination of empathy and research into the stories of women throughout history and for exploring the terrors of Ravensbrück. With The Golden Doves, she has crafted an unforgettable story about the fates of Nazi fugitives in the wake of World War II—and the unsung females spies who risked it all to bring them to justice.",
"pics/image20.jpg", 20230513),
("The Last Heir to Blackwood Library", "Hester Fox", "Historical Fiction", 0,
"In post–World War I England, a young woman inherits a mysterious library and must untangle its powerful secrets…

With the stroke of a pen, twenty-three-year-old Ivy Radcliffe becomes Lady Hayworth, owner of a sprawling estate on the Yorkshire moors. Ivy has never heard of Blackwood Abbey, or of the ancient bloodline from which she’s descended. With nothing to keep her in London since losing her brother in the Great War, she warily makes her way to her new home.

The abbey is foreboding, the servants reserved and suspicious. But there is a treasure waiting behind locked doors: a magnificent library. Despite cryptic warnings from the staff, Ivy feels irresistibly drawn to its dusty shelves, where familiar works mingle with strange, esoteric texts. And she senses something else in the library too, a presence that seems to have a will of its own.  

Rumors swirl in the village about the abbey’s previous owners, about ghosts and curses, and an enigmatic manuscript at the center of it all. And as events grow more sinister, it will be up to Ivy to uncover the library’s mysteries in order to reclaim her own story—before it vanishes forever.",
"pics/image21.jpg", 20230513),
("Ana María and the Fox", "Liana De la Rosa", "Romance", 0,
"A forbidden love between a Mexican heiress and a shrewd British politician makes for a tantalizing Victorian season.

Ana María Luna Valdés has strived to be the perfect daughter, the perfect niece, and the perfect representative of the powerful Luna familia. So, when Ana María is secretly sent to London with her sisters to seek refuge during the French occupation of Mexico, she experiences her first taste of freedom far from the judgmental eyes of her domineering father. If only she could ignore the piercing looks she receives across ballroom floors from the austere Mr. Fox.

Gideon Fox elevated himself from the London gutters by chasing his burning desire for more: more opportunities, more choices. For everyone. Now as a member of Parliament, Gideon's on the cusp of securing the votes he needs to put forth a measure to abolish the Atlantic slave trade once and for all--a cause that is close to his heart as the grandson of a formerly enslaved woman. The charmingly vexing Ana María is a distraction he must ignore.

But when Ana María finds herself in the crosshairs of a nefarious nobleman with his own political agenda, Gideon knows he must offer his hand as protection...but will this Mexican heiress win his heart as well?",
"pics/image22.jpg", 20230513),
("Only the Beautiful", "Susan Meissner", "Historical Fiction", 0,
"A heartrending story about a young mother’s fight to keep her daughter, and the winds of fortune that tear them apart by the New York Times bestselling author of The Nature of Fragile Things and The Last Year of the War.

California, 1938—When she loses her parents in an accident, sixteen-year-old Rosanne is taken in by the owners of the vineyard where she has lived her whole life as the vinedresser’s daughter. She moves into Celine and Truman Calvert’s spacious house with a secret, however—Rosie sees colors when she hears sound. She promised her mother she’d never reveal her little-understood ability to anyone, but the weight of her isolation and grief prove too much for her. Driven by her loneliness she not only breaks the vow to her mother, but in a desperate moment lets down her guard and ends up pregnant. Banished by the Calverts, Rosanne believes she is bound for a home for unwed mothers, and having lost her family she treasures her pregnancy as the chance for a future one. But she soon finds out she is not going to a home of any kind, but to a place far worse than anything she could have imagined.

Austria, 1947—After witnessing firsthand Adolf Hitler’s brutal pursuit of hereditary purity—especially with regard to “different children”—Helen Calvert, Truman's sister, is ready to return to America for good. But when she arrives at her brother’s peaceful vineyard after decades working abroad, she is shocked to learn what really happened nine years earlier to the vinedresser’s daughter, a girl whom Helen had long ago befriended. In her determination to find Rosanne, Helen discovers that while the war had been won in Europe, there are still terrifying battles to be fought at home.",
"pics/image23.jpg", 20230513),
("Swan Light", "Phoebe Rowe", "Historical Fiction", 0,
"A sweeping, emotional tale of hope and perseverance, Swan Light weaves together the stories of two people separated by a century but connected by family, purpose, and one extraordinary lighthouse.

1913. Eighty-three-year-old Silvestre Swan has dedicated his life to the care of his Newfoundland lighthouse. His petition to relocate Swan Light from its precarious cliff’s edge is going unheard by town patriarch Cort Roland—that is, until a terrible storm brings an unlikely ally into Swan’s life. But is it too late for the stone lighthouse?

2014. Marine archaeologist Mari Adams's attempts to fund her search for the notorious SS Californian are realized when she accepts a job to find the remains of Swan Light, rumored to have collapsed into the sea one hundred years ago. She teams up with salvager Julian Henry, and the pair unearth more than they bargained for in their search for the ruins. But when a group of treasure hunters threatens their mission, their hunt for the truth turns dangerous.

As past and present collide, the secrets hiding on the ocean floor begin to surface. Can Mari find the answers she is looking for—and at what price?",
"pics/image24.jpg", 20230513),
("If Only You", "Chloe Liese", "Romance", 0,
"Brace yourself for longing, laughter, and a swoony slow-burn in this brother’s best friend sports romance about scoring the love of your life when you least expect to.

Ziggy

I’m the youngest player on the National Soccer team, the baby of my family, and thoroughly sick of being underestimated, so I’ve decided to take matters into my own hands. Which is where my brother’s best friend and teammate, the infamous Sebastian Marchand, comes in. 
 
Seb needs to rehab his reputation. I want to give mine an edge. So I propose a fake friendship with real benefits: spending time in the public eye, my good-girl image and his bad-boy notoriety rubbing off on each other. He’s my devious, dark-haired fantasy come to life, but his destructive ways make it easy to keep him in the (fake) friend zone. Or so I thought, until I start to see the heart of gold he’s been hiding beneath that sinister surface…

Sebastian

Like any self-respecting reprobate, I’ve been spiraling downward, and finally I’ve hit rock bottom. My hockey career and sponsorships are in jeopardy, and while I’m not ready to actually reform my ways, I’m happy to pretend that I have, to secure the life I’m on the brink of losing. 
 
So when my best friend’s sister, Ziggy Bergman, proposes a public “friendship” to revamp our reputations, it’s an offer I can’t refuse. Up till now, I’ve stayed away from Ren’s sweet, shy little sister to avoid any risk of ruining my one good friendship. But I reassure myself there’s no risk in our scheme. I’ll fake a friendship with Ziggy, fix my reputation, and get back to hockey, the one and only thing I love. At least, it was, until what began as a transactional arrangement became the most loving relationship I’ve ever known.

​If Only You is a brother’s best friend, (fake) friends with benefits to friends to lovers romance about a bighearted, quietly fierce soccer star on the autism spectrum, and a thoroughly unprincipled, almost irredeemable hockey player who has celiac disease. Complete with an absurd level of mutual pining, meddling family and friends, and a spicy slow burn, this standalone is the sixth in a series of novels about a Swedish-American family of five brothers, two sisters, and their wild adventures as they each find happily ever after.",
"pics/image25.jpg", 20230513),
("The Plus One", "Mazey Eddings", "Romance", 0,
"Some facts are indisputable. The sun rises in the east, sets in the west. Gravity exits. Indira doesn’t like Jude. Jude doesn’t like Indira. But what happens when these childhood enemies find the only thing they can rely on is each other?

On paper, Indira has everything together. An amazing job, a boyfriend, and a car. What more could a late twenty-something ask for? But when she walks in on her boyfriend in an amorous embrace with a stranger, that perfect on paper image goes up in flames.

Jude has nothing together. A doctor that’s spent the last three years traveling the world to treat emergencies and humanitarian crises, a quick trip home for his best friend’s wedding has him struggling to readjust.

Thrust into an elaborate (and ridiculously drawn out) wedding event that’s stressing Jude beyond belief and has Indira seeing her ex and his new girlfriend far more frequently than any human should endure, the duo strike a bargain to be each other’s fake dates to this wedding from hell. The only problem is, their forced proximity and fake displays of affection are starting to feel a bit… real, and both are left grappling with the idea that a situation that couldn’t be worse, is made a little better with the other around.

What starts out as a fake wedding date turns into something these childhood enemies never expected in the next sparkling romantic comedy by Mazey Eddings.",
"pics/image26.jpg", 20230513),
("Divine Rivals", "Rebecca Ross", "Fantasy", 0,
"When two young rival journalists find love through a magical connection, they must face the depths of hell, in a war among gods, to seal their fate forever.

After centuries of sleep, the gods are warring again. But eighteen-year-old Iris Winnow just wants to hold her family together. Her mother is suffering from addiction and her brother is missing from the front lines. Her best bet is to win the columnist promotion at the Oath Gazette.

To combat her worries, Iris writes letters to her brother and slips them beneath her wardrobe door, where they vanish—into the hands of Roman Kitt, her cold and handsome rival at the paper. When he anonymously writes Iris back, the two of them forge a connection that will follow Iris all the way to the front lines of battle: for her brother, the fate of mankind, and love.

Shadow and Bone meets Lore in Rebecca Ross's Divine Rivals, an epic enemies-to-lovers fantasy novel filled with hope and heartbreak, and the unparalleled power of love.",
"pics/image27.jpg", 20230513),
("Forget Me Not", "Alyson Derrick", "Romance", 0,
"A romantic ode to the strength of love and the power of choosing each other, against odds and obstacles, again and again.

What would you do if you forgot the love of your life ever even existed?

Stevie and Nora had a love. A secret, epic, once-in-a-lifetime kind of love. They also had a plan: to leave their small, ultra-conservative town and families behind after graduation and move to California, where they could finally stop hiding that love.

But then Stevie has a terrible fall. And when she comes to, she can remember nothing of the last two years—not California, not coming to terms with her sexuality, not even Nora. Suddenly, Stevie finds herself in a life she doesn’t quite understand, one where she’s estranged from her parents, drifting away from her friends, lying about the hours she works, dating a boy she can’t remember crushing on, and headed towards a future that isn’t at all what her fifteen-year-old self would have envisioned.

And Nora finds herself…forgotten. Can the two beat the odds a second time and find their way back together when “together” itself is just a lost memory?",
"pics/image28.jpg", 20230513),
("Bewitched", "Laura Thalassa", "Fantasy", 0,
"Come to me, Empress …

At age twenty, Selene Bowers desperately hopes to be accepted into Henbane Coven, an academy for young witches. Since one of the requirements for entry is to connect with her powers via a quest through the wilderness, Selene books a trip to South America. When a nefarious supernatural force tries to drag her plane from the sky, Selene's magic awakens to save her life―at a cost. Using her powers devours her memories, one by one.

Worse, when Selene braves the jungle and discovers the source of the attack, she finds herself awakening an ancient evil, Memnon the Cursed, who mistakes Selene for his long-dead wife. The wife who betrayed him. Selene manages to escape and begin her studies at Henbane, but when Memnon turns up at the coven and witches are found dead across campus, Selene becomes entangled in a dangerous plot. Accused of the murders on the basis of her memory loss, Selene must rely on Memnon's help for answers―and his plans for her will change everything.",
"pics/image29.jpg", 20230513),
("The Do-Over", "Suzanne Park", "Romance", 0,
"From the author of Loathe at First Sight and So We Meet Again, a fun rom-com about a young Korean-American woman having to return to college after discovering she’s a few credits shy of completing her degree—only to find one of her TAs is her old college boyfriend.

Lily Lee is a bestselling author of the How to Be a Supernova At Work series, and her editor wants her to strike while the iron’s hot with a new book, How to Land the Perfect Job. But when Lily is offered a coveted position at a top firm, the employer background check reveals she’s short a few college credits and never actually completed her degree. Unbelievably, her worst nightmare has come true.

Lily returns to her alma mater, reliving her senior year of college ten years later. She enrolls in classes, gets invited to frat parties, eats most of her meals with “dining dollars,” and to make things even more weird and chaotic, she discovers that her computer science TA is her old college boyfriend, Jake Cho.

As Lily and Jake reconnect, she sees that her ex has done well for himself: the handsome, charming grad student appears to have his life together while Lily’s so close to losing her dream job opportunity and her book deal.

Things aren't so simple the second time around.

The Do-Over is a delightfully warm and hopeful story about second chances in love and life, and how the future we want may turn out far different than we imagined.",
"pics/image30.jpg", 20230513),
("Untethered Sky", "Fonda Lee", "Fantasy", 0,
"From World Fantasy Award-winning author Fonda Lee comes Untethered Sky , an epic fantasy fable about the pursuit of obsession at all costs.

A Most Anticipated in 2023 Pick for Polygon | Book Riot | Paste Magazine

Ester’s family was torn apart when a manticore killed her mother and baby brother, leaving her with nothing but her father’s painful silence and a single, overwhelming need to kill the monsters that took her family.

Ester’s path leads her to the King’s Royal Mews, where the giant rocs of legend are flown to hunt manticores by their brave and dedicated ruhkers. Paired with a fledgling roc named Zahra, Ester finds purpose and acclaim by devoting herself to a calling that demands absolute sacrifice and a creature that will never return her love. The terrifying partnership between woman and roc leads Ester not only on the empire’s most dangerous manticore hunt, but on a journey of perseverance and acceptance.",
"pics/image31.jpg", 20230513),
("Blood Debts", "Terry J. Benton-Walker", "Fantasy", 0,
"Thirty years ago, a young woman was murdered, a family was lynched, and New Orleans saw the greatest magical massacre in its history. In the days that followed, a throne was stolen from a queen.

On the anniversary of these brutal events, Clement and Cristina Trudeau—the sixteen-year-old twin heirs to the powerful, magical, dethroned family—are mourning their father and caring for their sick mother. Until, by chance, they discover their mother isn’t sick—she’s cursed. Cursed by someone on the very magic council their family used to rule. Someone who will come for them next.

Cristina, once a talented and dedicated practitioner of Generational magic, has given up magic for good. An ancient spell is what killed their father and she was the one who cast it. For Clement, magic is his lifeline. A distraction from his anger and pain. Even better than the random guys he hooks up with.

Cristina and Clement used to be each other’s most trusted confidant and friend, now they barely speak. But if they have any hope of discovering who is coming after their family, they’ll have to find a way to trust each other and their family's magic, all while solving the decades-old murder that sparked the still-rising tensions between the city’s magical and non-magical communities. And if they don't succeed, New Orleans may see another massacre. Or worse.

Terry J. Benton-Walker's contemporary fantasy debut, Blood Debts, with powerful magical families, intergenerational curses, and deadly drama in New Orleans.",
"pics/image32.jpg", 20230513),
("Silver in the Bone", "Alexandra Bracken", "Fantasy", 0,
"A series opener inspired by Arthurian legend and fueled by love, revenge, and pure adrenaline!

Tamsin Lark didn’t ask to be a Hollower. As a mortal with no magical talent, she was never meant to break into ancient crypts, or compete with sorceresses and Cunningfolk for the treasures inside. But after her thieving foster father disappeared without so much as a goodbye, it was the only way to keep herself—and her brother, Cabell—alive.

Ten years later, rumors are swirling that her guardian vanished with a powerful ring from Arthurian legend. A run-in with her rival Emrys ignites Tamsin’s hope that the ring could free Cabell from a curse that threatens both of them. But they aren’t the only ones who covet the ring.

As word spreads, greedy Hollowers start circling, and many would kill to have it for themselves. While Emrys is the last person Tamsin would choose to partner with, she needs all the help she can get to edge out her competitors in the race for the ring. Together, they dive headfirst into a vipers’ nest of dark magic, exposing a deadly secret with the power to awaken ghosts of the past and shatter her last hope of saving her brother. . . .",
"pics/image33.jpg", 20230513),
("This Delicious Death", "Kayla Cottingham", "Young Adult", 0,
"Four best friends, one music festival, and a cooler filled with human organs: this summer is about to get gory. ​​​

Jennifer’s Body fans will clamor for this new sapphic horror standalone from New York Times bestselling author Kayla Cottingham.

Three years ago, the melting of arctic permafrost released a pathogen of unknown origin into the atmosphere, causing a small percentage of people to undergo a transformation that became known as the Hollowing. Those impacted slowly became intolerant to normal food and were only able to gain sustenance by consuming the flesh of other human beings. Those who went without flesh quickly became feral, turning on their friends and family. However, scientists were able to create a synthetic version of human meat that would satisfy the hunger of those impacted by the Hollowing. As a result, humanity slowly began to return to normal, albeit with lasting fear and distrust for the people they'd pejoratively dubbed ghouls.

Zoey, Celeste, Valeria, and Jasmine are all ghouls living in Southern California. As a last hurrah before their graduation they decided to attend a musical festival in the desert. They have a cooler filled with hard seltzers and SynFlesh and are ready to party.

But on the first night of the festival Val goes feral, and ends up killing and eating a boy. As other festival guests start disappearing around them the girls soon discover someone is drugging ghouls and making them feral. And if they can't figure out how to stop it, and soon, no one at the festival is safe.",
"pics/image34.jpg", 20230513),
("Some Desperate Glory", "Emily Tesh", "Science Fiction", 0,
"All her life Kyr has trained for the day she can avenge the murder of planet Earth. Raised in the bowels of Gaea Station alongside the last scraps of humanity, she readies herself to face the Wisdom, the all-powerful, reality-shaping weapon that gave the Majoda their victory over humanity.

They are what’s left. They are what must survive. Kyr is one of the best warriors of her generation, the sword of a dead planet. But when Command assigns her brother to certain death and relegates her to the nursery to bear sons until she dies trying, she knows she must take humanity’s revenge into her own hands.

Alongside her brother’s brilliant but seditious friend and a lonely, captive alien, she escapes from everything she’s ever known into a universe far more complicated than she was taught and far more wondrous than she could have imagined.

A thrillingly told queer space opera about the wreckage of war, the family you find, and who you must become when every choice is stripped from you, Some Desperate Glory is award-winning author Emily Tesh’s highly anticipated debut novel.",
"pics/image35.jpg", 20230513),
("The Thick and the Lean", "Chana Porter", "Science Fiction", 0,
"In Lambda Award finalist Chana Porter’s highly anticipated new novel, an aspiring chef, a cyberthief, and a kitchen maid each break free of a society that wants to constrain them.

In the quaint religious town of Seagate, abstaining from food brings one closer to God.

But Beatrice Bolano is hungry. She craves the forbidden: butter, flambé, marzipan. As Seagate takes increasingly extreme measures to regulate every calorie its citizens consume, Beatrice must make a choice: give up her secret passion for cooking or leave the only community she has known.

Elsewhere, Reiko Rimando has left her modest roots for a college tech scholarship in the big city. A flawless student, she is set up for success...until her school pulls her funding, leaving her to face either a mountain of debt or a humiliating return home. But Reiko is done being at the mercy of the system. She forges a third path—outside of the law.

With the guidance of a mysterious cookbook written by a kitchen maid centuries ago, Beatrice and Reiko each grasp for a life of freedom—something more easily imagined than achieved in a world dominated by catastrophic corporate greed.

A startling fable of the entwined perils of capitalism, body politics, and the stigmas women face for appetites of every kind, Chana Porter’s profound new novel explores the reclamation of pleasure as a revolutionary act.",
"pics/image36.jpg", 20230513);

INSERT INTO accounts(username, email, password)
VALUES
('admin', 'admin@gmail.com', 'Rod28F3o8baAMs4'),
('haiphong', 'haiphong@gmail.com', 'pZewzkd4jY4ptfU'),
('congthien', 'congthien@gmail.com', 'zHNpGWeeNmcpthy'),
('thangdang', 'thangdang@gmail.com', 'Q9W5FTZQTkIRMye'),
('anhtuan', 'anhtuan@gmail.com', 'OfA18dkk2L4nDSw');

INSERT INTO reading_lists(account_id, list_name)
VALUES
(1, 'Favorite Books'),
(2, 'Favorite Books'),
(3, 'Favorite Books'),
(4, 'Favorite Books'),
(5, 'Favorite Books');

INSERT INTO list_books(list_id, book_id)
VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 7),
(2, 5),
(2, 8),
(3, 2),
(3, 4),
(3, 9),
(4, 2),
(4, 6),
(5, 2),
(5, 7),
(5, 9);

INSERT INTO reviews(book_id, account_id, parent_comment_id, review_text, rating)
VALUES
(1, 1, NULL, 'SAC can do no wrong in my eyes.
she has such a strong talent for creating magical worlds and historic atmospheres. and this particular book has everything i need to feel like im living a stolen life on the open seas with the salty wind in my hair and a map in my hand.
i adored the time period, i loved the characters, i had a lot of fun with the plot, and i obsessed over the mythology of it all. this is an exceptional start to a series i fully expect to love.', 4.5),
(1, 2, NULL, 'i’m usually fine with not understanding what’s not going on but because i didn’t understand the language it made it even harder, half the words i needed help with weren’t even in the glossary. in fact the glossary only had 9 words. i thought the premise was interesting and the characters were funny but idk i just spent more time trying to figure out what they were saying and maybe that’s my own ignorance', 3),
(1, 5, NULL, 'i definitely didnt dislike this, but as a story, it just never won me over :(', 3),
(2, 2, NULL, 'Loved the writing style, the multiple timelines, and the Scottish village setting. The use of wildlife and nature in connection with the women was very well done. The main characters were all likable as well. What was tough for me was the repetitive scenes featuring the termination of pregnancy. I wish the topic had been limited to one woman and those scenes might be really hard for some readers to get through. Thank you to @libro.fm for the gifted audiobook. The narration was excellent.', 3.5),
(2, 3, NULL, 'Thoroughly enjoyed this wonderful novel about Weyward women in three different timelines. Altha, tried as a witch in 1619; Violet in 1942, with an abusive father; and Kate, Violet’s grandniece, in an abusive controlling relationship set in 2019. Nature, strength and a bit of witchiness is in each woman’s story and there is no weak link. It’s very well done and I found it hard to put down.', 4),
(2, 4, NULL, "So happy to be able to recommend the audio version of Weyward. After a string of lackluster listens, this one was a solid journey. Also surprised to discover it is a debut novel, so hopefully author Emilia Hart has a long and successful career.
As a reader, 2022 has been the year of strong female characters breaking free and Weyward gives us multi generations of women who have faced abuse, trauma and struggles and do so fiercely. I loved the periods in history which told the story of these women - 1619, 1940s and 2019 - this kept the story moving and my interest piqued.
As a lover of setting being a strong character, Weyward Cottage was integral to each of the characters, and connected the generations beautifully.", 4.5),
(2, 5, NULL, "I was sent an arc of this for possible review/blurb and was a little dubious at first, because 'witch' novels can be a hard sell for me sometimes. But the writing is gorgeous and the story very absorbing.
Beautifully written and intricate as a spider's web, Weyward weaves an intergenerational tale of sorrow, love, and strength. Though separated by decades or even centuries, these three Weyward women--Altha, Violet, and Kate--are each other's heritage and legacy, and the power they each possess pays tribute to the connections between women, nature, and family.", 5),
(3, 2, NULL, "Despite garnering a lot of good reviews, I thought this was mildly informative (and perhaps moreso to someone who's never spent much time with a friend or family member with Alzheimer's). To me it came off more like what it apparently is--a scientist/clinician trying to write a novel to help explain how Alzheimer's patients feel and are treated in the earlier stages of the disease. There were a few good moments, and it wasn't horrible, but...well, maybe there's a reason why scientists rarely write good novels and why novelists rarely produce great science. I felt like it could have been improved greatly with collaboration with a good fiction writer. The family stuff just didn't feel authentic to me.", 2.5),
(3, 5, NULL, "“... just because [butterflies'] lives were short didn't mean they were tragic... See, they have a beautiful life.” ― Lisa Genova, Still Alice
Strong message. Made me cry and think about the life
I would definitely recommend. Just GO read this book.", 4),
(4, 4, NULL, "I just had so much trouble trying to get into this book. In the end, I just couldn’t connect with the characters or the writing style. Is anything so wrong with correct punctuation and quotation marks? There was no flow. Maybe that was the point. Maybe we were supposed to feel unbalanced and abrupt. Maybe it was meant to invoke the Depression Era darkness. It didn’t work for me. I was really disappointed.", 1),
(4, 5, NULL, "This one was a struggle for me, I honestly didn’t find the storyline very intriguing or captivating. It did not keep my attention or encourage me to keep reading. Very descriptive, excellently written for the time period. Valentine is hired to paint a mural at the post office in a small Wyoming town, and he is given room and board on a ranch where Eve and her husband long live. Eve takes off and somehow valentine is talked into trying to track her down.", 3.5),
(5, 3, NULL, "The Only Survivors is a thriller set at a remote location near the ocean where high school friends who survived a crash of two vans meet annually. Initially there were nine survivors but now they are down to seven survivors.
They have harbored secrets about what really happened at the accident site and they want to ensure that all of them stick with the same script. Things start to unravel.
At times, the pace is a little slow, but I read it in one day because the plot and characters were interesting.", 4.5),
(5, 4, NULL, "2.5 Stars, generously rounding up to 3. Miranda can definitely write that prose, but my goodness are her books so BORING! With 89 pages left to read nothing had happened whatsoever and I thought about DNF'ing it but since it somehow was selected as a BOTM selection for April I decided I would try to get my money's worth. I should have known better as the last several of her novels have been the same. A lot of over detailing on unimportant things and stalling the story for what seems like hundreds of pages until an ending that you kind of go 'meh' to. She has absolutely beautiful book covers but that's about it. This one had a lot of characters which I could not connect with at all and kept confusing because they weren't really fleshed out enough for me to individualize them, with exception to a couple of them, so a good portion of this novel I was a little bit confused about who was who and which direction this story would take. In the end it was as predictable as I feared it would be.
I think it's safe to say I'm done reading this author's books. She gets me with those beautiful covers and they do look wonderful on my bookshelf, but that's about it. I'm sure many will disagree with me on this one, and that's okay, it just really disappointed me, again. Well, what are you going to do?! Time to move on to the next!", 2.5),
(5, 2, NULL, "The survivors from a tragedy that occurred when they were in high school meet every year and stay at a remote beach lodge with spotty Wi-Fi. The story is told between then and now by multiple narrators. There are secrets about what truly happened that night 10 years ago and now two of the survivors are dead, one’s gone missing and the group starts feeling like they are being watched.
This is a very slow moving mystery. There is also a large cast of characters and dual timelines. Because of that, the setup takes a long time and it’s hard to get to know the many characters. I liked the plot, the twists are good and so is the narration on the audio version. What didn’t work for me was the length of time it took to get there and too many characters to get to know and some of them had such small parts they seemed unnecessary. My favorite from this author is Such a Quiet Place", 3),
(6, 1, NULL, "An unforgettable and valuable story that undoubtedly has the power to bring experiences closer and heal pain. However, for me, it wasn't as perfect as I expected it to be because something in the narration didn't quite fit me, at times I felt that the intensity of the story was lost in insignificant details. In summary, the story and the characters are great but the prose, not entirely to my liking.", 3.5),
(6, 4, NULL, "This book is unlike any book I’ve ever read—it’s an in-your-face journey of a Black gay man and his struggle for acceptance, but also involves a lot of bird watching?! The story takes place in the UK and focuses on our main character, Harley and his attempted suicide that was thwarted by his friend’s boyfriend. Harley is unsure what to make of his newfound friendship with Muddy because they’re very different. Muddy is straight, confident, and carefree. Muddy and Harley form a unique bond that I can tell you, every gay man wishes they could have with heterosexual men if they don’t have one already. However, this friendship isn’t without hurdles for the reader to uncover.
This book is not a romance. It’s a deep dive into mental health, self acceptance, and friendship. This book talks about serious topics, but is done so in a very healthy and formative way. At times, this book is lighthearted and will put a smile on your face; but it can also have its moments of serious conflict that will leave you breathless. SMALL JOYS is a book I don’t think I’ll ever forget.", 4),
(7, 2, NULL, "this is one of my favorite books i’ve read this year", 5),
(7, 4, NULL, "I truly love Jimenez's books. All of her books have an amazing romance with alot of depth to them. Brianna had alot of trauma from her past relationship and is a caregiver for her younger brother so she has alot going on. Jacob has social anxiety and is also dealing with a past relationship.
I loved the romance in this book and the side characters. Another solid Jimenez book.", 4),
(8, 1, NULL, "Knjiga je bila veliki hit u vrijeme prikazivanja serije. tad sam ju valjda i pročitao. Sama po sebi-ništa posebno", 3),
(8, 4, NULL, "This book was well written. McCullough is a talented storyteller. However, I felt that the book was too long and dragged, due to superfluous information. Overall an interesting, colorful story and vivid portrait of early Australia.", 3),
(9, 3, NULL, "The original part one was the strongest I think because the rest started to go into the typical psychobabble inherent to books trying to contribute to the academic side of psychology or psychiatry but the first part really grounded the idea of giving meaning to one existence into personal experience and I found it very poignant about the mental state of people in very stressful and hopeless situations. It's a very empowering and important idea that no matter the situation a person can control their behavior and influence their own feelings of the situation. This idea of a person having so much control over their own selves and survival is one I whole heartedly agree with. Anyone having trouble figuring out life or what the point is could benefit from reading this I think.", 4),
(9, 5, NULL, "Reading this book in high school changed my life. I grew up in an abusive home and was in constant survival mode. After reading this book I realized that I had a choice. I could let my circumstances dictate my attitude or I could choose my attitude, which could then change my circumstances.
Becoming an adult is the hardest thing we ever do. Being an adult means accepting responsibility for your thoughts, actions and character. I realized that I can choose my thoughts and actions regardless of my past or present after reading this book. I finally understood that work and life are good.
As I discipline my attitude, I have more opportunities for service. I can teach with love and have compassion for all around me. I can serve with a humble attitude, which gives my existence meaning. This book enlightened me and helped me to expand my ability to practice patience. I am more positive. I understand that all humans are striving everyday.
What I think and choose to do are under my control. I can choose an attitude with a long term perspective and motivate my life to a higher meaning. This is the ultimate book on self motivation.", 5),
(1, 4, 2, "It's understandable that not every story resonates with everyone in the same way. Each reader has their own preferences and connections to different narratives. While this particular story might not have captured your interest or won you over, it's important to remember that everyone's experiences and perspectives vary when it comes to storytelling. Different books appeal to different readers, and it's perfectly valid to have a personal response that differs from others.", NULL),
(8, 5, 20, "I completely agree that this book was well written. McCullough is a talented storyteller. However, I felt that the book was too long and dragged on due to unnecessary information. Overall, it's an interesting and colorful story, providing a vivid portrait of early Australia.", NULL),
(8, 1, 20, "I definitely agree that this book was well written. McCullough is indeed a skilled storyteller. However, personally, I found the book to be overly lengthy and filled with superfluous details, which made it feel slow-paced. Nonetheless, it still offers an intriguing and vibrant depiction of early Australia.", NULL),
(7, 3, 17, "I respect your opinion, but I personally didn't find this book to be one of my favorites that I've read this year. While tastes may differ, I felt that there were other books that resonated with me more and left a stronger impression. However, I'm glad to hear that you enjoyed it and found it to be a standout read for you.", NULL);

UPDATE Books
SET rating = (
    SELECT AVG(rating)
    FROM Reviews
    WHERE Reviews.book_id = Books.book_id
    GROUP BY book_id
)
WHERE rating IS NOT NULL;