#include "kmr_30.h"

#include "world/common/atomic/TexturePan.inc.c"

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_MARIOS_HOUSE)
    Call(SetSpriteShading, SHADING_KMR_30)
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    Call(SetCamLeadPlayer, CAM_DEFAULT, false)
    Call(MakeNpcs, false, Ref(N(DefaultNPCs)))
    Call(EnableWorldStatusBar, false)
    Thread
        Call(FadeOutMusic, 0, 0x00001388)
        Wait(390)
        Call(SetMusic, 0, SONG_THE_END, 0, VOL_LEVEL_FULL)
    EndThread
    Exec(N(EVS_Scene_TheEnd))
    Return
    End
};
