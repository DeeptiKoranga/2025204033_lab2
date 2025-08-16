USE assignment1;

DELIMITER //

create procedure AddSubscriberIfNotExists(in sub_Name varchar(100))
begin
    declare new_id int;

    if not exists (
        select SubscriberID
        from subscribers 
        where SubscriberName = sub_Name
    ) then
        select ifnull(max(SubscriberID), 0) + 1 into new_id  -- logic to add new subscriber id ; existing + 1
        from subscribers;

        insert into subscribers (SubscriberID, SubscriberName, SubscriptionDate) 
        values (new_id, sub_Name, CURDATE());

        select concat('New subscriber "', sub_Name, '" added.') AS NewSubscriber;
    else
        select concat('Subscriber "', sub_Name, '" already exists.') AS AlreadyPresent;
    end if;
end //

DELIMITER ;

CALL AddSubscriberIfNotExists('Virat Kohli'); -- can change name here to add new subscriber 
CALL AddSubscriberIfNotExists('Chris Adams');

