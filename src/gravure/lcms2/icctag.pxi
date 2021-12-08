cdef extern from "lcms2.h":
    # Definitions in ICC spec
    int c_cmsMagicNumber "cmsMagicNumber"
    int c_lcmsSignature "lcmsSignature"

    # Base ICC type definitions
    ctypedef enum cmsTagTypeSignature:
        cmsSigChromaticityType
        cmsSigColorantOrderType
        cmsSigColorantTableType
        cmsSigCrdInfoType
        cmsSigCurveType
        cmsSigDataType
        cmsSigDictType
        cmsSigDateTimeType
        cmsSigDeviceSettingsType
        cmsSigLut16Type
        cmsSigLut8Type
        cmsSigLutAtoBType
        cmsSigLutBtoAType
        cmsSigMeasurementType
        cmsSigMultiLocalizedUnicodeType
        cmsSigMultiProcessElementType
        cmsSigNamedColorType
        cmsSigNamedColor2Type
        cmsSigParametricCurveType
        cmsSigProfileSequenceDescType
        cmsSigProfileSequenceIdType
        cmsSigResponseCurveSet16Type
        cmsSigS15Fixed16ArrayType
        cmsSigScreeningType
        cmsSigSignatureType
        cmsSigTextType
        cmsSigTextDescriptionType
        cmsSigU16Fixed16ArrayType
        cmsSigUcrBgType
        cmsSigUInt16ArrayType
        cmsSigUInt32ArrayType
        cmsSigUInt64ArrayType
        cmsSigUInt8ArrayType
        cmsSigVcgtType
        cmsSigViewingConditionsType
        cmsSigXYZType

    # Base ICC tag definitions
    ctypedef enum cmsTagSignature:
        cmsSigAToB0Tag
        cmsSigAToB1Tag
        cmsSigAToB2Tag
        cmsSigBlueColorantTag
        cmsSigBlueMatrixColumnTag
        cmsSigBlueTRCTag
        cmsSigBToA0Tag
        cmsSigBToA1Tag
        cmsSigBToA2Tag
        cmsSigCalibrationDateTimeTag
        cmsSigCharTargetTag
        cmsSigChromaticAdaptationTag
        cmsSigChromaticityTag
        cmsSigColorantOrderTag
        cmsSigColorantTableTag
        cmsSigColorantTableOutTag
        cmsSigColorimetricIntentImageStateTag
        cmsSigCopyrightTag
        cmsSigCrdInfoTag
        cmsSigDataTag
        cmsSigDateTimeTag
        cmsSigDeviceMfgDescTag
        cmsSigDeviceModelDescTag
        cmsSigDeviceSettingsTag
        cmsSigDToB0Tag
        cmsSigDToB1Tag
        cmsSigDToB2Tag
        cmsSigDToB3Tag
        cmsSigBToD0Tag
        cmsSigBToD1Tag
        cmsSigBToD2Tag
        cmsSigBToD3Tag
        cmsSigGamutTag
        cmsSigGrayTRCTag
        cmsSigGreenColorantTag
        cmsSigGreenMatrixColumnTag
        cmsSigGreenTRCTag
        cmsSigLuminanceTag
        cmsSigMeasurementTag
        cmsSigMediaBlackPointTag
        cmsSigMediaWhitePointTag
        cmsSigNamedColorTag
        cmsSigNamedColor2Tag
        cmsSigOutputResponseTag
        cmsSigPerceptualRenderingIntentGamutTag
        cmsSigPreview0Tag
        cmsSigPreview1Tag
        cmsSigPreview2Tag
        cmsSigProfileDescriptionTag
        cmsSigProfileDescriptionMLTag
        cmsSigProfileSequenceDescTag
        cmsSigProfileSequenceIdTag
        cmsSigPs2CRD0Tag
        cmsSigPs2CRD1Tag
        cmsSigPs2CRD2Tag
        cmsSigPs2CRD3Tag
        cmsSigPs2CSATag
        cmsSigPs2RenderingIntentTag
        cmsSigRedColorantTag
        cmsSigRedMatrixColumnTag
        cmsSigRedTRCTag
        cmsSigSaturationRenderingIntentGamutTag
        cmsSigScreeningDescTag
        cmsSigScreeningTag
        cmsSigTechnologyTag
        cmsSigUcrBgTag
        cmsSigViewingCondDescTag
        cmsSigViewingConditionsTag
        cmsSigVcgtTag
        cmsSigMetaTag
        cmsSigArgyllArtsTag

    # ICC Technology tag
    ctypedef enum cmsTechnologySignature:
        cmsSigDigitalCamera
        cmsSigFilmScanner
        cmsSigReflectiveScanner
        cmsSigInkJetPrinter
        cmsSigThermalWaxPrinter
        cmsSigElectrophotographicPrinter
        cmsSigElectrostaticPrinter
        cmsSigDyeSublimationPrinter
        cmsSigPhotographicPaperPrinter
        cmsSigFilmWriter
        cmsSigVideoMonitor
        cmsSigVideoCamera
        cmsSigProjectionTelevision
        cmsSigCRTDisplay
        cmsSigPMDisplay
        cmsSigAMDisplay
        cmsSigPhotoCD
        cmsSigPhotoImageSetter
        cmsSigGravure
        cmsSigOffsetLithography
        cmsSigSilkscreen
        cmsSigFlexography
        cmsSigMotionPictureFilmScanner
        cmsSigMotionPictureFilmRecorder
        cmsSigDigitalMotionPictureCamera
        cmsSigDigitalCinemaProjector

    # ICC Color spaces
    ctypedef enum cmsColorSpaceSignature:
        cmsSigXYZData
        cmsSigLabData
        cmsSigLuvData
        cmsSigYCbCrData
        cmsSigYxyData
        cmsSigRgbData
        cmsSigGrayData
        cmsSigHsvData
        cmsSigHlsData
        cmsSigCmykData
        cmsSigCmyData
        cmsSigMCH1Data
        cmsSigMCH2Data
        cmsSigMCH3Data
        cmsSigMCH4Data
        cmsSigMCH5Data
        cmsSigMCH6Data
        cmsSigMCH7Data
        cmsSigMCH8Data
        cmsSigMCH9Data
        cmsSigMCHAData
        cmsSigMCHBData
        cmsSigMCHCData
        cmsSigMCHDData
        cmsSigMCHEData
        cmsSigMCHFData
        cmsSigNamedData
        cmsSig1colorData
        cmsSig2colorData
        cmsSig3colorData
        cmsSig4colorData
        cmsSig5colorData
        cmsSig6colorData
        cmsSig7colorData
        cmsSig8colorData
        cmsSig9colorData
        cmsSig10colorData
        cmsSig11colorData
        cmsSig12colorData
        cmsSig13colorData
        cmsSig14colorData
        cmsSig15colorData
        cmsSigLuvKData

    # ICC Profile Class
    ctypedef enum cmsProfileClassSignature:
        cmsSigInputClass
        cmsSigDisplayClass
        cmsSigOutputClass
        cmsSigLinkClass
        cmsSigAbstractClass
        cmsSigColorSpaceClass
        cmsSigNamedColorClass

    # ICC Platforms
    ctypedef enum cmsPlatformSignature:
        cmsSigMacintosh
        cmsSigMicrosoft
        cmsSigSolaris
        cmsSigSGI
        cmsSigTaligent
        cmsSigUnices

    enum:
        # Reference gamut
        cmsSigPerceptualReferenceMediumGamut

        # For cmsSigColorimetricIntentImageStateTag
        cmsSigSceneColorimetryEstimates
        cmsSigSceneAppearanceEstimates
        cmsSigFocalPlaneColorimetryEstimates
        cmsSigReflectionHardcopyOriginalColorimetry
        cmsSigReflectionPrintOutputColorimetry


