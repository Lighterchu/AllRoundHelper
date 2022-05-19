#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
; Gui, AllRound:Color,, 000000
Gui, AllRound:Color,C0C0C0
gui AllRound:+AlwaysOnTop
Gui, AllRound: Show, w700 h430 ,All Round Helper v1.0.0



;-------------------------Call Tracker---------------------------------------
Gui, AllRound:Add, Button, Default x10  w100 h30 gManualLeavingMessage vleftMsg ,Manual Leave message
Gui, AllRound:Add, Button, Default x+10 w100 h30 gEndingCalling vendCall ,End Call
Gui, AllRound:Add, Button, Default x12 y2 w100 h30 gTrack vtracking ,Track Calls
Gui, AllRound:Add, Button, Default x500 y2 w100 h30 ,Settings


Gui, AllRound:Add, ListView, vCallsList x0  h50 w700 , Calls|NBN|Moblies|VoIP


GuiControl, AllRound: hide, leftMsg
GuiControl, AllRound: hide, endCall



global calls := 0
nbnSales := 0
AutoCall := 0
global matchingLeads 
global trackerActive := false



ManualLeavingMessage()
{
    
    EndCallTracker()

    
}


EndingCalling()
{
 
 EndCallTracker()
	
}
EndCallTracker() {
	calls++

    Gui, ListView, CallsList
	LV_Modify("Tracking",,calls)
}


Track()
{
  trackerActive = true
    GuiControl, AllRound: show, leftMsg
    GuiControl, AllRound: show, endCall
    GuiControl, AllRound: hide, tracking
 
  Gui, ListView, CallsList
  LV_Add("calls", 0,0,0,0)
 
}

ShowReloInfomation(toggle){
    
        GuiControl, %toggle%, ReloCustNameTitle
        GuiControl, %toggle%, ReloCustName
        GuiControl, %toggle%, ReloOlderAddressTitle
        GuiControl, %toggle%, ReloOlderAddress
        GuiControl, %toggle%, ReloNewAddressTitle
        GuiControl, %toggle%, ReloNewAddress
        GuiControl, %toggle%, ReloCallBackToCLose
        GuiControl, %toggle%, ReloHasTechAppointment
        GuiControl, %toggle%, ReloHasFetch
        GuiControl, %toggle%, ReloHasMoblies
        GuiControl, %toggle%, ReloHasDisconnectingDate
        GuiControl, %toggle%, ReloHasTechAppointment
        GuiControl, %toggle%, ReloCallBackToCLose
        GuiControl, %toggle%, ReloConnectionDate
        GuiControl, %toggle%, ReloDateTimeConnection
        GuiControl, %toggle%, ReloDiconnectionDate
        GuiControl, %toggle%, ReloDateTimeDiconnect
}

ShowReloInfomation("Hide")


;----------------------------------------------------------------

