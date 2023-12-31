ScriptName DoorOpener extends ObjectReference

Keyword Property doorOpenerKeyword Auto Const mandatory

GlobalVariable Property DoorOpenRadius Auto Const mandatory

Int Property maxRetries = 4 Auto Const

Event OnOpen(ObjectReference akActionRef)
  ObjectReference player = Game.GetPlayer()
  Float radius = DoorOpenRadius.GetValue()

  If (akActionRef == player)
    If (radius <= 0.0)
      radius = 8.0
    EndIf

    ObjectReference[] doors = player.FindAllReferencesWithKeyword(doorOpenerKeyword, radius)
    DebugTrace("Opening " + doors.Length + " nearby doors with radius: " + radius)

    If (doors.Length == 0)
      Int i = 1
      Int mult = 2
      While (i <= maxRetries && doors.Length == 0)
        Float retryRadius = (mult * radius)
        DebugTrace("Retrying with radius: " + retryRadius)
        
        doors = player.FindAllReferencesWithKeyword(doorOpenerKeyword, retryRadius)
        
        mult = mult * 2
        i += 1
      EndWhile
    EndIf
    
    OpenDoors(doors)
  Endif
EndEvent

Function OpenDoors(ObjectReference[] doorRefs)
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
