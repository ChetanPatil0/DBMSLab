//Assignment No : 13


/*Problem Statement: Design and Develop MongoDB Queries using aggregation and indexing with suitable example using MongoDB
Create the collection Books in mongoDb having the following fields
TITLE , DESCRIPTION,BY,URL,TAGS AND LIKES .
Implement the following Aggregation and Indexing
Queries
1.	Find the number of books published by john.
2.	Find books which have minimum likes and maximum likes published by john..
3.	Find the average number of likes of the books published by john.
4.	Find the first and last book published by john..
*/

 Create database: use studentdb create collection : db.createCollection("Books") insert 5 records in student collection: db.Books.insertMany([
{
"TITLE" : "Book 1",
"DESCRIPTION" : "Description of Book 1",
"BY" : "John",
"URL" : "url1",
"TAGS" : [
"ppp",
"qqq"
],
"LIKES" : 100
},{
"TITLE" : "Book 2",
"DESCRIPTION" : "Description of Book 2",
"BY" : "John",
"URL" : "url2",
"TAGS" : [
"aaa",
"bbb"
],
"LIKES" : 150
},
{
"TITLE" : "Book 3",
"DESCRIPTION" : "Description of Book 3",
"BY" : "Bob",
"URL" : "url3",
"TAGS" : [
"xxx",
"yyy"
],
"LIKES" : 80
}])

//Find the number of books published by John:
db.Books.aggregate([ { $match: { BY: "John" } },
{ $count: "total_books" }
])


//Find books which have minimum likes and maximum likes published by John:
db.Books.aggregate([ { $match: { BY: "John" } },
{ $group: {
_id: null,
minLikes: { $min: "$LIKES" },
maxLikes: { $max: "$LIKES" }
}}
])


//Find the average number of likes of the books published by John:
db.Books.aggregate([ { $match: { BY: "John" } },
{ $group: {
_id: null,
avgLikes: { $avg: "$LIKES" }
}}
])


//Find the first and last book published by John:
db.Books.aggregate([
{ $match: { BY: "John" } },{ $sort: { _id: 1 } },
{ $group: {
_id: null, firstBook: { $first: "$$ROOT" },
lastBook: { $last: "$$ROOT" }
}}
])

//To create an index on the BY field: 
db.Books.createIndex({ BY: 1 })

 
 
 
