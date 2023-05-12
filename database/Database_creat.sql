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
    review_text TEXT,
    rating INT,
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
('The Adventures of Amina al-Sirafi', 'S.A. Chakraborty', 'Fantasy, Historical Fiction, Fiction', 0, 
"Amina al-Sirafi should be content. After a storied and scandalous career as one of the Indian Ocean’s most notorious pirates, she’s survived backstabbing rogues, vengeful merchant princes, several husbands, and one actual demon to retire peacefully with her family to a life of piety, motherhood, and absolutely nothing that hints of the supernatural.

But when she’s tracked down by the obscenely wealthy mother of a former crewman, she’s offered a job no bandit could refuse: retrieve her comrade’s kidnapped daughter for a kingly sum. The chance to have one last adventure with her crew, do right by an old friend, and win a fortune that will secure her family’s future forever? It seems like such an obvious choice that it must be God’s will.

Yet the deeper Amina dives, the more it becomes alarmingly clear there’s more to this job, and the girl’s disappearance, than she was led to believe. For there’s always risk in wanting to become a legend, to seize one last chance at glory, to savor just a bit more power… and the price might be your very soul.",
"pics/image1.jpg", 20230513),
('Weyward', 'Emilia Hart', "Historical Fiction, Fantasy, Fiction, Magical Realism", 0, 
"I am a Weyward, and wild inside.

2019: Under cover of darkness, Kate flees London for ramshackle Weyward Cottage, inherited from a great aunt she barely remembers. With its tumbling ivy and overgrown garden, the cottage is worlds away from the abusive partner who tormented Kate. But she begins to suspect that her great aunt had a secret. One that lurks in the bones of the cottage, hidden ever since the witch-hunts of the 17th century.

1619: Altha is awaiting trial for the murder of a local farmer who was stampeded to death by his herd. As a girl, Altha’s mother taught her their magic, a kind not rooted in spell casting but in a deep knowledge of the natural world. But unusual women have always been deemed dangerous, and as the evidence for witchcraft is set out against Altha, she knows it will take all of her powers to maintain her freedom.

1942: As World War II rages, Violet is trapped in her family's grand, crumbling estate. Straitjacketed by societal convention, she longs for the robust education her brother receives––and for her mother, long deceased, who was rumored to have gone mad before her death. The only traces Violet has of her are a locket bearing the initial W and the word weyward scratched into the baseboard of her bedroom.

Weaving together the stories of three extraordinary women across five centuries, Emilia Hart's Weyward is an enthralling novel of female resilience and the transformative power of the natural world.",
"pics/image2.jpg", 20230513),
('Still Alice', 'Lisa Genova', 'Fiction, Contemporary, Psychology', 0,
"Still Alice is a compelling debut novel about a 50-year-old woman's sudden descent into early onset Alzheimer's disease, written by first-time author Lisa Genova, who holds a Ph. D in neuroscience from Harvard University.

Alice Howland, happily married with three grown children and a house on the Cape, is a celebrated Harvard professor at the height of her career when she notices a forgetfulness creeping into her life. As confusion starts to cloud her thinking and her memory begins to fail her, she receives a devastating diagnosis: early onset Alzheimer's disease. Fiercely independent, Alice struggles to maintain her lifestyle and live in the moment, even as her sense of self is being stripped away. In turns heartbreaking, inspiring and terrifying, Still Alice captures in remarkable detail what's it's like to literally lose your mind...",
"pics/image3.jpg", 20230513),
('The Trackers', 'Charles Frazier', 'Historical Fiction, Fiction, Historical', 0,
"From the New York Times bestselling author of Cold Mountain and Varina, a stunning new novel that paints a vivid portrait of life in the Great Depression

Hurtling past the downtrodden communities of Depression-era America, painter Val Welch travels westward to the rural town of Dawes, Wyoming. Through a stroke of luck, he's landed a New Deal assignment to create a mural representing the region for their new Post Office.

A wealthy art lover named John Long and his wife Eve have agreed to host Val at their sprawling ranch. Rumors and intrigue surround the couple: Eve left behind an itinerant life riding the rails and singing in a western swing band. Long holds shady political aspirations, but was once a WWI sniper--and his right hand is a mysterious elder cowboy, a vestige of the violent old west. Val quickly finds himself entranced by their lives.

One day, Eve flees home with a valuable painting in tow, and Long recruits Val to hit the road with a mission of tracking her down. Journeying from ramshackle Hoovervilles to San Francisco nightclubs to the swamps of Florida, Val's search for Eve narrows, and he soon turns up secrets that could spark formidable changes for all of them.

In The Trackers, singular American writer Charles Frazier conjures up the lives of everyday people during an extraordinary period of history that bears uncanny resemblance to our own. With the keen perceptions of humanity and transcendent storytelling that have made him beloved for decades, Frazier has created a powerful and timeless new classic.",
"pics/image10.jpg", 20230513),
('The Only Survivors', 'Megan Miranda', 'Thriller, Mystery, Mystery Thriller', 0,
"A mystery about a group of former classmates who reunite to mark the tenth anniversary of a tragic accident—only to have one of the survivors disappear, casting fear and suspicion on the original tragedy.",
"pics/image11.jpg", 20230513),
('Small Joy', 'Elvin James Mensah', 'Fiction, Contemporary, LGBT', 0,
"An unexpected friendship saves a young man's life in this moving, utterly charming debut about chosen family, the winding road to happiness, and the grace of second chances.

Could I one day inspire happiness in others, the same way he seemed to do in me?

It's 2005 and Harley has dropped out of college to move home, back to rural England, where he works a dead-end job at a movie theater. Estranged from his father and finding every attempt at happiness futile, Harley is on the verge of making a devastating final decision. Fortunately for him, things don't go according to plan, and his attempt on his own life is interrupted by his new roommate, Muddy.

Muddy is everything Harley is not: ostensibly heterosexual, freewheeling, confident in his masculinity. Despite their differences, a deep friendship blossoms between them when Muddy takes Harley under his wing and shows him everything that, in his eyes, makes life worth living: bird-watching, karaoke, rugby, and the band Oasis.

But this newfound friendship is complicated. It has enormous repercussions for the pair's romantically entangled friend group--for Chelsea, an overbearing striver whose generosity they begrudgingly rely on; for Finlay, her raffish and uncouth boyfriend; and for Noria, who despite her simmering confidence is smarting from a series of unreturned affections. And then there's the violent affair with an older man that Harley finds himself slipping back into . . .

As secrets and jealousies endanger all that Harley has come to depend on, he finds himself faltering once again, even though he finally has something--and someone--to live for. Soul-stirring and witty, full of hope and peopled with characters who feel like close friends, Small Joys explores a young man's turbulent journey toward happiness and announces the arrival of an exciting voice in fiction.",
"pics/image12.jpg", 20230513),
('Yours Truly', 'Abby Jimenez', 'Romance, Contemporary, Contemporary Romance', 0,
"A novel of terrible first impressions, hilarious second chances, and the joy in finding your perfect match.

Dr. Briana Ortiz’s life is seriously flatlining. Her divorce is just about finalized, her brother’s running out of time to find a kidney donor, and that promotion she wants? Oh, that’s probably going to the new man-doctor who’s already registering eighty-friggin’-seven on Briana’s “pain in my ass” scale. But just when all systems are set to hate, Dr. Jacob Maddox completely flips the game . . . by sending Briana a letter.

And it’s a really good letter. Like the kind that proves that Jacob isn’t actually Satan. Worse, he might be this fantastically funny and subversively likeable guy who’s terrible at first impressions. Because suddenly he and Bri are exchanging letters, sharing lunch dates in her “sob closet,” and discussing the merits of freakishly tiny horses. But when Jacob decides to give Briana the best gift imaginable—a kidney for her brother—she wonders just how she can resist this quietly sexy new doctor . . . especially when he calls in a favor she can’t refuse.",
"pics/image13.jpg", 20230513),
('The Thorn Bird', 'Colleen McCullough', 'Fiction, Historical Fiction, Romance', 0,
"The Thorn Birds is a robust, romantic saga of a singular family, the Clearys. It begins in the early part of the 20th century, when Paddy Cleary moves his wife, Fiona, and their seven children to Drogheda, the vast Australian sheep station owned by his autocratic and childless older sister; and it ends more than half a century later, when the only survivor of the third generation, the brilliant actress Justine O'Neill, sets a course of life and love halfway around the world from her roots.

The central figures in this enthralling story are the indomitable Meggie, the only Cleary daughter, and the one man she truly loves, the stunningly handsome and ambitious priest Ralph de Bricassart. Ralph's course moves him a long way indeed, from a remote Outback parish to the halls of the Vatican; and Meggie's except for a brief and miserable marriage elsewhere, is fixed to the Drogheda that is part of her bones - but distance does not dim their feelings though it shapes their lives.

Wonderful characters people this book; strong and gentle, Paddy, hiding a private memory; dutiful Fiona, holding back love because it once betrayed her, violent, tormented Frank, and the other hardworking Cleary sons who give the boundless lands of Drogheda the energy and devotion most men save for women; Meggie; Ralph; and Meggie's children, Justine and Dane. And the land itself; stark, relentless in its demands, brilliant in its flowering, prey to gigantic cycles of drought and flood, rich when nature is bountiful, surreal like no other place on earth.",
"pics/image9.jpg", 20230513),
("Man's Search For Meaning", 'Viktor E. Frankl', 'Nonfiction, Psychology, Self Help', 0,
"Psychiatrist Viktor Frankl's memoir has riveted generations of readers with its descriptions of life in Nazi death camps and its lessons for spiritual survival. Based on his own experience and the stories of his patients, Frankl argues that we cannot avoid suffering but we can choose how to cope with it, find meaning in it, and move forward with renewed purpose. At the heart of his theory, known as logotherapy, is a conviction that the primary human drive is not pleasure but the pursuit of what we find meaningful. Man's Search for Meaning has become one of the most influential books in America; it continues to inspire us all to find significance in the very act of living.",
"pics/man'search_for_meaning.jpg", 20230513);

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

