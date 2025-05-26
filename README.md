# 1. What is PostgreSQL?
## উত্তর:
### PostgreSQL হলো একটি ওপেন-সোর্স, রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি table ভিত্তিক ডেটা সংরক্ষণ করে এবং SQL ব্যবহার করে ডেটা ম্যানিপুলেট করা যায়।
## উদাহরণ:
### rangers নামে একটি টেবিল আছে, যেখানে বিভিন্ন রেঞ্জারদের তথ্য রাখা আছে। এটি PostgreSQL দিয়ে তৈরি করা যায়।

# 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
## উত্তর:
- Primary Key হলো কোন একটা টেবিলের একটি কলাম বা কলামগুলোর সমষ্টি যা প্রতিটি রেকর্ডকে ইউনিক  করে। এটি কখনো null হয় না।
- Foreign Key  হলো এমন একটি Key যা অন্য টেবিলের Primary Key কে reference করে। এটি টেবিলের মধ্যে সম্পর্ক তৈরি করে।
## উদাহরণ:
### rangers টেবিলের ranger_id হলো Primary Key। sightings টেবিলেও ranger_id আছে, কিন্তু এটি হচ্ছে Foreign Key যা rangers(ranger_id) এর সাথে যুক্ত।

# 3. Explain the purpose of the WHERE clause in a SELECT statement.
## উত্তর:
### WHERE ক্লজ ব্যবহার করে আমরা ডেটাবেস থেকে নির্দিষ্ট শর্ত অনুযায়ী ডেটা বের করতে পারি।
এটি ডেটা ফিল্টার করতে সাহায্য করে।
## উদাহরণ:
```sql
 SELECT * FROM rangers WHERE name = 'Alice Green';
  ```

# 4. What are the LIMIT and OFFSET clauses used for?
## উত্তর:
### LIMIT: কয়টি row দেখাবে সেটি নির্ধারণ করে।
 ```sql 
 SELECT * FROM sightings LIMIT 3; 
 ```

### OFFSET: কয়টি row স্কিপ করবে সেটি নির্ধারণ করে।
```sql
SELECT * FROM sightings OFFSET 2;
```

# 5. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
## উত্তর:
### JOIN ব্যবহার করে একাধিক table থেকে সম্পর্কিত ডেটা একত্রে আনা যায়।
## উদাহরণ:
 
```sql
SELECT common_name,sighting_time, name    FROM  sightings
JOIN species ON sightings.species_id = species.species_id
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sighting_time DESC
LIMIT 2 
``` 

# 6. How can you modify data using UPDATE statements?
## উত্তর:
### UPDATE দিয়ে টেবিলের আগের ডেটা পরিবর্তন এবং modify করা যায়। যে টেবিলের রেকর্ডটা পরিবর্তন করতে চাই , সেটার জন্য WHERE ব্যবহার করতে হবে।
## উদাহরণ:
 
```sql
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01'
``` 

# 7. Explain the GROUP BY clause and its role in aggregation operations.
## উত্তর:
### GROUP BY ব্যবহার করে একই রকম ডেটাগুলোকে একটা গ্রুপে সহজেই আনতে পারি। তারপর সেই গ্রুপের উপর এগ্রিগেট ফাংশন ব্যবহার করে যেমন  COUNT, SUM, AVG এই  বিভিন্ন ধরনের হিসাব করা যায়।
## উদাহরণ:
 
```sql
SELECT ranger_id, COUNT(*) AS total_sightings
FROM sightings
GROUP BY ranger_id;
``` 

# 8. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
## উত্তর:
### COUNT() টেবিলের মধ্যে সব মিলিয়ে কয়টা  রেকর্ড আছে গুনে দেয়। SUM() কোনো কলামের যেটা সংখ্যা হিসেবে হয় তা সব মান যোগ করে দেয়। AVG() কলামের সব সংখ্যা যোগফলকে সংখ্যা গুলোর পরিমাণ দিয়ে ভাগ করে গড় বের করে।
## উদাহরণ:
 
```sql
SELECT COUNT(*) FROM sightings;

SELECT SUM(price) FROM products;

SELECT AVG(score) FROM tests;

``` 



