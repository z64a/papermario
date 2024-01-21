#include "sbk_50.h"

extern EvtScript N(EVS_Main);

EntryList N(Entrances) = {
    [sbk_50_ENTRY_0]    { -475.0,    0.0,    0.0,   90.0 },
    [sbk_50_ENTRY_1]    {  475.0,    0.0,    0.0,  270.0 },
    [sbk_50_ENTRY_2]    {    0.0,    0.0, -475.0,  180.0 },
    [sbk_50_ENTRY_3]    {    0.0,    0.0,  475.0,    0.0 },
};

MapSettings N(settings) = {
    .main = &N(EVS_Main),
    .entryList = &N(Entrances),
    .entryCount = ENTRY_COUNT(N(Entrances)),
    .background = &gBackgroundImage,
    .tattle = { MSG_MapTattle_sbk_50 },
};

#include "world/common/todo/SpawnSunEffect.inc.c"

EvtScript N(EVS_ExitWalk_sbk_51_0) = EVT_EXIT_WALK(60, sbk_50_ENTRY_1, "sbk_51", sbk_51_ENTRY_0);
EvtScript N(EVS_ExitWalk_sbk_40_3) = EVT_EXIT_WALK(60, sbk_50_ENTRY_2, "sbk_40", sbk_40_ENTRY_3);
EvtScript N(EVS_ExitWalk_sbk_60_2) = EVT_EXIT_WALK(60, sbk_50_ENTRY_3, "sbk_60", sbk_60_ENTRY_2);

EvtScript N(EVS_BindExitTriggers) = {
    BindTrigger(Ref(N(EVS_ExitWalk_sbk_51_0)), TRIGGER_FLOOR_ABOVE, COLLIDER_deilie, 1, 0)
    BindTrigger(Ref(N(EVS_ExitWalk_sbk_40_3)), TRIGGER_FLOOR_ABOVE, COLLIDER_deilin, 1, 0)
    BindTrigger(Ref(N(EVS_ExitWalk_sbk_60_2)), TRIGGER_FLOOR_ABOVE, COLLIDER_deilis, 1, 0)
    Return
    End
};

EvtScript N(EVS_Main) = {
    Set(GB_WorldLocation, LOCATION_DRY_DRY_DESERT)
    Call(SetSpriteShading, SHADING_NONE)
    IfEq(GB_StoryProgress, STORY_CH2_GOT_PULSE_STONE)
        Call(DisablePulseStone, FALSE)
    EndIf
    SetUP_CAMERA_NO_LEAD()
    Call(N(SpawnSunEffect))
    Call(SetMusicTrack, 0, SONG_DRY_DRY_DESERT, 0, 8)
    Set(LVar0, Ref(N(EVS_BindExitTriggers)))
    Exec(EnterWalk)
    Return
    End
};
