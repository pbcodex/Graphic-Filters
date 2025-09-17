
IncludeFile "filtres.pbi"
UseModule filtres


;---------------------------------------------------------

#img1 = 1
#img2 = 2
#img3 = 3
#save = 4
#save2 = 5
#quit = 6
#mask_e = 7
#mask_d = 8
#mask_n = 9
#copy1 = 10
#copy2 = 11
#copy3 = 12

#source1 = 1
#source2 = 2
#mask = 3
#miniature = 4
#cible = 5
#Black_image = 6
#tempo = 7
#cible_aff = 8

Global image_selected = -1

mask_enable = 0

#filtre_pos = 1000
#filtre_windows_pos = #filtre_pos + 1000

Structure filtre
  name.s
  pos.i
  Array opt.s(9,9)
  Array c3.s(99)
EndStructure
Global NewList list_filtre.filtre()

Structure windows
  name.s
  id_fenetre.i
  id_filtre.i
  item.i
  opt.i[20]
EndStructure
Global NewList list_windows.windows()

Global lg , ht
Global tx , ty
Global scx.f , scy.f
Global px , py
Global imagetx , imagety
Global pym
Global lgi ,hti

Global windows_id
;----------


Procedure draw_miniature(image , pos)
  If Not IsImage(image) : ProcedureReturn : EndIf
  If IsImage(#miniature) : FreeImage(#miniature) : EndIf
  CopyImage(image,#miniature)
  ResizeImage(#miniature,tx,ty)
  StartDrawing(WindowOutput(0))
  DrawImage(ImageID(#miniature) , px , py + (pym * pos + 10) * scy)
  StopDrawing()
  FreeImage(#miniature)
EndProcedure

Procedure draw_miniature_selected()
  StartDrawing(WindowOutput(0))
  For i = 0 To 2
    x = px - 2
    y = (py + (pym * i + 10) * scy) - 2 
    If  i = image_selected : col = $ff00 : Else : col = $7f7f7f : EndIf
    Box(x , y , tx + 2, 2 , col)
    Box(x , y , 2 , ty + 2, col)
    Box(x + tx + 2 , y , 2 , ty + 2, col)
    Box(x , y + ty + 2 , tx + 2 , 2, col)
  Next
  
  var = image_selected + 1
  If IsImage(var)
    CopyImage(var , #cible_aff)
    ResizeImage(#cible_aff,imagetx * scx , imagety * scy , #PB_Image_Raw)
    DrawImage(ImageID(#cible_aff), (lg/10 + 5) * scx , py * scy)
    FreeImage(#cible_aff)
  EndIf
  
  StopDrawing()
EndProcedure

Procedure load_img(var)
  file$ = OpenFileRequester("Image","","",0)
  ;If LoadImage(var,file$) = 0
  If load_image_32(var,file$) = 1 
    If var = #source1 ; charge l'image 1
      lgi = ImageWidth(#source1)
      hti = ImageHeight(#source1)
      If IsImage(#source2)  : FreeImage(#source2) : draw_miniature(#black_image,1) : EndIf
      If IsImage(#mask) : FreeImage(#mask) : draw_miniature(#black_image,2) : EndIf
      If IsImage(#cible) : FreeImage(#cible) : EndIf; efface la cible
      CreateImage(#cible , lgi , hti , 32)
    Else
      ResizeImage(var,lgi ,hti)
    EndIf   
    draw_miniature(var,var-1)
  EndIf
EndProcedure

Procedure copy_image(var)
  If Not IsImage(var)
    If var = #source1 : ProcedureReturn 
    Else
      If Not IsImage(#source1) : ProcedureReturn : EndIf
      CopyImage(#source1,var)
    EndIf
  EndIf
  *source = 0
  *cible = 0
  If IsImage(var) And StartDrawing(ImageOutput(var)) : *source = DrawingBuffer() : StopDrawing() : EndIf
  If IsImage(#cible) And StartDrawing(ImageOutput(#cible)) : *cible = DrawingBuffer() : StopDrawing() : EndIf
  lg0 = ImageWidth(var)
  ht0 = ImageHeight(var)     
  If *source <> 0 And *cible <> 0
    CopyMemory(*cible , *source , lg0 * ht0 * 4)
    draw_miniature(var , var - 1)
  EndIf
EndProcedure

;----------

Procedure create_menu_filtre()
  
  MenuTitle("Filtre")
  mem = -1
  param\info_active = 1
  For i = 0 To 999
    If tabfunc(i) <> 0
      CallCFunctionFast(tabfunc(i),param)
      If param\typ <> mem
        mem = param\typ
        ;CloseSubMenu()
        Select param\typ
          Case #Filter_Type_Blur
            ;CloseSubMenu()
            OpenSubMenu("Blur")
          Case #Filter_Type_Edge_Detection
            CloseSubMenu()
            OpenSubMenu("Edge_Detection")
          Case #Filter_Type_Color
            CloseSubMenu()
            OpenSubMenu("Color")
          Case #Filter_Type_Dither
            CloseSubMenu()
            OpenSubMenu("Dither")
          Case #Filter_Type_FX
            CloseSubMenu()
            OpenSubMenu("FX")
          Case #Filter_Type_Convolution
            CloseSubMenu()
            OpenSubMenu("Convolution")
          Case #Filter_Type_Deform
            CloseSubMenu()
            OpenSubMenu("Deform")
          Case #Filter_Type_Color_Space
            CloseSubMenu()
            OpenSubMenu("Color_Space")  
          Case #Filter_Type_autre
            CloseSubMenu()
            OpenSubMenu("test")   
          Case #Filter_Type_mix
            CloseSubMenu()
            OpenSubMenu("Mix") 
          Default
            CloseSubMenu()
            OpenSubMenu("Autres")
        EndSelect
      EndIf
      MenuItem(i + #filtre_pos,Str(i) + " - " +param\name)
      
    EndIf
  Next
  param\info_active = 0
  
EndProcedure

;----------

Procedure open_windows(pos) 
  
  Dim w_info.s(20)
  Dim w_data.l(20,3)
  
  ; test si il y a deja des fentres ouvertes
  If ListSize(list_windows()) < 1 : windows_id = 1 : EndIf
  
  AddElement(list_windows())
  list_windows()\id_fenetre = windows_id
  list_windows()\id_filtre = pos ; numero du filtre
  windows_id + 1
  
  lgy = 60
  name$ = ""
  
  ;demande d'info au filtre
  Clear_Data_Filter(param) ; met a 0 tous les parametres de la structure des filtres
  param\info_active = 1
  If tabfunc(list_windows()\id_filtre) <> 0 : CallCFunctionFast(tabfunc(list_windows()\id_filtre),param) : EndIf ; recupere les paramtres par defaut du filtre
  If param\name <> "" 
    name$ = param\name 
    
    If LCase(Trim(param\name)) = "convolution3x3"
      lgy = 9 * 30
    Else
      
      For i = 0 To 19
        w_info(i) = param\info[i]
        If w_info(i) = "" : lgy = (i + 2) * 25: Break : EndIf
        w_data(i,0) = param\info_data(i,0)
        w_data(i,1) = param\info_data(i,1)
        w_data(i,2) = param\info_data(i,2)
        ;t$ = w_info(i) + " : " + Str(w_data(i,0)) + " : " + Str(w_data(i,1)) + " : " + Str(w_data(i,2)) : Debug t$
      Next
    EndIf
  EndIf
  param\info_active = 0
  
  list_windows()\name = "Window " + " " + Str(list_windows()\id_fenetre) + "     Filtre " + list_windows()\id_filtre + " :  " + name$
  
  If OpenWindow(list_windows()\id_fenetre, 0, 0, 500, lgy, list_windows()\name, #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
    StickyWindow(list_windows()\id_fenetre,#True)
    
    If LCase(Trim(param\name)) = "convolution3x3"
      
      For y = 0 To 2
        For x = 0 To 2
          i = y * 3 + x 
          np = #filtre_windows_pos + (list_windows()\id_fenetre * 200) +  i 
          StringGadget(np , 10 + x * 45, 10 + y * 25 , 40 , 20 ,"")
        Next
      Next
      StringGadget(np + 1 , 10 + 45 , 10 + 75 , 40 , 20 ,"")
      StringGadget(np + 2 , 10 + 45 , 10 + 100 , 40 , 20 ,"")
      TextGadget(  np + 3 , 10      , 10 + 75 , 40 , 20 ,"DIV")
      TextGadget(  np + 4 , 10     , 10 + 100 , 40 , 20 ,"ADD")
      
      ComboBoxGadget(np + 5, 200, 10, 250, 25 ) 
      For i= 0 To 99
        param\info_active = i + 2
        CallCFunctionFast(tabfunc(list_windows()\id_fenetre),param)
        If param\name <> ""
          AddGadgetItem(np + 5 , -1 , Str(i + 1) + "___" + param\name)
        Else
          param\info_active = 0
          Break
        EndIf
      Next
      
    Else 
      
      pos = #filtre_windows_pos + (list_windows()\id_fenetre * 200)
      decal = 0
      If param\remarque <> ""
        decal = 1
        TextGadget( pos + 9 , 5 , 5 , 490 , 25 , param\remarque,#PB_Text_Center | #PB_Text_Border)
      EndIf
      
      For i = 0 To 19
        ; 200 = decalage entre chaque fenetre ; une fenetre peut contenir 20 gadgets
        ; 10 = decalage entre chaque option , un gadget peut avoir 10 options
        np = pos + ( i * 10 ) 
        posy = i + decal
        If w_info(i) <> ""
          If w_data(i,1) - w_data(i,0) = 1 ; 1 CheckBoxGadget
            CheckBoxGadget(np + 0, 5 , 5 + posy * 25, 100 , 25 , w_info(i) )
          Else ; 1 TrackBarGadget (1 ligne = 5 gadgets)
            TrackBarGadget(np + 0 , 150 , 5 + posy * 25 , 250 , 25 , w_data(i,0) , w_data(i,1) ) ; gadget
            SetGadgetState(np + 0 ,  w_data(i,2) )                                               ; met le TrackBarGadget a la valeur par defaut
            TextGadget(    np + 1,   5  , 5 + posy * 25 , 120 , 25 , w_info(i) )                 ; nom du gadget
            TextGadget(    np + 2,  115 , 5 + posy * 25 , 35 , 25 , Str(w_data(i,0))  ,#PB_Text_Right ) ; valeur min
            TextGadget(    np + 3, 405 , 5 + posy * 25 , 35 , 25 , Str(w_data(i,1)) )                   ; valeur max
            TextGadget(    np + 4, 455 , 5 + posy * 25 , 35 , 25 , Str(w_data(i,2)) )                   ; valeur selectionnée 
          EndIf
          param\option[i] = w_data(i,2)
          list_windows()\opt[i] = w_data(i,2)
        EndIf
      Next
    EndIf
  EndIf
  
  
  FreeArray(w_info())
  FreeArray(w_data())
EndProcedure


Procedure close_windows(id)
  ForEach list_windows()
    If list_windows()\id_fenetre = id
      DeleteElement(list_windows())
      Break
    EndIf
  Next
  CloseWindow(id)
EndProcedure


Procedure update_windows()
  id = GetActiveWindow()
  If id < 1 : ProcedureReturn 0 : EndIf
  ok = 0
  ForEach list_windows() : If list_windows()\id_fenetre = id : ok = 1 : Break : EndIf : Next
  If Not ok : ProcedureReturn 0 : EndIf
  ;id = list_windows()\id 
  ev = EventGadget()
  np = ((ev - #filtre_windows_pos ) - (id * 200))
  If np < 0 : ProcedureReturn 0 : EndIf
  ; restore toutes les donnees du fitre
  For i = 0 To 19 : param\option[i] = list_windows()\opt[i] : Next
  np = ((ev - #filtre_windows_pos ) - (id * 200)) / 10
  If np < 0 Or np > 19 : ProcedureReturn 0 : EndIf
  var = GetGadgetState(ev)
  If param\option[np] <> var
    list_windows()\opt[np] = var
    param\option[np] = var  
    If IsGadget(ev + 4) : SetGadgetText(ev + 4 ,Str(var)) : EndIf
    ProcedureReturn 1
  EndIf
  ProcedureReturn 0
EndProcedure

;----------
;-- programme

lg = 1600 
ht = 900 
lg = lg *  100 / DesktopUnscaledX(100)
ht = ht *  100 / DesktopUnscaledY(100)
scx = (100 / DesktopUnscaledX(100))
scy = (100 / DesktopUnscaledY(100))

If OpenWindow(0, 0, 0, lg, ht, "test_filtres", #PB_Window_SystemMenu | #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
  
  CreateMenu(0, WindowID(0))
  MenuTitle("File")
  
  OpenSubMenu("Load")
  MenuItem( #img1, "Load Image 1")
  MenuItem( #img2, "Load Image 2")
  MenuItem( #img3, "Load mask")
  CloseSubMenu()
  
  OpenSubMenu("Save")   
  MenuItem( #save, "Save BMP")
  ;MenuItem( 3, "Save JPG")
  MenuItem( #save2, "Save Clipboard")
  CloseSubMenu()
  MenuBar()
  ;MenuTitle("Quit")
  MenuItem( #quit, "Quit")
  
  MenuTitle("Valider")
  MenuItem( #copy1 , "modifier la source 1")
  MenuItem( #copy2 , "modifier la source 2")
  MenuItem( #copy3 , "modifier le Mask")
  
  create_menu_filtre()
  
  px = 5
  py = 5
  tx = lg / 10.526
  ty = ht / 6.105
  pym = ht / 5.6
  imagetx = (lg - lg/20) - (20 + lg/20)
  imagety = ht-40
  FrameGadget(100, lg/10 + 5, py,  imagetx , imagety, "" )
  FrameGadget(101, px, py + pym * 3 ,  tx, ht - (py + pym * 3.2), "" )
  
  CreateImage(#Black_image,tx*scx,ty*scy)
  StartDrawing(ImageOutput(#Black_image))
  Box(0,0,tx*scx,ty*scy,0)
  StopDrawing()
  
  draw_miniature(#Black_image,0)
  draw_miniature(#Black_image,1)
  draw_miniature(#Black_image,2)
  
  ;-- boucle
  ;Repeat
    Repeat
      update = 0
      Event = WaitWindowEvent()
      
      If EventType() = #PB_EventType_LeftClick 
        ;position buggé en y
        x = WindowMouseX(0)
        y = WindowMouseY(0)
        x1 = px
        x2 = x1 + (tx * scx)
        If x >= x1 And x <= x2
          For i = 0 To 2
            y1 = (py + pym * i)
            y2 = y1 + (ty * scy)
            If y >= y1 And y <= y2
              image_selected = i
              draw_miniature_selected()
            EndIf
          Next
        EndIf
      EndIf
      
      Select Event
          
        Case #PB_Event_Menu
          var = EventMenu()
          Select var
              
            Case #img1
              load_img(#source1)      
            Case #img2
              If IsImage(#source1) : load_img(#source2) : EndIf
            Case #img3
              If IsImage(#source1) : load_img(#mask) : EndIf
              
            Case #filtre_pos To (#filtre_pos + 500)
              pos = (var - #filtre_pos)
              SelectElement(list_filtre(), pos)
              open_windows(pos)
              update0 = 1
              
            Case #copy1 : copy_image(#source1)
            Case #copy2 : copy_image(#source2)
            Case #copy3 : copy_image(#mask)
              
            Case #save
              nom$ = SaveFileRequester("Save BMP", "", "", 0)
              If nom$ <> "" : SaveImage(#source1, nom$+".bmp" ,#PB_ImagePlugin_BMP ) : EndIf
              
            Case #save2
              SetClipboardImage(#source1)
              
            Case #quit
              quit = 1
          EndSelect
          
          
        Case #PB_Event_CloseWindow
          evt1 = EventWindow()
          ;If evt1 = 0
            ;If IsImage(#cible) : FreeImage(#cible) : EndIf
            ;If IsImage(#Black_image) : FreeImage(#Black_image) : EndIf
            ;CloseWindow(0)
            ;End
          ;Else
            If Event = #PB_Event_CloseWindow And evt1 <> 0
              event = close_windows(evt1)
            EndIf
            ;Event = 0
          ;EndIf
          
      EndSelect
      
    ;Until Event = 0
    
    update = update_windows() 
    
    If (update = 1 Or update0 = 1) And IsImage(#source1) And ListSize(list_windows()) > 0
      
      param\source = 0 : param\source2 = 0 : param\cible = 0 : param\mask = 0
      *source1 = 0 : *source2 = 0 : *cible = 0 : *mask = 0 : *tempo = 0
      If IsImage(#tempo) : FreeImage(#tempo) : EndIf
      If IsImage(#source1) And StartDrawing(ImageOutput(#source1)) : *source1 = DrawingBuffer() : StopDrawing() : EndIf
      If IsImage(#source2) And StartDrawing(ImageOutput(#source2)) : *source2 = DrawingBuffer() : StopDrawing() : EndIf
      If IsImage(#cible) And StartDrawing(ImageOutput(#cible))     : *cible   = DrawingBuffer() : StopDrawing() : EndIf
      If IsImage(#mask) And StartDrawing(ImageOutput(#mask))       : *mask    = DrawingBuffer() : StopDrawing() : EndIf
      
      Select image_selected
        Case 0
          If *source1 : CopyImage(#source1 , #tempo) : EndIf
        Case 1
          If *source2 : CopyImage(#source2 , #tempo) : EndIf
        Case 2
          If *mask : CopyImage(#mask , #tempo) : EndIf
      EndSelect
      
      If IsImage(#tempo) And StartDrawing(ImageOutput(#tempo)) : *tempo = DrawingBuffer() : StopDrawing() : EndIf
      
      param\source = *tempo
      param\source2 = *source2
      param\cible = *cible
      param\mask = *mask
      param\source_mask = param\source
      param\lg = ImageWidth(#source1)
      param\ht = ImageHeight(#source1) 
      
      ForEach list_windows()
        
        For i = 0 To 19 : param\option[i] = list_windows()\opt[i] : Next
        
        If param\typ = #Filter_Type_mix And param\source2 <> 0 Or param\typ <> #Filter_Type_mix
          t = ElapsedMilliseconds()
          If tabfunc(list_windows()\id_filtre) <> 0 : CallCFunctionFast(tabfunc(list_windows()\id_filtre),param) : EndIf
          param\source = param\cible
          t = ElapsedMilliseconds() - t
        EndIf
      Next
      
      StartDrawing(WindowOutput(0))
      If IsImage(#cible)
        CopyImage(#cible , #cible_aff)
        ResizeImage(#cible_aff,imagetx * scx , imagety * scy , #PB_Image_Raw)
        DrawImage(ImageID(#cible_aff), (lg/10 + 5) * scx , py * scy)
        t3$ = "     temps = " +Str(t) + " ms"
        tile$ = list_windows()\name + t3$
        SetWindowTitle(list_windows()\id_fenetre,tile$)
        FreeImage(#cible_aff)
      EndIf
      StopDrawing()
      update = 0
      update0 = 0
      
      If IsImage(#tempo) : FreeImage(#tempo) : EndIf
    EndIf
    
  ;ForEver
  
  Until Event = #PB_Event_CloseWindow Or quit = 1
  If IsImage(#cible) : FreeImage(#cible) : EndIf
  If IsImage(#Black_image) : FreeImage(#Black_image) : EndIf
  CloseWindow(0)
  
EndIf



; IDE Options = PureBasic 6.30 beta 1 (Windows - x64)
; CursorPosition = 542
; FirstLine = 503
; Folding = ------------
; EnableXP
; CompileSourceDirectory