//Assignment No- 12


/*Assignment Title - Study of Open Source NOSQL Database: MongoDB
, Installation of MongoDB , Create database in MongoDB , Create a collection
named student , Insert 5 records with field (Student_ number, Name, Address , contact_number
, subjects and percentage ). */

use student

Create collection - db.createcollection("studentdata")

Insert Data – db.studentdata.insertMany([
{
 "Student_number": 1,
 "Name": "Kajal",
 "Address": "Chalisgaon",
 "contact_number": "7666484718",
 "subjects": ["Math", "Science","Mysql","Web technology"],
 "percentage": 85
 },
 { "Student_number": 2,
  "Name": "Pranav",
    "Address": "Nashik",
 "contact_number": "9423477695",
 "subjects": ["Mysql","Web technology","Networking"],
 "percentage": 92
 },
{
"Student_number": 3,
"Name": "Aish",
 "Address": "Jalgaon",
"contact_number": "8788372121",
"subjects": ["Mysql","Web technology"],
 "percentage": 95
},
{
"Student_number": 4,
"Name": "Mohit",
"Address": "Pune",
"contact_number": "7798193478",
"subjects": ["Mysql","Web technology","Networking","UI/UX"],
"percentage": 90},
])


//Insert 1 more document in collection with additional field of hobbies. 
 db.students.insertOne({
"Student_number": 5,
"Name": "kp",
"Address": "Pilkhod",
"contact_number": "7620779630",
"subjects": ["Geography", "Art"],
"percentage": 90,
"hobbies": ["Reading", "Painting"]
})


 //Display information of all students
 db.studentdata.find()


// Display details of students who have secured more than 70 percentage
 db.studentdata.find({ "percentage": { $gt: 70 } })

//Update percentage of student whose Student _ number is 5
 db.studentdata.updateOne(
 { "Student_number": 5 },
{ $set: { "percentage": 60 } }
 )

// Delete document of ‘kp’ from database
db.studentdata.deleteOne({ "Name": "kp" })

/Demonstrate use of Save() Method
Query - var student = db.studentdata.findOne({ "Name": "Pranav" })
student.Address = "ozar" db.studentdata.save(student)_