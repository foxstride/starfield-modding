ScriptName LockerOpener extends ObjectReference

Form Property scienceLockerDoorLower01Ref Auto Const mandatory
Form Property scienceLockerDoorUpper01Ref Auto Const mandatory

Float Property radius = 8.0 AutoReadOnly

Event OnActivate(ObjectReference akActionRef)
  
EndEvent

Event OnOpen(ObjectReference akActionRef)
  ObjectReference player = Game.GetPlayer()
  
  If (akActionRef == player)
    ObjectReference[] scienceLockerLowerDoors = player.FindAllReferencesOfType(scienceLockerDoorLower01Ref, radius)
    ObjectReference[] scienceLockerUpperDoors = player.FindAllReferencesOfType(scienceLockerDoorUpper01Ref, radius)

    Int amountOpened = scienceLockerLowerDoors.Length + scienceLockerUpperDoors.Length
    DebugTrace("Opening " + amountOpened + " nearby locker doors")
    
    OpenLockerDoors(scienceLockerLowerDoors)
    OpenLockerDoors(scienceLockerUpperDoors)
  Endif
EndEvent

Function OpenLockerDoors(ObjectReference[] doorRefs)
  Int i = 0
  While i < doorRefs.Length
    SetOpenedIfNotOpened(doorRefs[i])
    i += 1
  EndWhile
EndFunction

Function SetOpenedIfNotOpened(ObjectReference doorRef)
  If (doorRef != None)
    Int openState = doorRef.GetOpenState()
    If (!doorRef.IsLocked() && (openState == 3)) ; #DEBUG_LINE_NO:112
      doorRef.SetOpen(True) ; #DEBUG_LINE_NO:113
    EndIf
  EndIf
EndFunction

Function DebugTrace(String Text) Global
  Debug.Trace("[LockerOpener] " + Text, 0) ; #DEBUG_LINE_NO:136
EndFunction
