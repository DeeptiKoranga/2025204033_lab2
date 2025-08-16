use assignment1;

DELIMITER $$

create procedure SendWatchTimeReport()
begin
    declare flag int default FALSE;
    declare sub_id int;

    declare cur cursor for
        select SubscriberID 
        from WatchHistory
        where WatchTime > 0;
    declare continue handler for not found set flag = TRUE;

    open cur;
    read_loop: LOOP
        fetch cur into sub_id;
        if done then
            leave read_loop;
        end if;
        call GetWatchHistoryBySubscriber(sub_id);
    end loop;
    close cur;
    
end $$
DELIMITER ;

CALL SendWatchTimeReport();
