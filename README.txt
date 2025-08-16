Instruction to EXECUTE the Scripts :

1. Connect to a MySQL Server. Create database named assignment1. Create required tables and insert values as specified in the assignment.
2. Tables created are: shows, subscriber, watchhistory(with schema as specified in the assignment).
3. Execute scripts q1.sql, q2.sql, q3.sql, q4.sql, q5.sql to create the stored procedures.
4. To run queries use commands: 
	QUES1: call ListAllSubscribers(); 
	QUES2: call GetWatchHistoryBySubscriber(sub_id); //here sub_id is int value
	QUES3: call AddSubscriberIfNotExists(sub_name); //here sub_name is varchar(100) value
	QUES4: call SendWatchTimeReport();  
	QUES5: call AllWatchHistory();

Git Repo Link: https://github.com/DeeptiKoranga/2025204033_lab2

	
