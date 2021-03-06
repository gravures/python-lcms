# -*- coding: utf-8 -*-
#
#       Copyright (c) Gilles Coissac 2021 <info@gillescoissac.fr>
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 3 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.
#
from gravure.lcms2.types cimport *
from gravure.lcms2.icctag cimport *

cdef extern from "lcms2.h":
    # Device attributes, currently defined
    # values correspond to the low 4 bytes
    # of the 8 byte attribute quantity
    enum:
        cmsReflective
        cmsTransparency
        cmsGlossy
        cmsMatte

    # Common structures in ICC tags
    ctypedef struct cmsICCData:
        cmsUInt32Number len
        cmsUInt32Number flag
        cmsUInt8Number  data[1]

    # ICC date time
    ctypedef struct cmsDateTimeNumber:
        cmsUInt16Number      year
        cmsUInt16Number      month
        cmsUInt16Number      day
        cmsUInt16Number      hours
        cmsUInt16Number      minutes
        cmsUInt16Number      seconds

    # ICC XYZ
    ctypedef struct cmsEncodedXYZNumber:
        cmsS15Fixed16Number  X
        cmsS15Fixed16Number  Y
        cmsS15Fixed16Number  Z

    # Profile ID as computed by MD5 algorithm
    ctypedef union cmsProfileID:
        cmsUInt8Number       ID8[16]
        cmsUInt16Number      ID16[8]
        cmsUInt32Number      ID32[4]

    ctypedef struct cmsICCHeader:
        cmsUInt32Number              size           # (uint) Profile size in bytes
        cmsSignature                 cmmId          # (uint) CMM for this profile
        cmsUInt32Number              version        # (uint) Format version number
        cmsProfileClassSignature     deviceClass    # (enum) Type of profile
        cmsColorSpaceSignature       colorSpace     # (enum) Color space of data
        cmsColorSpaceSignature       pcs            # (enum) PCS, XYZ or Lab only
        cmsDateTimeNumber            date           # (struct) Date profile was created
        cmsSignature                 magic          # (uint) Magic Number to identify an ICC profile
        cmsPlatformSignature         platform       # (enum) Primary Platform
        cmsUInt32Number              flags          # (uint) Various bit settings
        cmsSignature                 manufacturer   # (uint) Device manufacturer
        cmsUInt32Number              model          # (uint) Device model number
        cmsUInt64Number              attributes     # (uint) Device attributes
        cmsUInt32Number              renderingIntent# (uint) Rendering intent
        cmsEncodedXYZNumber          illuminant     # (struct) Profile illuminant
        cmsSignature                 creator        # (uint) Profile creator
        cmsProfileID                 profileID      # (union) Profile ID using MD5
        cmsInt8Number                reserved[28]   # (int) Reserved for future use

    # Profile high level functions
    cmsHPROFILE cmsOpenProfileFromFile(const char *ICCProfile, const char *sAccess) nogil
    cmsBool cmsCloseProfile(cmsHPROFILE hProfile) nogil

    # Access header data
    enum:
         cmsEmbeddedProfileFalse
         cmsEmbeddedProfileTrue
         cmsUseAnywhere
         cmsUseWithEmbeddedDataOnly

    cmsUInt32Number cmsGetHeaderFlags(cmsHPROFILE hProfile) nogil
    void cmsGetHeaderAttributes(cmsHPROFILE hProfile, cmsUInt64Number* Flags) nogil
    void cmsGetHeaderProfileID(cmsHPROFILE hProfile, cmsUInt8Number* ProfileID) nogil
    struct tm:
        pass
    bint cmsGetHeaderCreationDateTime(cmsHPROFILE hProfile, tm *Dest) nogil
    cmsUInt32Number cmsGetHeaderRenderingIntent(cmsHPROFILE hProfile) nogil
    void cmsSetHeaderFlags(cmsHPROFILE hProfile, cmsUInt32Number Flags) nogil
    cmsUInt32Number cmsGetHeaderManufacturer(cmsHPROFILE hProfile) nogil
    void cmsSetHeaderManufacturer(cmsHPROFILE hProfile, cmsUInt32Number manufacturer) nogil
    cmsUInt32Number cmsGetHeaderCreator(cmsHPROFILE hProfile) nogil
    cmsUInt32Number cmsGetHeaderModel(cmsHPROFILE hProfile) nogil
    void cmsSetHeaderModel(cmsHPROFILE hProfile, cmsUInt32Number model) nogil
    void cmsSetHeaderAttributes(cmsHPROFILE hProfile, cmsUInt64Number Flags) nogil
    void cmsSetHeaderProfileID(cmsHPROFILE hProfile, cmsUInt8Number* ProfileID) nogil
    void cmsSetHeaderRenderingIntent(cmsHPROFILE hProfile, cmsUInt32Number RenderingIntent) nogil


cdef class Profile:
    cdef object __weakref__

    # Members
    cdef cmsICCHeader* icc_header
    cdef cmsHPROFILE handle
    cdef bint open_profile

    # C Methods
    @staticmethod
    cdef Profile profile_from_file(const char *c_name, const char *c_access)
