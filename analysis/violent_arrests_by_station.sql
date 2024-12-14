-- First filter arrests down to just violent. see notes

-- postgis join these to station based on distance of .25mile. 
-- This might cause arrests to expand but that's Ok. If an arrest is within 0.25miles of
--    multiple stations, count it towards all of them.

-- group by station, pd_desc and count. 