INSERT INTO reviews(book_id, account_id, review_text, rating)
VALUES
(1, 1, 'SAC can do no wrong in my eyes.
she has such a strong talent for creating magical worlds and historic atmospheres. and this particular book has everything i need to feel like im living a stolen life on the open seas with the salty wind in my hair and a map in my hand.
i adored the time period, i loved the characters, i had a lot of fun with the plot, and i obsessed over the mythology of it all. this is an exceptional start to a series i fully expect to love.', 4.5),
(1, 2, 'i’m usually fine with not understanding what’s not going on but because i didn’t understand the language it made it even harder, half the words i needed help with weren’t even in the glossary. in fact the glossary only had 9 words. i thought the premise was interesting and the characters were funny but idk i just spent more time trying to figure out what they were saying and maybe that’s my own ignorance', 3),
(1, 5, 'i definitely didnt dislike this, but as a story, it just never won me over :(', 3),
(2, 2, 'Loved the writing style, the multiple timelines, and the Scottish village setting. The use of wildlife and nature in connection with the women was very well done. The main characters were all likable as well. What was tough for me was the repetitive scenes featuring the termination of pregnancy. I wish the topic had been limited to one woman and those scenes might be really hard for some readers to get through. Thank you to @libro.fm for the gifted audiobook. The narration was excellent.', 3.5),
(2, 3, 'Thoroughly enjoyed this wonderful novel about Weyward women in three different timelines. Altha, tried as a witch in 1619; Violet in 1942, with an abusive father; and Kate, Violet’s grandniece, in an abusive controlling relationship set in 2019. Nature, strength and a bit of witchiness is in each woman’s story and there is no weak link. It’s very well done and I found it hard to put down.', 4),
(2, 4, "So happy to be able to recommend the audio version of Weyward. After a string of lackluster listens, this one was a solid journey. Also surprised to discover it is a debut novel, so hopefully author Emilia Hart has a long and successful career.
As a reader, 2022 has been the year of strong female characters breaking free and Weyward gives us multi generations of women who have faced abuse, trauma and struggles and do so fiercely. I loved the periods in history which told the story of these women - 1619, 1940s and 2019 - this kept the story moving and my interest piqued.
As a lover of setting being a strong character, Weyward Cottage was integral to each of the characters, and connected the generations beautifully.", 4.5),
(2, 5, "I was sent an arc of this for possible review/blurb and was a little dubious at first, because 'witch' novels can be a hard sell for me sometimes. But the writing is gorgeous and the story very absorbing.
Beautifully written and intricate as a spider's web, Weyward weaves an intergenerational tale of sorrow, love, and strength. Though separated by decades or even centuries, these three Weyward women--Altha, Violet, and Kate--are each other's heritage and legacy, and the power they each possess pays tribute to the connections between women, nature, and family.", 5),
(3, 2, "Despite garnering a lot of good reviews, I thought this was mildly informative (and perhaps moreso to someone who's never spent much time with a friend or family member with Alzheimer's). To me it came off more like what it apparently is--a scientist/clinician trying to write a novel to help explain how Alzheimer's patients feel and are treated in the earlier stages of the disease. There were a few good moments, and it wasn't horrible, but...well, maybe there's a reason why scientists rarely write good novels and why novelists rarely produce great science. I felt like it could have been improved greatly with collaboration with a good fiction writer. The family stuff just didn't feel authentic to me.", 2.5),
(3, 5, "“... just because [butterflies'] lives were short didn't mean they were tragic... See, they have a beautiful life.” ― Lisa Genova, Still Alice
Strong message. Made me cry and think about the life
I would definitely recommend. Just GO read this book.", 4),
(4, 4, "I just had so much trouble trying to get into this book. In the end, I just couldn’t connect with the characters or the writing style. Is anything so wrong with correct punctuation and quotation marks? There was no flow. Maybe that was the point. Maybe we were supposed to feel unbalanced and abrupt. Maybe it was meant to invoke the Depression Era darkness. It didn’t work for me. I was really disappointed.", 1),
(4, 5, "This one was a struggle for me, I honestly didn’t find the storyline very intriguing or captivating. It did not keep my attention or encourage me to keep reading. Very descriptive, excellently written for the time period. Valentine is hired to paint a mural at the post office in a small Wyoming town, and he is given room and board on a ranch where Eve and her husband long live. Eve takes off and somehow valentine is talked into trying to track her down.", 3.5),
(5, 3, "The Only Survivors is a thriller set at a remote location near the ocean where high school friends who survived a crash of two vans meet annually. Initially there were nine survivors but now they are down to seven survivors.
They have harbored secrets about what really happened at the accident site and they want to ensure that all of them stick with the same script. Things start to unravel.
At times, the pace is a little slow, but I read it in one day because the plot and characters were interesting.", 4.5),
(5, 4, "2.5 Stars, generously rounding up to 3. Miranda can definitely write that prose, but my goodness are her books so BORING! With 89 pages left to read nothing had happened whatsoever and I thought about DNF'ing it but since it somehow was selected as a BOTM selection for April I decided I would try to get my money's worth. I should have known better as the last several of her novels have been the same. A lot of over detailing on unimportant things and stalling the story for what seems like hundreds of pages until an ending that you kind of go 'meh' to. She has absolutely beautiful book covers but that's about it. This one had a lot of characters which I could not connect with at all and kept confusing because they weren't really fleshed out enough for me to individualize them, with exception to a couple of them, so a good portion of this novel I was a little bit confused about who was who and which direction this story would take. In the end it was as predictable as I feared it would be.
I think it's safe to say I'm done reading this author's books. She gets me with those beautiful covers and they do look wonderful on my bookshelf, but that's about it. I'm sure many will disagree with me on this one, and that's okay, it just really disappointed me, again. Well, what are you going to do?! Time to move on to the next!", 2.5),
(5, 2, "The survivors from a tragedy that occurred when they were in high school meet every year and stay at a remote beach lodge with spotty Wi-Fi. The story is told between then and now by multiple narrators. There are secrets about what truly happened that night 10 years ago and now two of the survivors are dead, one’s gone missing and the group starts feeling like they are being watched.
This is a very slow moving mystery. There is also a large cast of characters and dual timelines. Because of that, the setup takes a long time and it’s hard to get to know the many characters. I liked the plot, the twists are good and so is the narration on the audio version. What didn’t work for me was the length of time it took to get there and too many characters to get to know and some of them had such small parts they seemed unnecessary. My favorite from this author is Such a Quiet Place", 3),
(6, 1, "An unforgettable and valuable story that undoubtedly has the power to bring experiences closer and heal pain. However, for me, it wasn't as perfect as I expected it to be because something in the narration didn't quite fit me, at times I felt that the intensity of the story was lost in insignificant details. In summary, the story and the characters are great but the prose, not entirely to my liking.", 3.5),
(6, 4, "This book is unlike any book I’ve ever read—it’s an in-your-face journey of a Black gay man and his struggle for acceptance, but also involves a lot of bird watching?! The story takes place in the UK and focuses on our main character, Harley and his attempted suicide that was thwarted by his friend’s boyfriend. Harley is unsure what to make of his newfound friendship with Muddy because they’re very different. Muddy is straight, confident, and carefree. Muddy and Harley form a unique bond that I can tell you, every gay man wishes they could have with heterosexual men if they don’t have one already. However, this friendship isn’t without hurdles for the reader to uncover.
This book is not a romance. It’s a deep dive into mental health, self acceptance, and friendship. This book talks about serious topics, but is done so in a very healthy and formative way. At times, this book is lighthearted and will put a smile on your face; but it can also have its moments of serious conflict that will leave you breathless. SMALL JOYS is a book I don’t think I’ll ever forget.", 4),
(7, 2, "this is one of my favorite books i’ve read this year", 5),
(7, 4, "I truly love Jimenez's books. All of her books have an amazing romance with alot of depth to them. Brianna had alot of trauma from her past relationship and is a caregiver for her younger brother so she has alot going on. Jacob has social anxiety and is also dealing with a past relationship.
I loved the romance in this book and the side characters. Another solid Jimenez book.", 4),
(8, 1, "Knjiga je bila veliki hit u vrijeme prikazivanja serije. tad sam ju valjda i pročitao. Sama po sebi-ništa posebno", 3),
(8, 4, "This book was well written. McCullough is a talented storyteller. However, I felt that the book was too long and dragged, due to superfluous information. Overall an interesting, colorful story and vivid portrait of early Australia.", 3),
(9, 3, "The original part one was the strongest I think because the rest started to go into the typical psychobabble inherent to books trying to contribute to the academic side of psychology or psychiatry but the first part really grounded the idea of giving meaning to one existence into personal experience and I found it very poignant about the mental state of people in very stressful and hopeless situations. It's a very empowering and important idea that no matter the situation a person can control their behavior and influence their own feelings of the situation. This idea of a person having so much control over their own selves and survival is one I whole heartedly agree with. Anyone having trouble figuring out life or what the point is could benefit from reading this I think.", 4),
(9, 5, "Reading this book in high school changed my life. I grew up in an abusive home and was in constant survival mode. After reading this book I realized that I had a choice. I could let my circumstances dictate my attitude or I could choose my attitude, which could then change my circumstances.
Becoming an adult is the hardest thing we ever do. Being an adult means accepting responsibility for your thoughts, actions and character. I realized that I can choose my thoughts and actions regardless of my past or present after reading this book. I finally understood that work and life are good.
As I discipline my attitude, I have more opportunities for service. I can teach with love and have compassion for all around me. I can serve with a humble attitude, which gives my existence meaning. This book enlightened me and helped me to expand my ability to practice patience. I am more positive. I understand that all humans are striving everyday.
What I think and choose to do are under my control. I can choose an attitude with a long term perspective and motivate my life to a higher meaning. This is the ultimate book on self motivation.", 5);

UPDATE Books
SET rating = (
    SELECT AVG(rating)
    FROM Reviews
    WHERE Reviews.book_id = Books.book_id
    GROUP BY book_id
);