;-----------------Templates--------------------------------
; Gui, AllRound: Add, Text, section xm w80, Template:
Gui, AllRound: Add, DropDownList,  w182 x250  vTemp gChangeTemplate  AltSubmit, Please Pick Template || Relocation| Addy Update| Relocation| Addy Update|

    Gui, AllRound: Add, Text, section xm w80 vReloCustNameTitle,Customer Name:
    Gui, AllRound: Add, Edit, vReloCustName w200 ys
    Gui, AllRound: Add, Text, section xm w80 vReloOlderAddressTitle,Current Address:
    Gui, AllRound: Add, Edit, vReloOlderAddress w200 ys
    Gui, AllRound: Add, Text, section xm w80 vReloNewAddressTitle,New Address:
    Gui, AllRound: Add, Edit, vReloNewAddress w200 ys

    Gui, AllRound: Add, CheckBox, vReloCallBackToCLose x5  ,Tick this if they have to callback to close service?
    Gui, AllRound: Add, CheckBox, vReloHasTechAppointment  , Tick this if they have tech appointment?
    Gui, AllRound: Add, CheckBox, vReloHasFetch , Tick this if they have a Fetch Boxes?
    Gui, AllRound: Add, CheckBox, vReloHasMoblies , Tick this if they have a Mobiles?
    Gui, AllRound: Add, CheckBox, vReloHasDisconnectingDate  , Tick this if they have a disconnecting date?
    
    GuiControl, AllRound: show, ReloHasTechAppointment
    GuiControl, AllRound: show ,ReloCallBackToCLose
   
    Gui, AllRound: Add, Text, section xm w100 vReloConnectionDate,Connection date:
    Gui, AllRound: Add, DateTime, vReloDateTimeConnection, dd/MM/yyyy
    Gui, AllRound: Add, Text, section xm w100  vReloDiconnectionDate,Disconnect date:
    Gui, AllRound: Add, DateTime, vReloDateTimeDiconnect, dd/MM/yyyy
   

    GuiControl, Allround:hide, ReloCustNameTitle
    GuiControl, Allround:hide, ReloCustName
    GuiControl, Allround:hide, ReloOlderAddressTitle
    GuiControl, Allround:hide, ReloOlderAddress
    GuiControl, Allround:hide, ReloNewAddressTitle
    GuiControl, Allround:hide, ReloNewAddress
    GuiControl, Allround:hide, ReloCallBackToCLose
    GuiControl, Allround:hide, ReloHasTechAppointment
    GuiControl, Allround:hide, ReloHasFetch
    GuiControl, Allround:hide, ReloHasMoblies
    GuiControl, Allround:hide, ReloHasDisconnectingDate
    GuiControl, Allround:hide, ReloHasTechAppointment
    GuiControl, Allround:hide, ReloCallBackToCLose
    GuiControl, Allround:hide, ReloConnectionDate
    GuiControl, Allround:hide, ReloDateTimeConnection
    GuiControl, Allround:hide, ReloDiconnectionDate
    GuiControl, Allround:hide, ReloDateTimeDiconnect
    
;----------------------------------------------------------------



;----------------Coms Tracker Part------------------

;Gui, AllRound:Color,, 000000
; Gui, Font,, Lucida Fax


; Gui, AllRound:Add, Text,cRed , Track Your Coms, Put You're Heart Towards Sales
; Gui,  AllRound:Add, Text,cblue y5 x+100 , beta Version 1.0.2





Gui, +AlwaysOnTop
global oldComs = := []
global CurrentComs := []


Gui,  AllRound:Add, Tab3, x0 y120 w700 h200 vToggle1, NBN|HARDWARE|MOBILE SIMS DATA ONLY|MOBILE SIMS VOICE AND DATA|5G MOBILE VOICE AND DATA|VOIP PHONE|MOBILE HANDSETS|
; ;Gui, Show, w520 h580, OutBounder Comms Tracker,Gui



;-------NBN


Gui, tab, 1
Gui,  AllRound:Add, Button,   w100 h30 y+1 gnbn25Btn vbtn25 ,25/10 NBN 
Gui,  AllRound:Add, Text, x+10 cRed , Plan For 75/20
Gui,  AllRound:Add, DropDownList, gPicked75/20 AltSubmit vMidPlanNBN,75/20 500GB| 75/20 Unlimited|
Gui,  AllRound:Add, Button,   w100 h30 y+0.1 x12 gnbn250/25Btn vbtn250 ,250/25 NBN 
Gui,  AllRound:Add, Text,  x+10 cRed , Plan For 100/20
Gui,  AllRound:Add, DropDownList,gPicked100/20 AltSubmit vFamilyNBN,100/20 500GB| 100/20 Unlimited|
Gui,  AllRound:Add, Button,   w100 h30 y+0.1 x12 gnbn250/100Btn vbtn100 ,250/100 NBN 
Gui,  AllRound:Add, Text, x+10 cRed , Plan For 100/40
Gui,  AllRound:Add, DropDownList, gPicked100/40 AltSubmit vFamilyPlusNBN ,100/40 500GB| 100/40 Unlimited|
Gui,  AllRound:Add, Button,   w100 h30 y+0.1 x12 gnbn1000/50Btn vbtn1000 ,1000/50 NBN 






;
;
; 
;

;--------HARDWARE----------------