@unique
class ICCDef(TagEnum):
    """Definitions in ICC spec.
    """
    cmsMagicNumber = c_cmsMagicNumber
    lcmsSignature = c_lcmsSignature

@unique
class TagTypeSignature(TagEnum):
    """Base ICC type definitions.
    """
    ChromaticityType = cmsSigChromaticityType
    ColorantOrderType = cmsSigColorantOrderType
    ColorantTableType = cmsSigColorantTableType
    CrdInfoType = cmsSigCrdInfoType
    CurveType = cmsSigCurveType
    DataType = cmsSigDataType
    DictType = cmsSigDictType
    DateTimeType = cmsSigDateTimeType
    DeviceSettingsType = cmsSigDeviceSettingsType
    Lut16Type = cmsSigLut16Type
    Lut8Type = cmsSigLut8Type
    LutAtoBType = cmsSigLutAtoBType
    LutBtoAType = cmsSigLutBtoAType
    MeasurementType = cmsSigMeasurementType
    MultiLocalizedUnicodeType = cmsSigMultiLocalizedUnicodeType
    MultiProcessElementType = cmsSigMultiProcessElementType
    NamedColorType = cmsSigNamedColorType
    NamedColor2Type = cmsSigNamedColor2Type
    ParametricCurveType = cmsSigParametricCurveType
    ProfileSequenceDescType = cmsSigProfileSequenceDescType
    ProfileSequenceIdType = cmsSigProfileSequenceIdType
    ResponseCurveSet16Type = cmsSigResponseCurveSet16Type
    S15Fixed16ArrayType = cmsSigS15Fixed16ArrayType
    ScreeningType = cmsSigScreeningType
    SignatureType = cmsSigSignatureType
    TextType = cmsSigTextType
    TextDescriptionType = cmsSigTextDescriptionType
    U16Fixed16ArrayType = cmsSigU16Fixed16ArrayType
    UcrBgType = cmsSigUcrBgType
    UInt16ArrayType = cmsSigUInt16ArrayType
    UInt32ArrayType = cmsSigUInt32ArrayType
    UInt64ArrayType = cmsSigUInt64ArrayType
    UInt8ArrayType = cmsSigUInt8ArrayType
    VcgtType = cmsSigVcgtType
    ViewingConditionsType = cmsSigViewingConditionsType
    XYZType = cmsSigXYZType


