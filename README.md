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