Gui,  AllRound:tab, 2
Gui,  AllRound:Add, Button,   w100 h30  gNF, NF18MESH 
Gui,  AllRound:Add, Button,   w100 h30 x+10 gNL ,NL1901
Gui,  AllRound:Add, Button,   w100 h30  x+10  gNest1 ,Nest 1 pack 
Gui,  AllRound:Add, Button,   w100 h30 gNest2 x13 y+10 ,Nest 2 pack 
Gui,  AllRound:Add, Button,   w100 h30 x+10 gNest3, Nest 3 pack 
Gui,  AllRound:Add, Button,   w100 h30  x+10 gMini,Fetch Mini
Gui,  AllRound:Add, Button,   w100 h30 y+10 x13 gMighty, Fetch Mighty

;--------------------------------

;----------MOBILES SIMS DATA ONLY-------


Gui,  AllRound:tab, 3
Gui,  AllRound:Add, Button,   w100 h30 x5 y+5 gB5GB, 4G DATA Bundled 5GB 
Gui,  AllRound:Add, Button,   w100 h30 x+10  gB25GB ,4G DATA Bundled 25GB
Gui,  AllRound:Add, Button,   w100 h30 x+10  gB40GB,4G DATA Bundled 40GB
Gui,  AllRound:Add, Button,   w100 h30 x+10 gB60GB,4G DATA Bundled 60GB
Gui,  AllRound:Add, Button,   w100 h30 x+10 gB100GB,4G DATA Bundled 100GB

Gui,  AllRound:Add, Button,   w100 h40 y+10 x5  gS25GB , 4G DATA Standalone 2.5GB
Gui,  AllRound:Add, Button,   w100 h40 x+10 gS15GB , 4G DATA Standalone 15GB
Gui,  AllRound:Add, Button,   w100 h40 x+10 gS30GB , 4G DATA Standalone 30GB
Gui,  AllRound:Add, Button,   w100 h40 x+10 gS50GB , 4G DATA Standalone 50GB
Gui,  AllRound:Add, Button,   w100 h40 x+10 gS80GB , 4G DATA Standalone 80GB

;----------------------------------------

;-----------MOBILE SIMS VOICE AND DATA-------------


Gui,  AllRound:tab, 4

Gui,  AllRound:Add, Button,   w100 h30 x5 y+5 gV2G , 4G Voice Bundled 2GB 
Gui,  AllRound:Add, Button,   w100 h30 x+10  gV5G , 4G Voice Bundled 5GB 
Gui,  AllRound:Add, Button,   w100 h30 x+10 gV25G  ,4G Voice Bundled 25GB
Gui,  AllRound:Add, Button,   w100 h30 x+10 gV40G ,4G Voice Bundled 40GB
Gui,  AllRound:Add, Button,   w100 h30 x+10  g50G ,4G Voice Bundled 60GB
Gui,  AllRound:Add, Button,   w100 h30 x+10  g1005G ,4G Voice Bundled 100GB

Gui,  AllRound:Add, Button,   w100 h40 y+10 x5gVS1G , 4G Voice Standalone 1GB
Gui,  AllRound:Add, Button,   w100 h40 x+10 gVS25G , 4G Voice Standalone 2.5GB
Gui,  AllRound:Add, Button,   w100 h40 x+10 gVS15G , 4G Voice Standalone 15GB
Gui,  AllRound:Add, Button,   w100 h40 x+10 gVS30G , 4G Voice Standalone 30GB
Gui,  AllRound:Add, Button,   w100 h40 x+10 x5 gVS50G , 4G Voice Standalone 50GB
Gui,  AllRound:Add, Button,   w100 h40 x+10 gVS80G , 4G Voice Standalone 80GB






;--------------------------------------------------------

;-----------5G MOBILE SIMS VOICE AND DATA-------------


Gui,  AllRound:tab, 5

Gui,  AllRound:Add, Button,   w100 h30 y+5 g5G10GB, S 5G 10GB
Gui,  AllRound:Add, Button,   w100 h30 x+10 g5G50GB  , M 5G 50GB
Gui,  AllRound:Add, Button,   w100 h30 x+10  g5G80GB ,L 5G 80B





;#--------------------------------------------------------


;-----------VOIP PHONE-------------


