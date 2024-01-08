- Shrink Font Sizes
- Move Icon/Name/Description up
- Move Cost/Total to underneath Name
- Move Description to underneath Cost/Total
- Enlarge Description area so we can have paragraphs/multi-line, etc


Alter `DefineSprint 184`

Defaults:
`PlaceObject2 Depth 1 H 72 V 18` (description)
`PlaceObject2 Depth 3 H 72 V -38` (power name)
`PlaceObject2 Depth 3 H 108 V -282` (Glyph)
`PlaceObject2 Depth 7 H 72 V 108` (Cost)
`PlaceObject2 Depth 11 H 232 V 108` (Total Power)

- Move `PlaceObject2 Depth 7` and `PlaceObject2 Depth 11` to `V 8`
- Move `PlaceObject2 Depth: 1` to `V 71`


Change font size for text objects:
`Description 172, Name 174, Cost 176, Total 178`