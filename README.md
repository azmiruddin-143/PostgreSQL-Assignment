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
<pre> ```sql SELECT * FROM rangers WHERE name = 'Alice Green'; ``` </pre>

# 4. What are the LIMIT and OFFSET clauses used for?
## উত্তর:
### LIMIT: কয়টি row দেখাবে সেটি নির্ধারণ করে।
<pre> ```SELECT * FROM sightings LIMIT 3; ``` </pre>

### OFFSET: কয়টি row স্কিপ করবে সেটি নির্ধারণ করে।
<pre> ```SELECT * FROM sightings OFFSET 2; ``` </pre>

# 5. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
## উত্তর:
### JOIN ব্যবহার করে একাধিক table থেকে সম্পর্কিত ডেটা একত্রে আনা যায়।
## উদাহরণ:
<pre> 
```SELECT common_name,sighting_time, name    FROM  sightings
JOIN species ON sightings.species_id = species.species_id
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sighting_time DESC
LIMIT 2 ``` 
</pre>