Gui,  AllRound:tab, 6

Gui,  AllRound:Add, Button,   w100 h30 y+5 gCas, Casual
Gui,  AllRound:Add, Button,   w100 h30 x+10 gEvery , Everyday
Gui,  AllRound:Add, Button,   w100 h30 x+10  gInternational ,International





;#--------------------------------------------------------


;-----------MOBILE HANDSETS-------------


Gui,  AllRound:tab, 7

Gui,  AllRound:Add, Button,   w100 h30 y+5 x+3 gLG,  LG any available model
Gui,  AllRound:Add, Button,   w100 h30 x+10 gA12 ,Samsung A12
Gui,  AllRound:Add, Button,   w100 h30 x+10 gA51,Samsung A51
Gui,  AllRound:Add, Button,   w100 h30 x+10 gA71 ,Samsung A71
Gui,  AllRound:Add, Button,   w100 h30 x+10 gS128GB ,Samsung Note or Galaxy 128GB

Gui,  AllRound:Add, Button,   w100 h40 x5 y+5 gS256GB, Samsung Note or Galaxy 256GB
Gui,  AllRound:Add, Button,   w100 h40 x+10  gS512GB, Samsung Note or Galaxy 512GB




;#--------------------------------------------------------


Gui,  AllRound:tab,




Gui,  AllRound:Add, Text, vToggleComsText x20 y330 cRed , Total Coms: 
Gui,  AllRound:Add, Edit, r1 vtotalAmount x130 y330 w100 +ReadOnly, 


; Gui, Add, Text, x20 y500 cRed , Edit Total Coms: 
; Gui, Add, Edit, r1 vEdittotalAmount x130 y500 w100,
;Gui, Add, Button, w100 h40 y540 x0 gSaveBtn, Save Edit
Gui,  AllRound:Add, Button, vToggleUndoBtn w100 h40 y390 x0 gUndoBtn, Undo last Comms
Gui,  AllRound:Add, ListView, vToggleComsList r20 w450 h100 x250 y330, Coms      |Sold Item










global amountTotal
ToggleComsTracker("Toggle1",true)

Return 


;#----------------------------------------------

;#--------------------FUNCTIONS--------------------------
AddToTotal(amount,item = "nothing")
{
     amount :=  RegExReplace(amount, "\d\K(?=\d{3}(\.|,))", ",")
  
  
    amountTotal += %amount%
    ;msgBox % amountTotal
    CurrentComs.Push(amountTotal)
    udatingComsHistoyFile(amountTotal, item)
    GuiControl, , totalAmount, $%amountTotal%
    LiveUpdateComs(amountTotal, item)
 
}

ToggleComsTracker(value,toggle){
    if(toggle){
        GuiControl, AllRound: show, %value%
        GuiControl, AllRound: show, ToggleComsList
        GuiControl, AllRound: show, ToggleUndoBtn
        GuiControl, AllRound: show, totalAmount
        GuiControl, AllRound: show, ToggleComsText
       return
    }
    
    GuiControl, AllRound: hide, %value%
    GuiControl, AllRound: hide, ToggleComsList
    GuiControl, AllRound: hide, ToggleUndoBtn
    GuiControl, AllRound: hide, totalAmount
    GuiControl, AllRound: hide, ToggleComsText
  
   
}


LiveUpdateComs(amount, item){
    
    Gui, ListView, ToggleComsList
    LV_Add(,"$" + amount,item)
}
RemoveFromList(){
   Gui, ListView, ToggleComsList
   removing :=  LV_GetCount()
    LV_Delete(removing)  ; Clear the row from the ListView.
}



