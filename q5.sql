use assignment1;

DELIMITER $$

create procedure AllWatchHistory()
begin
    declare flag int default FALSE;
    declare sub_id int;
    declare sub_name varchar(100);

    declare cur cursor for 
        select SubscriberID, SubscriberName from Subscribers;

    declare continue handler for not found set flag = TRUE;

    open cur;
    read_loop: LOOP
        fetch cur into sub_id, sub_name;
        if flag then
            leave read_loop;
        end if;

        select concat('Watch history for: ', sub_name) as message;

        if exists (select * from WatchHistory where SubscriberID = sub_id) then
            call GetWatchHistoryBySubscriber(sub_id); -- watch time exists so we display records
        else
            select CONCAT(sub_name, ' has no watch history') as message; -- watch time is null
        end if;
    end loop;
    close cur;
end$$

DELIMITER ;

call AllWatchHistory();
