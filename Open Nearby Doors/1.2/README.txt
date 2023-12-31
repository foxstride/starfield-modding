-----
Open Nearby Doors
-----
When opening a locker door, WC Stall door, or fridge/freezer door, this script will check for other nearby doors of a similar type (radius of 8.0) and open them as well. 

Doors that are locked (Novice or above) will not be opened

This mod will work on existing saves. You can also safely uninstall this mod without having to do NG+

*** I renamed the plugin to OpenNearbyDoors because it opens more than lockers now. Make sure you update Plugins.txt with the new name ***

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
- Make sure *OpenNearbyDoors.esm is added to Plugins.txt. You can add it manually or with a Plugins.txt Manager or the Mod Managers might do it after installing the mod. Just make sure it's there.

Manual:
- Copy the Data folder to the root Starfield game folder
- The resulting file paths should be:
*\steamapps\common\Starfield\Data\OpenNearbyLockers.esm
*\steamapps\common\Starfield\Data\scripts\lockeropener.pex
- Make sure OpenNearbyLockers.esm is added to Plugins.txt (manually or with a plugins.txt manager)


-----
Conflicts
-----
These Door records had a script and an existing keyword added to them
0002F448	Locker01Doors
0006A4A4	Locker_Akila_Door03
0006A4A6	Locker_Akila_Door02
0006A75F	ScienceLockerDoorLower01
0006A760	ScienceLockerDoorUpper01
0007CD3A	Locker_Akila_Door01
000F72CC	ScienceLockerDoorUpper01B
003322DB	Locker_ShipBunkStorage_01_Door

Fridge/Freezer Doors
0002F47B    Fridge01DoorBot
0002F479    Fridge01DoorTop
0013D0C0    Bar_BeerFridge01_DoorR01
0013D0C2    Bar_BeerFridge01_DoorL01
001819E0    FridgeIndustrial01_Door01
0017F3E1    FreezerIndustrial01_DoorLft
0017F3E0    FreezerIndustrial01_DoorRt

WC Stall Doors
001D5AB7    BathStall01_Door01
0003CAA1    BathStall01_Door03
0003CAA3    BathStall01_Door02

Office supply Doors
000D0515    Office_SupplyShelfDoors01




I am not sure how many other mods are changing these doors (probably not a lot), but post a comment if you run into any conflicts