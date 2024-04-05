intents = [
  {"tag": "greetings",
  "patterns": ["hello","hey","hi","good day","Greetings","what's up?","how is it going?"],
  "responses": ["Hello!","Hey!","What can I do for you?"]
  },

  {"tag": "name",
  "patterns": ["what is your name","name","what's your name","who are you","what should I call you"],
  "responses": ["You can call me arDub","I'm arDub","I'm arDub your virtual assistant"]
  },

  {"tag": "courses",
  "patterns": ["courses", "courses in college","different courses","courses offered","courses available"],
  "responses": ["This college provides different BE/BTECH courses, CSE/IT/ECE/AI&DS/CSBS/MECH","There are a variety of courses available in our college-CSE,IT,ECE,AI&DS,CSBS and MECH!","There are a total of 6 courses available in our college"]
  },

   {"tag": "courseDuration",
  "patterns": ["how long will be BE/B.tech course", "how long will it take to complete be or btech course","how long is be course","how long is btech course"],
  "responses": ["Our college offers 4 year long BE/BTECH courses!"]
  },

   {"tag": "Location",
  "patterns": ["location","where is it located","what is the location of the college","college location?","where is the college situated"],
  "responses": ["Our college is situated at saravanampatti","The college is located in thudiyalur road,saravanampatti"]
  },

  {"tag": "semesters",
  "patterns": ["how many semesters are there in a year","how many semesters one should study in a year","how many semesters does the course have?","semester","sem"],
  "responses": ["There are two semesters per year.","There are a total of 8 semesters"]
  },

  {"tag": "semDuration",
  "patterns": ["how many months are there in a semester","how long will be a single semester","sem duration"],
  "responses": ["The single semester will be around 4 months.","The duration of each semester is 3-4 months"]
  },

  {"tag": "studentRequirements",
  "patterns": ["what are the student requirements for admission","entry requirements","admission requirements","requirements"],
  "responses": ["The requirements for the admission are: \n1)Have passed 12th with more than 70% \n2)Have attempted JEE MAINS"]
  },

  {"tag": "classes",
  "patterns": ["how many classes will be there in a day","how long are the classes?","classes","class"],
  "responses": ["There will be 8 classes per day. Each class will be of 50 minutes."]
  },

  {"tag": "teachingStyle",
  "patterns": ["what is the teaching style of this college?","Is the teaching pattern different from other college?","what is the teaching format?"],
  "responses": ["Our college has different teaching patterns than other colleges of Coimbatore. We adopt a application oriented teaching methodology, which helps in understanding the concepts more easily."]
  },

  {"tag": "exams",
  "patterns": ["what are the exams like?","What is the exam pattern","What about exams","exams"],
  "responses": ["There are 3 examination methods in our college,\n1)By conducting paper/pen test once a month and end of semester\n2)Conducting monthly practical exams to test students in thier practical knowledge\n3)Assigning assignments to students once a month to help them develop in application of the subject."]
  },

  {"tag": "hours",
  "patterns": ["what are your hours","when are you guys open","what your hours of operation","open hours"],
  "responses": ["You can message us here at any hours. But our college premises will be open from 8:30 am to 5:00 pm only."]
  },

  {"tag": "funActivities",
  "patterns": ["will there be any extra curriculum activities?","does the college conducts any fun program","activities"],
  "responses": ["Yes, Of course. Our college not only provides excellent education but also encourage students to take part in different curriculum activities. The college conducts yearly programs like Sports meet, Carnival, Holi festival, and Christmas. \n Also our college has basketball court, badminton court, table tennis, chess, carrom board and many more refreshment zones."]
  },

  {"tag": "AIDepartment",
  "patterns": ["what is ai department","what do we do in ai department","tell me about ai department","ai department","department"],
  "responses": ["In AI Department,we will be focusing on machine learning,Data science as well as deep learning concepts to enhance the students knowledge about the future of AI","The goal of the department is to ensure the academic excellence in students with wide exposure of research and career opportunities."]
  },

  {"tag": "AISubjects",
  "patterns": ["what are the subjects in AI course","what do we learn in ai course","tell me about the subjects of ai department","ai subjects","subjects in ai"],
  "responses": ["This course offers various subjects like \n1)Introduction to AI\n2)Data Exploration and Visualization\n3)Machine learning \n4)Data science\n5)Discrete maths\nand much more!"]
  },

  {"tag": "AIProgramLang",
  "patterns": ["what are the basic programming languages needed? ","what programming language do we learn in ai department","tell me the easy programming language to learn first?","ai programs"],
  "responses": ["In AI Field,the most commonly used programming languages are PYTHON,R,SQL,JAVA etc","The easier and required programming language in AI is python!"]
  },

  {"tag": "facilities",
  "patterns": ["what facilities are provided by the college?","what are the facilities of college for students", "what are the college infrastructures ","facilities"],
  "responses": ["With excellent education facilities, Our College provides various other facilities like 24 hours internet, library, discusson room, canteen, parking space, and student service for any students queries."]
  },

  {"tag": "fee",
  "patterns": ["how much is the college fee","what is the fee structure","fees"],
  "responses": ["Course BE/BTECH\nAdmission fee=RS 81,000\nYear 1\nUniversity and Exam fee= RS 1,500 Each semester fee=RS 40,000 Total fee= RS 83,000\nYear 2\nUniversity and Exam fee= RS 1,500 Each semester fee=RS 40,000 Total fee= RS 83,000\nYear 3\nUniversity and Exam fee= RS 1,500 Each semester fee=RS 81,000 Total fee= RS 83,000\nGrandTotal fee= RS 2,32,000"]
  },

  {"tag": "joke",
  "patterns": ["can u tell me a joke?","tell me a joke","joke","i am bored, tell me a joke"],
  "responses": ["Our college is one of the top colleges in coimbatore","We are propfessional college","we are in top anna university college list"]
  },

  {"tag": "goodbye",
  "patterns": ["cya","See you later","Goodbye","I am leaving","Have a Good Day","bye","see ya","sayonara","byeee"],
  "responses": ["Sad to see you go :(","Talk you later","Goodbye"]
  },

  {"tag": "invalid",
    "patterns": ["","gvsd","asbhk","123412dasd","jjk hsdu mm12"," __","*&^$#$@#$"],
    "responses": ["Sorry, can't understand you", "Please give me more info", "Not sure if i can understand","cant get you.."]
  },

  {"tag": "thanks",
    "patterns": ["Thanks", "Thank you", "That's helpful", "Awesome, thanks", "Thanks for helping me"],
    "responses": ["Happy to help!", "Any time!", "My pleasure"]
  }
  
]