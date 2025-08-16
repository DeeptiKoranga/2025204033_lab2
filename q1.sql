use assignment1;

Delimiter ##

create procedure ListAllSubscribers()
BEGIN
	declare flag int default false;
    declare sub_name varchar(100);
    
    declare cur cursor for
     select SubscriberName from subscribers;
	declare continue handler for not found set flag = true;

	open cur;
    read_loop: loop
		fetch cur into sub_name;
        if flag then
			leave read_loop;
		end if;
	select concat('Subcriber Name is: ', sub_name) AS SUBNAME;  -- select will give output in multiple table 
    end loop;
    close cur;
END ##

delimiter ;

call ListAllSubscribers();