@unique
class TagSignature(TagEnum):
    """Base ICC tag definitions.
    """
    AToB0Tag = cmsSigAToB0Tag
    AToB1Tag = cmsSigAToB1Tag
    AToB2Tag = cmsSigAToB2Tag
    BlueColorantTag = cmsSigBlueColorantTag
    BlueMatrixColumnTag = cmsSigBlueMatrixColumnTag
    BlueTRCTag = cmsSigBlueTRCTag
    BToA0Tag = cmsSigBToA0Tag
    BToA1Tag = cmsSigBToA1Tag
    BToA2Tag = cmsSigBToA2Tag
    CalibrationDateTimeTag = cmsSigCalibrationDateTimeTag
    CharTargetTag = cmsSigCharTargetTag
    ChromaticAdaptationTag = cmsSigChromaticAdaptationTag
    ChromaticityTag = cmsSigChromaticityTag
    ColorantOrderTag = cmsSigColorantOrderTag
    ColorantTableTag = cmsSigColorantTableTag
    ColorantTableOutTag = cmsSigColorantTableOutTag
    ColorimetricIntentImageStateTag = cmsSigColorimetricIntentImageStateTag
    CopyrightTag = cmsSigCopyrightTag
    CrdInfoTag = cmsSigCrdInfoTag
    DataTag = cmsSigDataTag
    DateTimeTag = cmsSigDateTimeTag
    DeviceMfgDescTag = cmsSigDeviceMfgDescTag
    DeviceModelDescTag = cmsSigDeviceModelDescTag
    DeviceSettingsTag = cmsSigDeviceSettingsTag
    DToB0Tag = cmsSigDToB0Tag
    DToB1Tag = cmsSigDToB1Tag
    DToB2Tag = cmsSigDToB2Tag
    DToB3Tag = cmsSigDToB3Tag
    BToD0Tag = cmsSigBToD0Tag
    BToD1Tag = cmsSigBToD1Tag
    BToD2Tag = cmsSigBToD2Tag
    BToD3Tag = cmsSigBToD3Tag
    GamutTag = cmsSigGamutTag
    GrayTRCTag = cmsSigGrayTRCTag
    GreenColorantTag = cmsSigGreenColorantTag
    GreenMatrixColumnTag = cmsSigGreenMatrixColumnTag
    GreenTRCTag = cmsSigGreenTRCTag
    LuminanceTag = cmsSigLuminanceTag
    MeasurementTag = cmsSigMeasurementTag
    MediaBlackPointTag = cmsSigMediaBlackPointTag
    MediaWhitePointTag = cmsSigMediaWhitePointTag
    NamedColorTag = cmsSigNamedColorTag
    NamedColor2Tag = cmsSigNamedColor2Tag
    OutputResponseTag = cmsSigOutputResponseTag
    PerceptualRenderingIntentGamutTag = cmsSigPerceptualRenderingIntentGamutTag
    Preview0Tag = cmsSigPreview0Tag
    Preview1Tag = cmsSigPreview1Tag
    Preview2Tag = cmsSigPreview2Tag
    ProfileDescriptionTag = cmsSigProfileDescriptionTag
    ProfileDescriptionMLTag = cmsSigProfileDescriptionMLTag
    ProfileSequenceDescTag = cmsSigProfileSequenceDescTag
    ProfileSequenceIdTag = cmsSigProfileSequenceIdTag
    Ps2CRD0Tag = cmsSigPs2CRD0Tag
    Ps2CRD1Tag = cmsSigPs2CRD1Tag
    Ps2CRD2Tag = cmsSigPs2CRD2Tag
    Ps2CRD3Tag = cmsSigPs2CRD3Tag
    Ps2CSATag = cmsSigPs2CSATag
    Ps2RenderingIntentTag = cmsSigPs2RenderingIntentTag
    RedColorantTag = cmsSigRedColorantTag
    RedMatrixColumnTag = cmsSigRedMatrixColumnTag
    RedTRCTag = cmsSigRedTRCTag
    SaturationRenderingIntentGamutTag = cmsSigSaturationRenderingIntentGamutTag
    ScreeningDescTag = cmsSigScreeningDescTag
    ScreeningTag = cmsSigScreeningTag
    TechnologyTag = cmsSigTechnologyTag
    UcrBgTag = cmsSigUcrBgTag
    ViewingCondDescTag = cmsSigViewingCondDescTag
    ViewingConditionsTag = cmsSigViewingConditionsTag
    VcgtTag = cmsSigVcgtTag
    MetaTag = cmsSigMetaTag
    ArgyllArtsTag = cmsSigArgyllArtsTag


