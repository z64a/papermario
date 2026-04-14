#include "tst_20.h"

extern EvtScript N(EVS_Main);

EntryList N(Entrances) = {
    [tst_20_ENTRY_0]    {    0.0,    0.0,  100.0,   90.0 },
};

MapSettings N(settings) = {
    .main = &N(EVS_Main),
    .entryList = &N(Entrances),
    .entryCount = ENTRY_COUNT(N(Entrances)),
};

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_TESTING)
    Call(SetSpriteShading, SHADING_NONE)
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    Return
    End
};

