UseGIFImageDecoder()
UseJPEG2000ImageDecoder()
UseJPEG2000ImageEncoder()
UseJPEGImageDecoder()
UseJPEGImageEncoder()
UsePNGImageDecoder()
UsePNGImageEncoder()
UseTGAImageDecoder()
UseTIFFImageDecoder()


DeclareModule filtres
  
  
  Enumeration
    #Filter_Type_Blur = 1
    #Filter_Type_Edge_Detection
    #Filter_Type_Color
    #Filter_Type_Dither
    #Filter_Type_FX
    #Filter_Type_Convolution
    #Filter_Type_Deform
    #Filter_Type_Color_Space
    #Filter_Type_mix
    #Filter_Type_autre
  EndEnumeration
  
  Enumeration
    #Filter_Blur_IIR = 1
    #Filter_Guillossien
    #Filter_Blur_box
    #Filter_RadialBlur_IIR
    #Filter_SpiralBlur_IIR
    #Filter_RadialBlur
    #Filter_MedianBlur
    #Filter_Bilateral
    #Filter_StackBlur
    #Filter_DepthAwareBlur
    #Filter_Edge_Aware
    #Filter_DirectionalBoxBlur
    #Filter_GaussianBlur_Conv
    #Filter_MotionBlur
    #Filter_AnisotropicBlur
    #Filter_KuwaharaBlur
    #Filter_PoissonDiskBlur
    #Filter_GuidedFilterColor
    #Filter_HeatDiffusionBlur
    #Filter_OpticalBlur
    
    #Filter_Roberts
    #Filter_Prewitt
    #Filter_sobel
    #Filter_sobel_4d
    #Filter_scharr
    #Filter_scharr_4d
    #Filter_kirsch
    #Filter_robinson
    #Filter_Laplacian
    #Filter_canny
    #Filter_FreiChen
    #Filter_LaplacianOfGaussian
    #Filter_DoG
    
    #Filter_AutoOtsuThreshold
    #Filter_FloydDither
    #Filter_StuckiDither
    #Filter_AtkinsonDither
    #Filter_BurkesDither
    #Filter_SierraLiteDither
    #Filter_SierraDither
    #Filter_JJNDither
    #Filter_RandomDither
    #Filter_BayerDither
    #Filter_ShiauFanDither
    #Filter_KiteDither
    #Filter_LiteDither
    
    #Filter_BlackAndWhite
    #Filter_grayscale
    #Filter_Posterize
    #Filter_Balance
    #Filter_Bend
    #Filter_Brightness
    #Filter_RaviverCouleurs
    #Filter_Saturation
    #Filter_Contrast
    #Filter_Gamma
    #Filter_Color
    #Filter_Color_hue
    #Filter_color_effect
    #Filter_Colorize
    #Filter_Hollow
    #Filter_SquareLaw_Lightening
    #Filter_Sepia
    #Filter_Exposure
    #Filter_Negatif
    #Filter_Teinte
    #Filter_Normalize_Color_Filter
    #Filter_ColorPermutation
    #Filter_Dichromatic
    #Filter_FalseColour
    #Filter_PencilImage
    
    #Filter_GlowEffect_IIR
    #Filter_Emboss
    #Filter_Fake_Hdr
    #Filter_pencil
    #Filter_CharcoalImage
    #Filter_RaysFilter
    #Filter_Histogram
    
    #Filter_Diffuse
    #Filter_Emboss_bump
    #Filter_Mosaic
    #Filter_HexMosaic
    #Filter_IrregularHexMosaic
    #Filter_Glitch
    #Filter_Kaleidoscope
    #Filter_FlowLiquify
    #Filter_DisplacementMap
    #Filter_Dilate
    #Filter_mettalic_effect
    
    #Filter_Convolution3x3
    
    #Filter_FlipH
    #Filter_FlipV
    #Filter_Rotate
    #Filter_PerspectiveSimple
    #Filter_Perspective
    #Filter_Translate
    #Filter_Spherize
    #Filter_Spiralize
    #Filter_Ellipse
    #Filter_Ripple
    #Filter_PinchBulge
    #Filter_WaveCircular
    #Filter_Lens
    #Filter_Tile
    #Filter_Perspective2
    #Filter_deform_Bend
    
    #Filter_RgbToYuv
    #Filter_YUVtoRGB
    #Filter_RGB_YUV_Modif
    #Filter_RGBtoYIQ
    #Filter_YIQtoRGB
    #Filter_RGB_YIQ_Modif
    #Filter_RGBtoLAB
    #Filter_RGB_LAB_Modif
    
    #Filtre2_additive
    #Filtre2_additive_inverted
    
    #Filtre2_alphablend
    #Filtre2_RMSColor
    #Filtre2_And
    #Filtre2_Average
    #Filtre2_LightBlend
    #Filtre2_IntensityBoost
    #Filtre2_BrushUp
    #Filtre2_Burn
    #Filtre2_SubtractiveDodge
    #Filtre2_ColorBurn
    #Filtre2_ColorDodge
    #Filtre2_Contrast
    #Filtre2_Cosine
    #Filtre2_CrossFading
    #Filtre2_InverseMultiply
    #Filtre2_Darken
    #Filtre2_SubtractiveBlend
    #Filtre2_Difference
    #Filtre2_Div
    #Filtre2_SoftAdd
    #Filtre2_SoftLightBoost
    #Filtre2_Exponentiale
    #Filtre2_Fade
    #Filtre2_Fence
    #Filtre2_Freeze
    #Filtre2_Glow
    #Filtre2_HardContrast
    #Filtre2_Hardlight
    #Filtre2_TanBlend
    #Filtre2_HardlTangent
    #Filtre2_Heat
    #Filtre2_InHale
    #Filtre2_Intensify
    #Filtre2_CosBlend
    #Filtre2_Interpolation
    #Filtre2_InvBurn
    #Filtre2_InvColorBurn
    #Filtre2_InvColorDodge
    #Filtre2_InvDodge
    #Filtre2_Lighten
    #Filtre2_LinearBurn
    #Filtre2_LinearLight
    #Filtre2_Logarithmic
    #Filtre2_Mean
    #Filtre2_ColorVivify
    #Filtre2_Multiply
    #Filtre2_Negation
    #Filtre2_PinLight
    #Filtre2_Or
    #Filtre2_Overlay
    #Filtre2_Pegtop_soft_light
    #Filtre2_quadritic
    #Filtre2_Screen
    #Filtre2_SoftColorBurn
    #Filtre2_SoftColorDodge
    #Filtre2_SoftLight
    #Filtre2_SoftOverlay
    #Filtre2_Stamp
    #Filtre2_Subtractive
    #Filtre2_Xor
    
  EndEnumeration
  
  Structure parametre
    source.i
    source2.i
    cible.i
    mask.i
    source_mask.i
    lg.l
    ht.l
    thread_max.l
    thread_pos.l
    addr.i[20] ; adreesse temporaire utiliser en interne pour les threads
    mask_type.l; definis le type de mask , binaire ou non
    option.f[20]
    convolution3.f[11]
    info_active.l
    typ.l
    name.s
    remarque.s
    info.s[20] 
    Array info_data.l(20,2)
  EndStructure
  Global param.parametre
  Global.parametre Dim dim_param(128) ; 128 thread max
  
  Global Dim tabfunc.i(999)
  
  Macro DeclareModule_filtresadd_function(MaFunction , pos = 0)
    If pos > 0 
      Declare MaFunction(*p)
      tabfunc(pos) = @MaFunction()
    EndIf
  EndMacro
  
  Declare Clear_Data_Filter(*param)
  Declare Load_Image_32(n,t$)
  
  DeclareModule_filtresadd_function(Blur_IIR , #Filter_Blur_IIR)
  DeclareModule_filtresadd_function(Guillossien , #Filter_Guillossien)
  DeclareModule_filtresadd_function(Blur_box , #Filter_Blur_box)
  DeclareModule_filtresadd_function(RadialBlur_IIR , #Filter_RadialBlur_IIR)
  DeclareModule_filtresadd_function(SpiralBlur_IIR , #Filter_SpiralBlur_IIR)
  DeclareModule_filtresadd_function(RadialBlur , #Filter_RadialBlur)
  DeclareModule_filtresadd_function(MedianBlur , #Filter_MedianBlur)
  DeclareModule_filtresadd_function(Bilateral , #Filter_Bilateral)
  DeclareModule_filtresadd_function(StackBlur , #Filter_StackBlur)
  DeclareModule_filtresadd_function(DepthAwareBlur , #Filter_DepthAwareBlur)
  DeclareModule_filtresadd_function(Edge_Aware , #Filter_Edge_Aware)
  DeclareModule_filtresadd_function(DirectionalBoxBlur , #Filter_DirectionalBoxBlur)
  DeclareModule_filtresadd_function(GaussianBlur_Conv , #Filter_GaussianBlur_Conv)
  DeclareModule_filtresadd_function(MotionBlur , #Filter_MotionBlur)
  DeclareModule_filtresadd_function(AnisotropicBlur , #Filter_AnisotropicBlur)
  DeclareModule_filtresadd_function(KuwaharaBlur , #Filter_KuwaharaBlur)
  DeclareModule_filtresadd_function(PoissonDiskBlur , #Filter_PoissonDiskBlur)
  DeclareModule_filtresadd_function(GuidedFilterColor , #Filter_GuidedFilterColor)
  DeclareModule_filtresadd_function(HeatDiffusionBlur , #Filter_HeatDiffusionBlur)
  DeclareModule_filtresadd_function(OpticalBlur , #Filter_OpticalBlur)
  DeclareModule_filtresadd_function(GuidedFilterColor , #Filter_GuidedFilterColor)
  
  DeclareModule_filtresadd_function(Roberts , #Filter_Roberts)
  DeclareModule_filtresadd_function(Prewitt , #Filter_Prewitt)
  DeclareModule_filtresadd_function(sobel , #Filter_sobel)
  DeclareModule_filtresadd_function(sobel_4d , #Filter_sobel_4d)
  DeclareModule_filtresadd_function(scharr , #Filter_scharr)
  DeclareModule_filtresadd_function(scharr_4d , #Filter_scharr_4d)
  DeclareModule_filtresadd_function(kirsch , #Filter_kirsch)
  DeclareModule_filtresadd_function(robinson , #Filter_robinson)
  DeclareModule_filtresadd_function(Laplacian , #Filter_Laplacian)
  DeclareModule_filtresadd_function(canny , #Filter_canny)
  DeclareModule_filtresadd_function(FreiChen , #Filter_FreiChen)
  DeclareModule_filtresadd_function(LaplacianOfGaussian , #Filter_LaplacianOfGaussian)
  DeclareModule_filtresadd_function(DoG , #Filter_DoG)
  
  DeclareModule_filtresadd_function(AutoOtsuThreshold , #Filter_AutoOtsuThreshold)
  DeclareModule_filtresadd_function(FloydDither , #Filter_FloydDither)
  DeclareModule_filtresadd_function(StuckiDither , #Filter_StuckiDither)
  DeclareModule_filtresadd_function(AtkinsonDither , #Filter_AtkinsonDither)
  DeclareModule_filtresadd_function(BurkesDither , #Filter_BurkesDither)
  DeclareModule_filtresadd_function(SierraLiteDither , #Filter_SierraLiteDither)
  DeclareModule_filtresadd_function(SierraDither , #Filter_SierraDither)
  DeclareModule_filtresadd_function(JJNDither , #Filter_JJNDither)
  DeclareModule_filtresadd_function(RandomDither , #Filter_RandomDither)
  DeclareModule_filtresadd_function(BayerDither , #Filter_BayerDither)
  DeclareModule_filtresadd_function(ShiauFanDither , #Filter_ShiauFanDither)
  DeclareModule_filtresadd_function(KiteDither , #Filter_KiteDither)
  DeclareModule_filtresadd_function(LiteDither , #Filter_LiteDither)
  
  DeclareModule_filtresadd_function(BlackAndWhite , #Filter_BlackAndWhite)
  DeclareModule_filtresadd_function(grayscale , #Filter_grayscale)
  DeclareModule_filtresadd_function(Posterize , #Filter_Posterize)
  DeclareModule_filtresadd_function(Balance , #Filter_Balance)
  DeclareModule_filtresadd_function(Bend , #Filter_Bend)
  DeclareModule_filtresadd_function(Brightness , #Filter_Brightness)
  DeclareModule_filtresadd_function(RaviverCouleurs , #Filter_RaviverCouleurs)
  DeclareModule_filtresadd_function(Saturation , #Filter_Saturation)
  DeclareModule_filtresadd_function(Contrast , #Filter_Contrast)
  DeclareModule_filtresadd_function(Gamma , #Filter_Gamma)
  DeclareModule_filtresadd_function(Color , #Filter_Color)
  DeclareModule_filtresadd_function(Color_hue , #Filter_Color_hue)
  DeclareModule_filtresadd_function(color_effect , #Filter_color_effect)
  DeclareModule_filtresadd_function(Colorize , #Filter_Colorize)
  DeclareModule_filtresadd_function(Hollow , #Filter_Hollow)
  DeclareModule_filtresadd_function(SquareLaw_Lightening , #Filter_SquareLaw_Lightening)
  DeclareModule_filtresadd_function(Sepia , #Filter_Sepia)
  DeclareModule_filtresadd_function(Exposure , #Filter_Exposure)
  DeclareModule_filtresadd_function(Negatif , #Filter_Negatif)
  DeclareModule_filtresadd_function(teinte , #Filter_Teinte)
  DeclareModule_filtresadd_function(Normalize_Color_Filter, #Filter_Normalize_Color_Filter)
  DeclareModule_filtresadd_function(ColorPermutation , #Filter_ColorPermutation)
  DeclareModule_filtresadd_function(Dichromatic , #Filter_Dichromatic)
  DeclareModule_filtresadd_function(FalseColour , #Filter_FalseColour)
  DeclareModule_filtresadd_function(PencilImage , #Filter_PencilImage)
  
  ;DeclareModule_filtresadd_function(GlowEffect_IIR , #Filter_GlowEffect_IIR)
  ;DeclareModule_filtresadd_function(Emboss , #Filter_Emboss)
  ;DeclareModule_filtresadd_function(FakeHDR , #Filter_Fake_Hdr)
  ;DeclareModule_filtresadd_function(pencil , #Filter_pencil)
  ;DeclareModule_filtresadd_function(CharcoalImage , #Filter_CharcoalImage)
  ;DeclareModule_filtresadd_function(RaysFilter , #Filter_RaysFilter)
  ;DeclareModule_filtresadd_function(Histogram , #Filter_Histogram)
  
  ;DeclareModule_filtresadd_function(Diffuse , #Filter_Diffuse)
  ;DeclareModule_filtresadd_function(Emboss_bump , #Filter_Emboss_bump)
  ;DeclareModule_filtresadd_function(Mosaic , #Filter_Mosaic)
  ;DeclareModule_filtresadd_function(HexMosaic , #Filter_HexMosaic)
  ;DeclareModule_filtresadd_function(IrregularHexMosaic , #Filter_IrregularHexMosaic)
  ;DeclareModule_filtresadd_function(Glitch , #Filter_Glitch)
  ;DeclareModule_filtresadd_function(Kaleidoscope , #Filter_Kaleidoscope)
  ;DeclareModule_filtresadd_function(FlowLiquify ,  #Filter_FlowLiquify)
  ;DeclareModule_filtresadd_function(DisplacementMap , #Filter_DisplacementMap)
  ;DeclareModule_filtresadd_function(Dilate , #Filter_Dilate)
  ;;DeclareModule_filtresadd_function(mettalic_effect , #Filter_mettalic_effect)
  
  ;DeclareModule_filtresadd_function(Convolution3x3,#Filter_Convolution3x3)
  
  DeclareModule_filtresadd_function(FlipH , #Filter_FlipH)
  DeclareModule_filtresadd_function(FlipV , #Filter_FlipV)
  DeclareModule_filtresadd_function(Rotate , #Filter_Rotate)
  DeclareModule_filtresadd_function(Perspective , #Filter_Perspective)
  DeclareModule_filtresadd_function(PerspectiveSimple , #Filter_PerspectiveSimple)
  DeclareModule_filtresadd_function(Translate , #Filter_Translate)
  DeclareModule_filtresadd_function(Spherize , #Filter_Spherize)
  DeclareModule_filtresadd_function(Spiralize , #Filter_Spiralize)
  DeclareModule_filtresadd_function(Ellipze , #Filter_Ellipse)
  DeclareModule_filtresadd_function(Ripple , #Filter_Ripple)
  DeclareModule_filtresadd_function(PinchBulge , #Filter_PinchBulge)
  DeclareModule_filtresadd_function(WaveCircular , #Filter_WaveCircular)
  DeclareModule_filtresadd_function(Lens , #Filter_Lens)
  DeclareModule_filtresadd_function(Tile , #Filter_Tile)
  DeclareModule_filtresadd_function(Perspective2 , #Filter_Perspective2)
  DeclareModule_filtresadd_function(deform_Bend , #Filter_deform_Bend)
  
  ;DeclareModule_filtresadd_function(RgbToYuv , #Filter_RgbToYuv)
  ;DeclareModule_filtresadd_function(YUVtoRGB , #Filter_YUVtoRGB)
  ;DeclareModule_filtresadd_function(RGB_YUV_Modif , #Filter_RGB_YUV_Modif)
  ;DeclareModule_filtresadd_function(RGBtoYIQ , #Filter_RGBtoYIQ)
  ;DeclareModule_filtresadd_function(YIQtoRGB , #Filter_YIQtoRGB)
  ;DeclareModule_filtresadd_function(RGB_YIQ_Modif , #Filter_RGB_YIQ_Modif)
  ;DeclareModule_filtresadd_function(RGBtoLAB , #Filter_RGBtoLAB)
  ;DeclareModule_filtresadd_function(RGB_LAB_Modif , #Filter_RGB_LAB_Modif)
  
  DeclareModule_filtresadd_function(Filtre2_additive , #Filtre2_additive)
  DeclareModule_filtresadd_function(Filtre2_additive_inverted , #Filtre2_additive_inverted)
  DeclareModule_filtresadd_function(Filtre2_alphablend , #Filtre2_alphablend)
  DeclareModule_filtresadd_function(Filtre2_RMSColor , #Filtre2_RMSColor)
  DeclareModule_filtresadd_function(Filtre2_And , #Filtre2_And)
  DeclareModule_filtresadd_function(Filtre2_Average , #Filtre2_Average)
  DeclareModule_filtresadd_function(Filtre2_LightBlend , #Filtre2_LightBlend)
  DeclareModule_filtresadd_function(Filtre2_IntensityBoost , #Filtre2_IntensityBoost)
  DeclareModule_filtresadd_function(Filtre2_BrushUp , #Filtre2_BrushUp)
  DeclareModule_filtresadd_function(Filtre2_Burn , #Filtre2_Burn)
  DeclareModule_filtresadd_function(Filtre2_SubtractiveDodge , #Filtre2_SubtractiveDodge)
  DeclareModule_filtresadd_function(Filtre2_ColorBurn , #Filtre2_ColorBurn)
  DeclareModule_filtresadd_function(Filtre2_ColorDodge , #Filtre2_ColorDodge)
  DeclareModule_filtresadd_function(Filtre2_Contrast , #Filtre2_Contrast)
  DeclareModule_filtresadd_function(Filtre2_Cosine , #Filtre2_Cosine)
  DeclareModule_filtresadd_function(Filtre2_CrossFading , #Filtre2_CrossFading)
  DeclareModule_filtresadd_function(Filtre2_InverseMultiply , #Filtre2_InverseMultiply)
  DeclareModule_filtresadd_function(Filtre2_Darken , #Filtre2_Darken)
  DeclareModule_filtresadd_function(Filtre2_SubtractiveBlend , #Filtre2_SubtractiveBlend)
  DeclareModule_filtresadd_function(Filtre2_Difference , #Filtre2_Difference)
  DeclareModule_filtresadd_function(Filtre2_Div , #Filtre2_Div)
  DeclareModule_filtresadd_function(Filtre2_SoftAdd , #Filtre2_SoftAdd)
  DeclareModule_filtresadd_function(Filtre2_SoftLightBoost , #Filtre2_SoftLightBoost)
  DeclareModule_filtresadd_function(Filtre2_Exponentiale , #Filtre2_Exponentiale)
  DeclareModule_filtresadd_function(Filtre2_Fade , #Filtre2_Fade)
  DeclareModule_filtresadd_function(Filtre2_Fence , #Filtre2_Fence)
  DeclareModule_filtresadd_function(Filtre2_Freeze , #Filtre2_Freeze)
  DeclareModule_filtresadd_function(Filtre2_Glow , #Filtre2_Glow)
  DeclareModule_filtresadd_function(Filtre2_HardContrast , #Filtre2_HardContrast)
  DeclareModule_filtresadd_function(Filtre2_Hardlight , #Filtre2_Hardlight)
  DeclareModule_filtresadd_function(Filtre2_TanBlend , #Filtre2_TanBlend)
  DeclareModule_filtresadd_function(Filtre2_HardlTangent , #Filtre2_HardlTangent)
  DeclareModule_filtresadd_function(Filtre2_Heat , #Filtre2_Heat)
  DeclareModule_filtresadd_function(Filtre2_InHale , #Filtre2_InHale)
  DeclareModule_filtresadd_function(Filtre2_Intensify , #Filtre2_Intensify)
  DeclareModule_filtresadd_function(Filtre2_CosBlend , #Filtre2_CosBlend)
  DeclareModule_filtresadd_function(Filtre2_Interpolation , #Filtre2_Interpolation)
  DeclareModule_filtresadd_function(Filtre2_InvBurn , #Filtre2_InvBurn)
  DeclareModule_filtresadd_function(Filtre2_InvColorBurn , #Filtre2_InvColorBurn)
  DeclareModule_filtresadd_function(Filtre2_InvColorDodge , #Filtre2_InvColorDodge)
  DeclareModule_filtresadd_function(Filtre2_InvDodge , #Filtre2_InvDodge)
  DeclareModule_filtresadd_function(Filtre2_Lighten , #Filtre2_Lighten)
  DeclareModule_filtresadd_function(Filtre2_LinearBurn , #Filtre2_LinearBurn)
  DeclareModule_filtresadd_function(Filtre2_LinearLight , #Filtre2_LinearLight)
  DeclareModule_filtresadd_function(Filtre2_Logarithmic , #Filtre2_Logarithmic)
  DeclareModule_filtresadd_function(Filtre2_Mean , #Filtre2_Mean)
  DeclareModule_filtresadd_function(Filtre2_ColorVivify , #Filtre2_ColorVivify)
  DeclareModule_filtresadd_function(Filtre2_Multiply , #Filtre2_Multiply)
  DeclareModule_filtresadd_function(Filtre2_Negation , #Filtre2_Negation)
  DeclareModule_filtresadd_function(Filtre2_PinLight , #Filtre2_PinLight)
  DeclareModule_filtresadd_function(Filtre2_Or , #Filtre2_Or)
  DeclareModule_filtresadd_function(Filtre2_Overlay , #Filtre2_Overlay)
  DeclareModule_filtresadd_function(Filtre2_Pegtop_soft_light , #Filtre2_Pegtop_soft_light)
  DeclareModule_filtresadd_function(Filtre2_quadritic , #Filtre2_quadritic)
  DeclareModule_filtresadd_function(Filtre2_Screen , #Filtre2_Screen)
  DeclareModule_filtresadd_function(Filtre2_SoftColorBurn , #Filtre2_SoftColorBurn)
  DeclareModule_filtresadd_function(Filtre2_SoftColorDodge , #Filtre2_SoftColorDodge)
  DeclareModule_filtresadd_function(Filtre2_SoftLight , #Filtre2_SoftLight)
  DeclareModule_filtresadd_function(Filtre2_SoftOverlay , #Filtre2_SoftOverlay)
  DeclareModule_filtresadd_function(Filtre2_Stamp , #Filtre2_Stamp)
  DeclareModule_filtresadd_function(Filtre2_Subtractive , #Filtre2_Subtractive)
  DeclareModule_filtresadd_function(Filtre2_Xor , #Filtre2_Xor)
  
EndDeclareModule






Module filtres
  
  Structure Pixel32
    l.l
  EndStructure
  
  ;--
  Macro clamp(c,a,b)
    If c < a : c = a : EndIf
    If c > b : c = b : EndIf
  EndMacro
  
  Macro clamp_rgb(r,g,b)
    If r < 0 : r = 0 : ElseIf r > 255 : r = 255 : EndIf
    If g < 0 : g = 0 : ElseIf g > 255 : g = 255 : EndIf
    If b < 0 : b = 0 : ElseIf b > 255 : b = 255 : EndIf
  EndMacro
  
  Macro clamp_argb(a,r,g,b)
    If a < 0 : a = 0 : ElseIf a > 255 : a = 255 : EndIf
    If r < 0 : r = 0 : ElseIf r > 255 : r = 255 : EndIf
    If g < 0 : g = 0 : ElseIf g > 255 : g = 255 : EndIf
    If b < 0 : b = 0 : ElseIf b > 255 : b = 255 : EndIf
  EndMacro
  
  ;--
  
  Macro seuil_rgb(seuil , r , g , b)
    If r < seuil : r = 0 : ElseIf r > 255 : r = 255 : EndIf
    If g < seuil : g = 0 : ElseIf g > 255 : g = 255 : EndIf
    If b < seuil : b = 0 : ElseIf b > 255 : b = 255 : EndIf
  EndMacro
  
  ;--
  
  Macro min(c,a,b)
    If a < b : c = a : Else : c = b : EndIf
  EndMacro  
  
  Macro max(c,a,b)
    If a > b : c = a : Else : c = b : EndIf
  EndMacro
  
  ;--  
  Macro min3(c, a, b, d)
    If a < b : c = a : Else : c = b : EndIf
    If d < c : c = d : EndIf
  EndMacro
  
  Macro max3(c, a, b, d)
    If a > b : c = a : Else : c = b : EndIf
    If d > c : c = d : EndIf
  EndMacro
  
  ;--
  Macro mib4(c, a, b, d, e)
    If a < b : c = a : Else : c = b : EndIf
    If d < c : c = d : EndIf
    If e < c : c = e : EndIf
  EndMacro
  
  Macro max4(c, a, b, d, e)
    If a > b : c = a : Else : c = b : EndIf
    If d > c : c = d : EndIf
    If e > c : c = e : EndIf
  EndMacro
  
  ;----------------------------------------------------------
  ; Macro pour lancer un traitement multi-thread
  Procedure MultiThread_MT(proc , opt = 0)
    Protected i
    Protected thread = CountCPUs(#PB_System_CPUs)
    clamp(thread, 1 , 128)
    
    If opt > 0 : clamp( opt , 1 , 128) : thread = opt : EndIf
    
    Protected Dim tr(thread)
    For i = 0 To thread - 1 : tr(i) = 0 : Next
    For i = 0 To thread - 1
      CopyStructure(@param, @dim_param(i), parametre)
      dim_param(i)\thread_pos = i
      dim_param(i)\thread_max = thread
      While tr(i) = 0 : tr(i) = CreateThread(proc, @dim_param(i)) : Wend
    Next
    For i = 0 To thread - 1 : If IsThread(tr(i)) > 0 : WaitThread(tr(i)) : EndIf : Next
    FreeArray(tr())
  EndProcedure
  
  ;----------------------------------------------------------
  
  Procedure.f max_2(a.f,b.f)
    If a>b 
      ProcedureReturn a
    Else
      ProcedureReturn b
    EndIf
  EndProcedure
  
  Procedure.f min_2(a.f,b.f)
    If a<b 
      ProcedureReturn a
    Else
      ProcedureReturn b
    EndIf
  EndProcedure
  
  
  Procedure.i Max_4(a.i, b.i, c.i, d.i)
    Protected maxValue = a
    If b > maxValue : maxValue = b : EndIf
    If c > maxValue : maxValue = c : EndIf
    If d > maxValue : maxValue = d : EndIf
    ProcedureReturn maxValue
  EndProcedure
  
  Procedure.i Max8(a.i, b.i, c.i, d.i, e.i, f.i, g.i, h.i)
    Protected maxValue = a
    If b > maxValue : maxValue = b : EndIf
    If c > maxValue : maxValue = c : EndIf
    If d > maxValue : maxValue = d : EndIf
    If e > maxValue : maxValue = e : EndIf
    If f > maxValue : maxValue = f : EndIf
    If g > maxValue : maxValue = g : EndIf
    If h > maxValue : maxValue = h : EndIf
    ProcedureReturn maxValue
  EndProcedure
  
  ;--
  
  Macro GetRGB(var,r,g,b)
    r = (var & $ff0000) >> 16
    g = (var & $00ff00) >> 8
    b = (var & $0000ff) 
  EndMacro 
  
  Macro GetARGB(var,a,r,g,b)
    a = (var & $ff000000) >> 24
    r = (var & $00ff0000) >> 16
    g = (var & $0000ff00) >> 8
    b = (var & $000000ff) 
  EndMacro
  
  ;--
  
  ;-- perlin noise
  ; Gradients de base pour Perlin (8 directions)
  Global Dim gradients(15, 1)
  
  Procedure Normalize(*x.Float, *y.Float)
    Protected len.f = Sqr(*x\f * *x\f + *y\f * *y\f)
    If len <> 0
      *x\f / len
      *y\f / len
    EndIf
  EndProcedure
  
  Procedure SetupGradients(mode)
    Select mode
      Case 0 ; Classique 8 directions
        gradients(0,0) = 1 : gradients(0,1) = 0
        gradients(1,0) = -1 : gradients(1,1) = 0
        gradients(2,0) = 0 : gradients(2,1) = 1
        gradients(3,0) = 0 : gradients(3,1) = -1
        gradients(4,0) = 1 : gradients(4,1) = 1
        gradients(5,0) = -1 : gradients(5,1) = 1
        gradients(6,0) = 1 : gradients(6,1) = -1
        gradients(7,0) = -1 : gradients(7,1) = -1
        
      Case 1 ; 16 directions radiales uniformes
        For i = 0 To 15
          gradients(i,0) = Cos(i * 2.0 * #PI / 16)
          gradients(i,1) = Sin(i * 2.0 * #PI / 16)
        Next
        
      Case 2 ; Vecteurs verticaux modifiés
        gradients(0,0) = 0 : gradients(0,1) = 1
        gradients(1,0) = 0 : gradients(1,1) = -1
        gradients(2,0) = 0.3 : gradients(2,1) = 1
        gradients(3,0) = -0.3 : gradients(3,1) = 1
        ;For i = 4 To 15
        ;gradients(i,0) = -1 : gradients(i,1) = 1
        ;Next
        
      Case 3
        ; croix 4 directions
        gradients(0,0)=1  : gradients(0,1)=0
        gradients(1,0)=-1 : gradients(1,1)=0
        gradients(2,0)=0  : gradients(2,1)=1
        gradients(3,0)=0  : gradients(3,1)=-1
        
      Case 4
        ; diagonales 4 directions
        gradients(0,0)=1  : gradients(0,1)=1
        gradients(1,0)=-1 : gradients(1,1)=1
        gradients(2,0)=1  : gradients(2,1)=-1
        gradients(3,0)=-1 : gradients(3,1)=-1
        
      Case 5 ; Aléatoires normalisés
        For i = 0 To 15
          gradients(i,0) = Random(200) / 100.0 - 1.0
          gradients(i,1) = Random(200) / 100.0 - 1.0
          Normalize(@gradients(i,0), @gradients(i,1))
        Next
    EndSelect
  EndProcedure
  
  Procedure.f Fade(t.f)
    ProcedureReturn t*t*t*(t*(t*6 - 15) + 10)
  EndProcedure
  
  Procedure.f Lerp(a.f, b.f, t.f)
    ProcedureReturn a + t * (b - a)
  EndProcedure
  
  Procedure.f DotGridGradient(ix, iy, x.f, y.f)
    Protected gradientIndex = ((ix * 1836311903) ! (iy * 2971215073)) & 7
    Protected gx.f = gradients(gradientIndex, 0)
    Protected gy.f = gradients(gradientIndex, 1)
    Protected dx.f = x - ix
    Protected dy.f = y - iy
    ProcedureReturn (dx * gx + dy * gy)
  EndProcedure
  
  Procedure.f PerlinNoise(x.f, y.f)
    Protected x0 = Int(x), x1 = x0 + 1
    Protected y0 = Int(y), y1 = y0 + 1
    Protected sx.f = Fade(x - x0)
    Protected sy.f = Fade(y - y0)
    Protected n0.f = DotGridGradient(x0, y0, x, y)
    Protected n1.f = DotGridGradient(x1, y0, x, y)
    Protected ix0.f = Lerp(n0, n1, sx)
    Protected n2.f = DotGridGradient(x0, y1, x, y)
    Protected n3.f = DotGridGradient(x1, y1, x, y)
    Protected ix1.f = Lerp(n2, n3, sx)
    ProcedureReturn Lerp(ix0, ix1, sy) * 0.5 + 0.5 ; normalisé [0,1]
  EndProcedure
  
  Procedure.f PerlinFractal(x.f, y.f, octaves=4, persistence.f=0.5)
    Protected total.f = 0.0
    Protected frequency.f = 1.0
    Protected amplitude.f = 1.0
    Protected maxAmplitude.f = 0.0
    For i = 0 To octaves - 1
      total + PerlinNoise(x * frequency, y * frequency) * amplitude
      maxAmplitude + amplitude
      amplitude * persistence
      frequency * 2.0
    Next
    ProcedureReturn total / maxAmplitude
  EndProcedure
  
  ;--
  Procedure BilinearSample(*src, lg, ht, x.f, y.f)
    Protected x0 = Int(x)
    Protected y0 = Int(y)
    Protected x1 = x0 + 1
    Protected y1 = y0 + 1
    If x1 >= lg : x1 = lg - 1 : EndIf
    If y1 >= ht : y1 = ht - 1 : EndIf
    Protected dx = x - x0
    Protected dy = y - y0
    
    Protected offset00 = (y0 * lg + x0) * 4
    Protected offset10 = (y0 * lg + x1) * 4
    Protected offset01 = (y1 * lg + x0) * 4
    Protected offset11 = (y1 * lg + x1) * 4
    
    Protected c00 = PeekL(*src + offset00)
    Protected c10 = PeekL(*src + offset10)
    Protected c01 = PeekL(*src + offset01)
    Protected c11 = PeekL(*src + offset11)
    
    ; Extraire composants ARGB
    Protected a00 = (c00 >> 24) & $FF
    Protected r00 = (c00 >> 16) & $FF
    Protected g00 = (c00 >> 8) & $FF
    Protected b00 = c00 & $FF
    
    Protected a10 = (c10 >> 24) & $FF
    Protected r10 = (c10 >> 16) & $FF
    Protected g10 = (c10 >> 8) & $FF
    Protected b10 = c10 & $FF
    
    Protected a01 = (c01 >> 24) & $FF
    Protected r01 = (c01 >> 16) & $FF
    Protected g01 = (c01 >> 8) & $FF
    Protected b01 = c01 & $FF
    
    Protected a11 = (c11 >> 24) & $FF
    Protected r11 = (c11 >> 16) & $FF
    Protected g11 = (c11 >> 8) & $FF
    Protected b11 = c11 & $FF
    
    ; Interpolation bilinéaire
    Protected a = a00 * (1-dx) * (1-dy) + a10 * dx * (1-dy) + a01 * (1-dx) * dy + a11 * dx * dy
    Protected r = r00 * (1-dx) * (1-dy) + r10 * dx * (1-dy) + r01 * (1-dx) * dy + r11 * dx * dy
    Protected g = g00 * (1-dx) * (1-dy) + g10 * dx * (1-dy) + g01 * (1-dx) * dy + g11 * dx * dy
    Protected b = b00 * (1-dx) * (1-dy) + b10 * dx * (1-dy) + b01 * (1-dx) * dy + b11 * dx * dy
    
    ProcedureReturn (Int(a) << 24) | (Int(r) << 16) | (Int(g) << 8) | Int(b)
  EndProcedure
  
  ;--
  Procedure Clear_Data_Filter(*p.parametre)
    *p\source = 0
    *p\cible = 0
    *p\mask = 0
    *p\lg.l = 0
    *p\ht.l = 0
    *p\thread_max = 0
    *p\thread_pos = 0
    *p\mask_type = 0
    *p\info_active = 0
    *p\typ = 0
    *p\name = ""
    *p\remarque = ""
    For i = 0 To 10
      *p\convolution3[i] = 0
      *p\addr[i] = 0
      *p\option[i] = 0
      *p\info[i] =""
      *p\info_data(i,0) = 0
      *p\info_data(i,1) = 0
      *p\info_data(i,2) = 0
    Next
  EndProcedure
  
  
  ;-------------------------------------------------------------------
  
  Procedure dither_grascale(*p.parametre)
    Protected *source = *p\source
    Protected *cible = *p\cible
    Protected total = *p\lg * *p\ht
    Protected *srcPixel.Pixel32, *dstPixel.Pixel32, r, g, b
    Protected startPos = (*p\thread_pos * total) / *p\thread_max
    Protected endPos   = ((*p\thread_pos + 1) * total) / *p\thread_max
    If endPos >= total : endPos = total - 1 :EndIf
    For i = startPos To endPos
      *srcPixel = *source + (i << 2)
      *dstPixel = *cible  + (i << 2)
      getrgb(*srcPixel\l , r , g , b)
      *dstPixel\l = ((r * 54 + g * 183 + b * 18) >> 8) * $10101
    Next
  EndProcedure
  
  Macro dither(name1 , name2)
    ; Affichage des informations de configuration si demandé
    If param\info_active
      param\typ = #Filter_Type_Dither
      param\name = name2
      param\remarque = "Attention, fonction non multithreadée"
      param\info[0] = "Nb de couleurs"
      param\info[1] = "Noir et blanc"
      param\info[2] = "Masque binaire"
      param\info_data(0,0) = 6 : param\info_data(0,1) = 64  : param\info_data(0,2) = 6 ; option[0] → niveaux
      param\info_data(1,0) = 0 : param\info_data(1,1) = 1  : param\info_data(1,2) = 0  ; [1] : N&B
      param\info_data(2,0) = 0 : param\info_data(2,1) = 2  : param\info_data(2,2) = 0  ; [2] : masque 
      ProcedureReturn
    EndIf
    
    Protected *source = *param\source
    Protected *cible  = *param\cible
    Protected *mask   = *param\mask
    Protected lg = *param\lg, ht = *param\ht
    Protected levels = *param\option[0]
    Protected i , var
    
    If *param\source = 0 Or *param\cible = 0 : ProcedureReturn : EndIf
    
    Protected thread = 1 ; CountCPUs(#PB_System_CPUs)
    Protected Dim tr(thread)

    ; Préparation image (gris ou copie)
    Protected *srcPixel.Pixel32, *dstPixel.Pixel32, r, g, b
    param\addr[0] = *source
    param\addr[1] = *cible
    If *param\option[1] : MultiThread_MT(@dither_grascale()) : Else : CopyMemory(*source, *cible, lg * ht * 4) : EndIf
    
    ; Table de quantification
    clamp(levels, 2,254)
    Protected *ndc = AllocateMemory(255)
    Protected Steping.f = 255.0 / (levels - 1)
    For i = 0 To 255
      var = i / Steping
      var = var * Steping
      PokeA(*ndc + i , var)
    Next
    
    *param\addr[2] = *ndc
    MultiThread_MT(name1) 
    If *param\mask And *param\option[2] : *param\mask_type = *param\option[2] - 1 : MultiThread_MT(@_mask()) : EndIf
    ; Libération mémoire
    FreeMemory(*ndc)
    FreeArray(tr())
  EndMacro
  
  ;-------------------------------------------------------------------
  Procedure _mask(*p.parametre)
    If *p\source_mask = 0 Or *p\cible = 0 Or *p\mask = 0 : ProcedureReturn : EndIf
    Protected i, a.l , r.l, g.l, b.l, a1.l , r1.l , g1.l , b1.l, maskVal.l
    ; Déclarations de pointeurs sur les buffers source, destination, et masque
    Protected *srcPixel.Pixel32
    Protected *dstPixel.Pixel32
    Protected *makPixel.Pixel32
    ; Nombre total de pixels
    Protected totalPixels = *p\lg * *p\ht
    ; Détermination de la plage de pixels à traiter par ce thread
    Protected startPos = (*p\thread_pos * totalPixels) / *p\thread_max
    Protected endPos   = ((*p\thread_pos + 1) * totalPixels) / *p\thread_max
    ; Boucle sur chaque pixel à traiter
    For i = startPos To endPos - 1
      ; Récupération des adresses des pixels source, destination et masque
      *srcPixel = *p\source_mask + (i << 2)
      *dstPixel = *p\cible + (i << 2)
      *makPixel = *p\mask   + (i << 2)
      ; Extraction de la valeur du masque (octet de poids faible = canal rouge)
      maskVal = *makPixel\l & $ff
      If *p\mask_type
        ; --- Mode 1 : MASQUE BINAIRE (seuil)
        ; Si valeur du masque < 127, on ignore la saturation → on recopie l’original
        If maskVal < 127 : *dstPixel\l = *srcPixel\l : EndIf
      Else
        ; --- Mode 0 : MASQUE PROGRESSIF (fusion douce)
        ; Mélange progressif entre l’image d’origine et l’image saturée
        ; Décomposition ARGB des pixels source (a1,r1,g1,b1) et destination (a,r,g,b)
        getargb(*srcPixel\l, a1, r1, g1, b1) ; image d'origine
        getargb(*dstPixel\l, a , r , g , b ) ; image saturée
                                             ; Mélange des composantes selon la valeur du masque (alpha blending inversé)
        a = ((a  * maskVal + a1 * (255 - maskVal)) >> 8)
        r = ((r  * maskVal + r1 * (255 - maskVal)) >> 8)
        g = ((g  * maskVal + g1 * (255 - maskVal)) >> 8)
        b = ((b  * maskVal + b1 * (255 - maskVal)) >> 8)
        ; Reconstruction du pixel final
        *dstPixel\l = (a << 24) + (r << 16) + (g << 8) + b
      EndIf
    Next
  EndProcedure
  
  ;-------------------------------------------------------------------
  Macro filter_start(name , opt)
    
    If *param\source = 0 Or *param\cible = 0 : ProcedureReturn : EndIf
    Protected *tempo = 0
    If *param\source <> *param\cible
      *param\addr[0] = *param\source
      *param\addr[1] = *param\cible
    Else
      *tempo = AllocateMemory(*param\lg * *param\ht * 4)
      If Not *tempo : ProcedureReturn : EndIf
      CopyMemory(*param\source , *tempo , *param\lg * *param\ht * 4)
      *param\addr[0] = *tempo
      *param\addr[1] = *param\cible    
    EndIf
    MultiThread_MT(name)
    If *param\mask And *param\option[opt] : *param\mask_type = *param\option[opt] - 1 : MultiThread_MT(@_mask()) : EndIf
    If *tempo : FreeMemory(*tempo) : EndIf
    
  EndMacro
  ;-------------------------------------------------------------------
  
  ; charge une image et la convertie en 32bit
  Procedure load_image_32(nom,file$)
    Protected nom_p.i , temps_p.i , x.l , y.l , r.l,g.l,b.l , i.l
    Protected lg.l , ht.l , depth.l , temps.i  , dif.l , dif1.l
    If file$ = "" : ProcedureReturn 0 : EndIf
    If Not ReadFile( 0, file$)  : ProcedureReturn 0 : Else : CloseFile(0) : EndIf
    LoadImage(nom,file$)
    If Not IsImage(nom) : ProcedureReturn 0 : EndIf
    StartDrawing(ImageOutput(nom))
    Depth = OutputDepth()
    StopDrawing()
    If Depth=24
      CopyImage(nom,temps)
      FreeImage(nom)
      StartDrawing(ImageOutput(temps))
      temps_p = DrawingBuffer()
      lg = ImageWidth(temps)
      ht = ImageHeight(temps)
      dif = DrawingBufferPitch() - (lg*3)
      StopDrawing()
      CreateImage(nom,lg,ht,32)
      StartDrawing(ImageOutput(nom))
      nom_p = DrawingBuffer()
      StopDrawing()
      For y=0 To ht-1
        For x=0 To lg-1
          i = ((y*lg)+x)*3
          r=PeekA(temps_p + i + 2 + dif1)
          g=PeekA(temps_p + i + 1 + dif1)
          b=PeekA(temps_p + i + 0 + dif1)
          PokeL(nom_p + ((y*lg)+x)*4 , r<<16 + g<<8 + b)
        Next
        dif1 = dif1 + dif
      Next
      FreeImage(temps) ; supprime l'image 24bits
    EndIf
    ProcedureReturn 1
  EndProcedure
  
  
  ;-------------------------------------------------------------------
  ;-- IncludeFile
  
  EnableExplicit 
  IncludePath "filtres\"
  
  XIncludeFile "blur.pbi"
  XIncludeFile "edge_detection.pbi"
  XIncludeFile "dither.pbi"
  XIncludeFile "couleur.pbi"
  XIncludeFile "deform.pbi"
  
  
  ;XIncludeFile "autre\Glow_IIR.pbi"
  ;XIncludeFile "autre\Emboss.pbi"
  ;XIncludeFile "autre\Fake_Hdr.pbi"
  ;XIncludeFile "autre\pencil.pbi"
  ;XIncludeFile "autre\CharcoalImage.pbi"
  ;XIncludeFile "autre\RaysFilter.pbi"
  ;XIncludeFile "autre\Histogram.pbi"
  
  ;XIncludeFile "fx\Diffuse.pbi"
  ;XIncludeFile "fx\Emboss_bump.pbi"
  ;XIncludeFile "fx\Mosaic.pbi"
  ;XIncludeFile "fx\HexMosaic.pbi"
  ;XIncludeFile "fx\IrregularHexMosaic.pbi"
  ;XIncludeFile "fx\Glitch.pbi"
  ;XIncludeFile "fx\Kaleidoscope.pbi"
  ;XIncludeFile "fx\FlowLiquify.pbi"
  ;XIncludeFile "fx\DisplacementMap.pbi"
  ;XIncludeFile "fx\Dilate.pbi"
  ;XIncludeFile "fx\mettalic_effect.pbi"
  
  ;XIncludeFile "Convolution\Convol3x3.pbi"
  

  ;XIncludeFile "Color_Space\RgbToYuv.pbi"
  ;XIncludeFile "Color_Space\YUVtoRGB.pbi"
  ;XIncludeFile "Color_Space\RGB_YUV_Modif.pbi"
  ;XIncludeFile "Color_Space\RGBtoYIQ.pbi"
  ;XIncludeFile "Color_Space\YIQtoRGB.pbi"
  ;XIncludeFile "Color_Space\RGB_YIQ_Modif.pbi"
  ;XIncludeFile "Color_Space\RGBtoLAB.pbi"
  ;XIncludeFile "Color_Space\RGB_LAB_Modif.pbi"
  
  XIncludeFile "mix.pbi"
EndModule


; IDE Options = PureBasic 6.30 beta 1 (Windows - x64)
; CursorPosition = 954
; FirstLine = 950
; Folding = ----------
; EnableXP
; CompileSourceDirectory