@unique
class TechnologySignature(TagEnum):
    """ICC Technology tag.
    """
    DigitalCamera = cmsSigDigitalCamera
    FilmScanner = cmsSigFilmScanner
    ReflectiveScanner = cmsSigReflectiveScanner
    InkJetPrinter = cmsSigInkJetPrinter
    ThermalWaxPrinter = cmsSigThermalWaxPrinter
    ElectrophotographicPrinter = cmsSigElectrophotographicPrinter
    ElectrostaticPrinter = cmsSigElectrostaticPrinter
    DyeSublimationPrinter = cmsSigDyeSublimationPrinter
    PhotographicPaperPrinter = cmsSigPhotographicPaperPrinter
    FilmWriter = cmsSigFilmWriter
    VideoMonitor = cmsSigVideoMonitor
    VideoCamera = cmsSigVideoCamera
    ProjectionTelevision = cmsSigProjectionTelevision
    CRTDisplay = cmsSigCRTDisplay
    PMDisplay = cmsSigPMDisplay
    AMDisplay = cmsSigAMDisplay
    PhotoCD = cmsSigPhotoCD
    PhotoImageSetter = cmsSigPhotoImageSetter
    Gravure = cmsSigGravure
    OffsetLithography = cmsSigOffsetLithography
    Silkscreen = cmsSigSilkscreen
    Flexography = cmsSigFlexography
    MotionPictureFilmScanner = cmsSigMotionPictureFilmScanner
    MotionPictureFilmRecorder = cmsSigMotionPictureFilmRecorder
    DigitalMotionPictureCamera = cmsSigDigitalMotionPictureCamera
    DigitalCinemaProjector = cmsSigDigitalCinemaProjector


