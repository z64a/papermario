#include "machi.h"

API_CALLABLE(N(CheckGameVarRanges)) {
    GameVarRange* bytes;
    GameVarRange* flags;

    bytes = N(GameByteTable);
    while (true) {
        if (bytes->name == 0) {
            break;
        }
        // release version does nothing
        bytes++;
    }

    flags = N(GameFlagTable);
    while (true) {
        if (flags->name == 0) {
            break;
        }
        // release version does nothing
        flags++;
    }

    return 2;
}

EvtScript N(EVS_GotoMap_kmr_09_1) = {
    Call(GotoMap, Ref("kmr_09"), kmr_09_ENTRY_1)
    Wait(100)
    Return
    End
};

EvtScript N(EVS_GotoMap_nok_10_0) = {
    Call(GotoMap, Ref("nok_10"), nok_10_ENTRY_0) //@bug map does not exist!
    Wait(100)
    Return
    End
};

EvtScript N(EVS_GotoMap_iwa_00_0) = {
    Call(GotoMap, Ref("iwa_00"), iwa_00_ENTRY_0)
    Wait(100)
    Return
    End
};

EvtScript N(EVS_GotoMap_tst_01_0) = {
    Call(GotoMap, Ref("tst_01"), tst_01_ENTRY_0)
    Wait(100)
    Return
    End
};

EvtScript N(EVS_GotoMap_jan_00_0) = {
    Call(GotoMap, Ref("jan_00"), jan_00_ENTRY_0)
    Wait(100)
    Return
    End
};

EvtScript N(EVS_Main) = {
    Call(N(CheckGameVarRanges))
    Call(SetCamPerspective, CAM_DEFAULT, CAM_UPDATE_FROM_ZONE, 25, 16, 4096)
    Call(SetCamBGColor, CAM_DEFAULT, 0, 0, 0)
    Call(SetCamEnabled, CAM_DEFAULT, true)
    ExecWait(N(EVS_MakeEntities))
    BindTrigger(Ref(N(EVS_GotoMap_kmr_09_1)), TRIGGER_WALL_PUSH, COLLIDER_deilitn, 1, 0)
    BindTrigger(Ref(N(EVS_GotoMap_nok_10_0)), TRIGGER_WALL_PUSH, COLLIDER_deilitne, 1, 0)
    BindTrigger(Ref(N(EVS_GotoMap_iwa_00_0)), TRIGGER_WALL_PUSH, COLLIDER_deilite, 1, 0)
    BindTrigger(Ref(N(EVS_GotoMap_tst_01_0)), TRIGGER_WALL_PUSH, COLLIDER_deilitnw, 1, 0)
    BindTrigger(Ref(N(EVS_GotoMap_jan_00_0)), TRIGGER_WALL_PUSH, COLLIDER_deilitsw, 1, 0)
    Call(MakeNpcs, false, Ref(N(DefaultNPCs)))
    ExecWait(N(EVS_GoombaKing_Init))
    Exec(N(EVS_FlyPartnerAround))
    Return
    End
};
