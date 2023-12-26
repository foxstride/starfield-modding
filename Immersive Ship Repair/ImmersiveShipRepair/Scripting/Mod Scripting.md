Need the ability to check for parts in the ship's inventory
`idcardreader.psc` has an example of checking an object reference for an ID card:
```
Event OnActivate(ObjectReference akActionRef)
  akActionRef.GetItemCount(IDCard as Form) == 0
  # check if the player has zero key cards, if so, fail to open the door
```


`GetCurrentShipRef().GetItemCount()`

`Game.GetPlayer().GetSpaceship()` 


Will likely need to pull things from SQ_PlayerShip and its script:
`000174A2 SQ_PlayerShip` 

Repair-related
` 0003FB19 Ship Parts`
` 0005B48C Repair Hull Damage`

Will need to add a Perk to augment Ship Repair Parts magnitude and duration
See Medicine for example
` 002CE2DF Skill_Medicine`