@unique
class ColorSpaceSignature(TagEnum):
    """ICC Color spaces.
    """
    XYZData = cmsSigXYZData
    LabData = cmsSigLabData
    LuvData = cmsSigLuvData
    YCbCrData = cmsSigYCbCrData
    YxyData = cmsSigYxyData
    RgbData = cmsSigRgbData
    GrayData = cmsSigGrayData
    HsvData = cmsSigHsvData
    HlsData = cmsSigHlsData
    CmykData = cmsSigCmykData
    CmyData = cmsSigCmyData
    MCH1Data = cmsSigMCH1Data
    MCH2Data = cmsSigMCH2Data
    MCH3Data = cmsSigMCH3Data
    MCH4Data = cmsSigMCH4Data
    MCH5Data = cmsSigMCH5Data
    MCH6Data = cmsSigMCH6Data
    MCH7Data = cmsSigMCH7Data
    MCH8Data = cmsSigMCH8Data
    MCH9Data = cmsSigMCH9Data
    MCHAData = cmsSigMCHAData
    MCHBData = cmsSigMCHBData
    MCHCData = cmsSigMCHCData
    MCHDData = cmsSigMCHDData
    MCHEData = cmsSigMCHEData
    MCHFData = cmsSigMCHFData
    NamedData = cmsSigNamedData
    _1colorData = cmsSig1colorData
    _2colorData = cmsSig2colorData
    _3colorData = cmsSig3colorData
    _4colorData = cmsSig4colorData
    _5colorData = cmsSig5colorData
    _6colorData = cmsSig6colorData
    _7colorData = cmsSig7colorData
    _8colorData = cmsSig8colorData
    _9colorData = cmsSig9colorData
    _10colorData = cmsSig10colorData
    _11colorData = cmsSig11colorData
    _12colorData = cmsSig12colorData
    _13colorData = cmsSig13colorData
    _14colorData = cmsSig14colorData
    _15colorData = cmsSig15colorData
    LuvKData = cmsSigLuvKData


@unique
class ProfileClassSignature(TagEnum):
    """ICC Profile Class.
    """
    InputClass = cmsSigInputClass
    DisplayClass = cmsSigDisplayClass
    OutputClass = cmsSigOutputClass
    LinkClass = cmsSigLinkClass
    AbstractClass = cmsSigAbstractClass
    ColorSpaceClass = cmsSigColorSpaceClass
    NamedColorClass = cmsSigNamedColorClass


@unique
class PlatformSignature(TagEnum):
    """ICC Platforms.
    """
    Macintosh = cmsSigMacintosh
    Microsoft = cmsSigMicrosoft
    Solaris = cmsSigSolaris
    SGI = cmsSigSGI
    Taligent = cmsSigTaligent
    Unices = cmsSigUnices


@unique
class Referencegamut(TagEnum):
    """Reference gamut.
    """
    PerceptualReferenceMediumGamut = cmsSigPerceptualReferenceMediumGamut


@unique
class ColorimetricIntentImageStateTag(TagEnum):
    """For TagSignature.ColorimetricIntentImageStateTag.
    """
    SceneColorimetryEstimates = cmsSigSceneColorimetryEstimates
    SceneAppearanceEstimates = cmsSigSceneAppearanceEstimates
    FocalPlaneColorimetryEstimates = cmsSigFocalPlaneColorimetryEstimates
    ReflectionHardcopyOriginalColorimetry = cmsSigReflectionHardcopyOriginalColorimetry
    ReflectionPrintOutputColorimetry = cmsSigReflectionPrintOutputColorimetry
