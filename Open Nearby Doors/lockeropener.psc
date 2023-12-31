ScriptName LockerOpener extends ObjectReference

Keyword Property lockerDoorKeyword Auto Const mandatory

Float Property openRadius = 8.0 AutoReadOnly

Int Property maxRetries = 4 Auto Const

Event OnOpen(ObjectReference akActionRef)
  ObjectReference player = Game.GetPlayer()
  
  If (akActionRef == player)
    ObjectReference[] lockerDoors = player.FindAllReferencesWithKeyword(lockerDoorKeyword, openRadius)
    DebugTrace("Opening " + lockerDoors.Length + " nearby locker doors")

    If (lockerDoors.Length == 0)
      Int i = 1
      Int mult = 2
      While (i <= maxRetries && lockerDoors.Length == 0)
        Float retryRadius = (mult * openRadius)
        DebugTrace("Retrying with radius: " + retryRadius)
        
        lockerDoors = player.FindAllReferencesWithKeyword(lockerDoorKeyword, retryRadius)
        
        mult = mult * 2
        i += 1
      EndWhile
    EndIf
    
    OpenLockerDoors(lockerDoors)
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
  Debug.Trace("[OpenNearbyLockers] " + Text, 0) ; #DEBUG_LINE_NO:136
EndFunction
