# How to use osu! offline switcher

Why does the switcher need administrator?
----------------------------------------------------------------------------------
The switcher needs access to a specific rule that you will make (refer to setup)
Alternatively, you may use the firewall rule setup bat file if you're too lazy to do the setup on your own.
If you choose to use the setup bat file, read the "FIREWALL SETUP README.txt" file.

The switcher will enable or disable the rule that blocks osu!'s access to the internet, but 
it can't do so without administrator access.

SETUP (MANUAL) (Scroll down for automatic setup)
-----------
-Open windows firewall through control panel

-Press "Advanced Settings"

-Go to "Outbound Rules"

-Press "New Rule"

-Press Program and Next

-Find your osu! path 
ex. C:\Users\4321\AppData\Local\osu!\osu!.exe
(Replace 4321 with your user)
(make sure to put \osu!.exe in the end)

-Press Next

-Select "Block the connection"

-Press Next twice

-Set the name to "osuoffline"
(description is optional)

FIREWALL SETUP (AUTOMATIC)
---------------------------
 RUN THE FIREWALL RULE SETUP ONLY ONCE. EXCEPT IF THE RULE IN THE FIREWALL ISN'T CORRECT. IF SO, THEN DELETE THE RULE AND ONCE DONE, RUN IT AGAIN.
 I AM NOT RESPONSIBLE FOR ANY DAMAGES IN YOUR SYSTEM. 

-Open the .bat file named "Firewall Rule Setup.bat".

-Find your osu! path 
ex. C:\Users\4321\AppData\Local\osu!
(Replace 4321 with your user [eg. HP])

-Copy your osu! path

-Right click and paste your osu! path.
(Make sure to put "\osu!.exe" in the end! Without this, the switcher will NOT work.)

-Press Enter, if it says it worked, please test the switcher. If it doesn't, please refer to the IMPORTANT section.

-The setup will add a rule to your firewall that allows the switcher to work.


IMPORTANT
------------------

In order to make sure that the rule created is correct, please check by checking the firewall itself.

More details in the section below.

HOW TO CHECK FIREWALL RULE
---------------------------

-Open windows firewall through control panel

-Press "Advanced Settings"

-Go to "Outbound Rules"

-If you see the rule "osuoffline", right click it and press "Properties"

-Once in "Properties", select "Programs and Services".

-You will see your directory in the "Programs" section. Check if this directory leads to your osu!.exe file.
(MAKE SURE YOU DIDN'T FORGET TO ADD "\osu!.exe"!!! IF YOU DIDN'T, NOW'S YOUR CHANCE TO ADD IT.)

-If it does lead to your osu!.exe file, then you are now allowed to use the switcher. Enjoy!