udatingComsHistoyFile(amount,item){
    ComsHistory := "%A_WorkingDir%\ComsHistory.txt"
    if(FileExist(ComsHistory)){
            if WinExist("ComsHistory.txt - Notepad"){
            WinClose ; Use the window found by WinExist.
            FileAppend, $%amount% %item% `n, %A_WorkingDir%\ComsHistory.txt
            run, %A_WorkingDir%\ComsHistory.txt
        }
    }else{
        ;Making the coms file
        FileAppend, $%amount% %item% `n, %A_WorkingDir%\ComsHistory.txt
    }
}

UndoBtnFunction(){
    CurrentComs.pop()
    NewUpdateComs := CurrentComs[CurrentComs.MaxIndex()]
    amountTotal := NewUpdateComs
    GuiControl, , totalAmount, $%NewUpdateComs%
    RemoveFromList()
    
}






UndoBtn:
   UndoBtnFunction()
   return




SaveBtn:
    Gui, submit, nohide
    amountTotal = %EdittotalAmount%
    CurrentComs.Push(amountTotal)
    GuiControl, , totalAmount, $%EdittotalAmount%
    
    
return




;--------------------------------
global NbnNumber = 0
AddToNBNCounter(){
    NbnNumber := NbnNumber +
    msgBox, %NbnNumber%
    LV_Modify("Tracking",,NbnNumber)
}
LV_Modify("Tracking",,calls)

;----NBN LOGIC----

Picked50/20:  
 GuiControlGet, EverydayNBN	
 if( EverydayNBN = 1 ) {
	AddToTotal(3, "50/20 NBN 500GB")
 }else {
	AddToTotal(4.5, "50/20 NBN Unlimted")
    
 }
 return
 
 Picked75/20:  

 GuiControlGet, MidPlanNBN	
 if( MidPlanNBN = 1 ) {
	AddToTotal(3.75, "75/20 NBN 500GB" )
 }else {
	AddToTotal(5.25, "75/20 NBN Unlimted")
    AddToNBNCounter()
 }
 return
 
 Picked100/20:  
 
  GuiControlGet, FamilyNBN	
 if( FamilyNBN = 1 ) {
	AddToTotal(4.5, "100/20  NBN 500GB")
 }else {
	AddToTotal(6, "100/20 NBN Unlimited")
 }
 return
 
 
 Picked100/40:  
  GuiControlGet, FamilyPlusNBN	
 if( FamilyPlusNBN = 1 ) {
	AddToTotal(4.5, " 100/40 NBN 500GB")
 }else {
	AddToTotal(6, " 100/40 NBN Unlimted")
 }
 return

nbn25Btn:
	
    
	AddToTotal(3, "25/10 NBN")
    return

 
nbn250/25Btn:
	
    
	AddToTotal(10.50, "250/25 NBN")
    return


nbn250/100Btn:
	
    
	AddToTotal(10.50, "250/100 NBN")
    return

nbn1000/50Btn:
	
    
	AddToTotal(13.50, "1 GIG NBN")
    return



;-----------------------------------------
;-----------------Hardware Logic-----------------------

NF:
	
    AddToTotal(3, "NF18Mesh")
    return
NL:
	
    
	AddToTotal(4.50, "NF18ACV")
    return
Nest1:
	
	AddToTotal(3, "Google Nest")
    return
Nest2:
	
    
	AddToTotal(4.50, "Google Nest 2 Pack")
    return

Nest3:
	

	AddToTotal(7.50, "Google Nest 3 Pack")
    return



Mini:
	
    
	AddToTotal(7.50, "Mini")
    return
Mighty:
	
    
	AddToTotal(7.50, "Mighty")
    return



;-----------------MOBILES SIMS DATA ONLY LOGIC -----------------------

;--bundle sims---
B5GB:
	AddToTotal(6, "Mobile Sim Data Only 5GB ")
    return

B25GB:
	AddToTotal(12, "Mobile Sim Data Only 25GB ")
    return

B40GB:
	AddToTotal(15, "Mobile Sim Data Only 40GB ")
    return

B60GB:
	AddToTotal(15, "Mobile Sim Data Only 60GB ")
    return

B100GB:
	AddToTotal(15,"Mobile Sim Data Only 100GB ")
    return
;--------
;-Stand alone

S25GB:
	AddToTotal(4.50, "Mobile Sim Data Only 25GB (Stand Alone) ")
    return

S15GB:
	AddToTotal(6, "Mobile Sim Data Only 15GB (Stand Alone) ")
    return

S30GB:
	AddToTotal(7.50, "Mobile Sim Data Only 30GB (Stand Alone) ")
    return

S50GB:
	AddToTotal(7.50, "Mobile Sim Data Only 50GB (Stand Alone) ")
    return

S80GB:
	AddToTotal(7.50, "Mobile Sim Data Only 80GB (Stand Alone) ")
    return
;---

;-----------------------------------------
;-----------------MOBILE SIMS VOICE AND DATA LOGIC -----------------------

;--bundle sims---
V2G:
	AddToTotal(6, "4G Voice and Data, 2GB")
    return

V5G:
	AddToTotal(6, "4G Voice and Data, 5GB")
    return

V25G:
	AddToTotal(12, "4G Voice and Data, 25GB")
    return

V40G:
	AddToTotal(15, "4G Voice and Data, 40GB")
    return

50G:
	AddToTotal(15, "4G Voice and Data, 50GB")
    return

1005G:
	AddToTotal(15, "4G Voice and Data, 100GB")
    return
;--------
;-Stand alone

VS1G:
	AddToTotal(3, "4G Voice and Data, 1GB (Standalone)")
    return

VS25G:
	AddToTotal(4.50, "4G Voice and Data, 2.50GB (Standalone)")
    return

VS15G:
	AddToTotal(6, "4G Voice and Data, 15GB (Standalone)")
    return

VS30G:
	AddToTotal(7.50, "4G Voice and Data, 30GB (Standalone)")
    return

VS50G:
	AddToTotal(7.50, "4G Voice and Data, 50GB (Standalone)")
    return

VS80G:
	AddToTotal(7.50, " 4G Voice and Data, 80GB (Standalone)")
    return
;---




;-----------------------------------------
;-----------5G MOBILE SIMS VOICE AND DATA-------------
5G10GB:
	AddToTotal(12, "5G SIM Voice and Data (10GB) ")
    return

5G50GB:
	AddToTotal(12, "5G SIM Voice and Data (50GB) ")
    return

5G80GB:
	AddToTotal(12,"5G SIM Voice and Data (80GB) ")
    return

;-----------------------------------------
;-----------VOIP PHONE-------------

Cas:
	AddToTotal(12,"Casual")
    return

Every:
	AddToTotal(12,"EveryDay")
    return

International:
	AddToTotal(12,"International")
    return

;-----------------------------------------
;-----------MOBILE HANDSETS-------------


LG:
	
    AddToTotal(15, "HandSet LG")
    return
A12:
	
    
	AddToTotal(15, "HandSet A12")
    return
A51:
	
	AddToTotal(15, "HandSet A51")
    return
A71:
	
    
	AddToTotal(15,"HandSet A71")
    return

S128GB:
	

	AddToTotal(15, "HandSet Samsung 128GB")
    return
S256GB:
	
    
	AddToTotal(15, "HandSet Samsung 256GB")
    return
S512GB:
	
    
	AddToTotal(15,"HandSet Samsung 512GB")
    return

;-----------------------------------------

;---------Template Functions--------------------------------
DefaultPosition(){
    GuiControl, Move, Toggle1, y120
    GuiControl, Move, ToggleComsText, y330
    GuiControl, Move, totalAmount, y330
    GuiControl, Move, ToggleUndoBtn, y390
    GuiControl, Move, ToggleComsList, y330
    WinMove,A,,,,,460
    return 
}


moveComsGui(moveComs){
    if(moveComs){
        GuiControl, Move, Toggle1, y400
        GuiControl, Move, ToggleComsText, y640
        GuiControl, Move, totalAmount, y640
        GuiControl, Move, ToggleUndoBtn, y670
        GuiControl, Move, ToggleComsList, y600
        WinMove,A,,,,,740
        return
    }
    DefaultPosition()

}

CheckTemplate(){
    GuiControlGet, Temp,
      if(Temp == 1){
          ShowReloInfomation("Hide")
          moveComsGui(false)
        return
    }
    if(Temp == 2){
        ShowReloInfomation("Show")
        GuiControl, Move, Toggle1, y400
        moveComsGui(true)
        return
    }
    if(Temp == 3){
        ShowReloInfomation("show")
         moveComsGui(true)
        return
    }
    
    
    
}
ChangeTemplate:
    CheckTemplate()
    
    