-----
Open Nearby Lockers
-----
When opening a locker door, this script will check for other nearby locker doors (radius of 8.0) and open them as well.

Locker doors that are locked (Novice or above) will not be opened

This mod will work on existing saves. You can also safely uninstall this mod without having to do NG+


-----
Requirements
-----
Plugins.txt Enabler and its requirements
https://www.nexusmods.com/starfield/mods/4157


-----
Installation
-----
Vortex/MO:
- Install via Vortex or MO2
- Make sure *OpenNearbyLockers.esm is added to Plugins.txt. You can add it manually or with a Plugins.txt Manager or the Mod Managers might do it after installing the mod. Just make sure it's there.

Manual:
- Copy the Data folder to the root Starfield game folder
- The resulting file paths should be:
*\steamapps\common\Starfield\Data\OpenNearbyLockers.esm
*\steamapps\common\Starfield\Data\scripts\lockeropener.pex
- Make sure OpenNearbyLockers.esm is added to Plugins.txt (manually or with a plugins.txt manager)


-----
Conflicts
-----
These Door records had a script and keyword added to them
0002F448	Locker01Doors
0006A4A4	Locker_Akila_Door03
0006A4A6	Locker_Akila_Door02
0006A75F	ScienceLockerDoorLower01
0006A760	ScienceLockerDoorUpper01
0007CD3A	Locker_Akila_Door01
000F72CC	ScienceLockerDoorUpper01B
003322DB	Locker_ShipBunkStorage_01_Door

The script and keyword are standalone.

I am not sure how many other mods are changing locker doors (probably not a lot), but post a comment if you run into any conflicts