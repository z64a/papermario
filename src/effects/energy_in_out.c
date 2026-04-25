#include "common.h"
#include "effects_internal.h"

extern Gfx D_09000200_3D6130[];
extern Gfx D_090003A8_3D62D8[];
extern Gfx D_090003C8_3D62F8[];
extern Gfx D_090003E8_3D6318[];
extern Gfx D_09000528_3D6458[];
extern Gfx D_09000540_3D6470[];
extern Gfx D_09000558_3D6488[];
extern Gfx D_09000688_3D65B8[];
extern Gfx D_09000808_3D6738[];

Gfx* EnergyInOutGfx[] = {
    D_090003A8_3D62D8, D_090003C8_3D62F8, D_090003E8_3D6318, D_09000528_3D6458,
    D_09000540_3D6470, D_09000558_3D6488, D_09000688_3D65B8, D_09000688_3D65B8,
    D_09000688_3D65B8, D_09000558_3D6488, D_09000808_3D6738, D_09000688_3D65B8,
    D_09000558_3D6488
};

u8 EnergyInOutNumParts[] = {
    11, 11, 11, 11, 17, 11, 11, 21, 21, 21, 21, 21, 21
};

u8 EnergyInOutInitialDepth[] = {
    20, 5, 20, 20, 10, 20, 20, 8, 8, 8, 1, 1, 1
};

void energy_in_out_init(EffectInstance* effect);
void energy_in_out_update(EffectInstance* effect);
void energy_in_out_render(EffectInstance* effect);
void energy_in_out_appendGfx(void* effect);

EffectInstance* energy_in_out_main(s32 type, f32 posX, f32 posY, f32 posZ, f32 scale, s32 duration) {
    EffectBlueprint bp;
    EffectInstance* effect;
    EnergyInOutFXData* part;
    EnergyInOutFXData* firstPart;
    s32 numParts = EnergyInOutNumParts[type];
    f32 randAngle;
    s32 i;

    bp.init = energy_in_out_init;
    bp.update = energy_in_out_update;
    bp.renderScene = energy_in_out_render;
    bp.unk_00 = 0;
    bp.renderUI = nullptr;
    bp.effectID = EFFECT_ENERGY_IN_OUT;

    effect = create_effect_instance(&bp);
    effect->numParts = numParts;
    firstPart = part = effect->data.energyInOut = general_heap_malloc(numParts * sizeof(*part));
    ASSERT(effect->data.energyInOut != nullptr);

    part->type = type;
    part->lifetime = 0;
    if (duration <= 0) {
        part->timeLeft = 1000;
    } else {
        part->timeLeft = duration;
    }
    part->primCol.a = 0;
    part->pos.x = posX;
    part->pos.y = posY;
    part->pos.z = posZ;
    part->scale = scale;
    part->primCol.r = 255;
    part->primCol.g = 255;
    part->primCol.b = 255;
    part->envCol.r = 255;
    part->envCol.g = 245;
    part->envCol.b = 0;
    part->userScale = 1.0f;
    part->curDepth = EnergyInOutInitialDepth[type];

    randAngle = rand_int(360);

    part++;
    for (i = 1; i < effect->numParts; i++, part++) {
        part->type = type % 3;

        switch (type) {
            case FX_ENERGY_IN_SHORT_STREAKS:
            case FX_ENERGY_IN_STARS:
            case FX_ENERGY_IN_YELLOW_POINTS:
                part->curDepth = -(rand_int(10) * 0.2 + 0.2);
                part->timeLeft = 20;
                part->rollVel = 0;
                part->scale = 1.0 - (i % 3) * 0.1;
                break;
            case FX_ENERGY_OUT_SHORT_STREAKS:
            case FX_ENERGY_OUT_YELLOW_POINTS:
                part->curDepth = rand_int(10) * 0.2 + 0.2;
                part->timeLeft = 20;
                part->rollVel = 0;
                part->scale = 1.0 - (i % 3) * 0.1;
                break;
            case FX_ENERGY_IN_LONG_STREAKS1:
                part->curDepth = -(rand_int(10) + 4);
                part->timeLeft = 10;
                part->rollVel = 0;
                part->scale = 1.0 - (i % 3) * 0.3;
                break;
            case FX_ENERGY_IN_LONG_STREAKS2:
                part->curDepth = -(rand_int(10) + 4);
                part->timeLeft = 10;
                part->rollVel = 0;
                part->scale = 1.0 - (i % 3) * 0.3;
                break;
            case FX_ENERGY_OUT_LONG_STREAKS1:
                part->curDepth = rand_int(10) * 0.2 + 0.6;
                part->timeLeft = 20;
                part->rollVel = -1.0f;
                part->scale = 1.0 - (i % 3) * 0.3;
                break;
            case FX_ENERGY_OUT_RED_POINTS:
                part->curDepth = -(rand_int(10) * 0.2 + 0.6);
                part->timeLeft = 20;
                part->rollVel = -2.0f;
                part->scale = 1.0 - (i % 3) * 0.3;
                firstPart->primCol.r = 255;
                firstPart->primCol.g = 245;
                firstPart->primCol.b = 215;
                firstPart->envCol.r = 220;
                firstPart->envCol.g = 60;
                firstPart->envCol.b = 10;
                break;
            case FX_ENERGY_OUT_LONG_STREAKS2:
                part->curDepth = rand_int(10) * 0.1 + 2.0;
                part->timeLeft = 10;
                part->rollVel = 0;
                part->scale = (1.0 - (i % 3) * 0.3) * 0.5;
                break;
            case FX_ENERGY_OUT_LONG_STREAKS_SPIN:
                part->curDepth = rand_int(10) * 0.05 + 0.2;
                part->rollVel = -1.0f;
                part->timeLeft = 30;
                part->scale = 1.0 - (i % 3) * 0.3;
                break;
            case FX_ENERGY_OUT_STARS:
            case FX_ENERGY_OUT_YELLOW_POINTS_SPIN:
                part->curDepth = rand_int(10) * 0.2 + 0.6;
                part->timeLeft = 20;
                part->rollVel = -2.0f;
                part->scale = 1.0 - (i % 3) * 0.3;
                break;
        }

        part->lifetime = -rand_int(part->timeLeft);

        if (part->curDepth < 0.0f) {
            part->pos.x = (part->timeLeft - part->lifetime) * (-part->curDepth);
        } else {
            part->pos.x = (-part->lifetime) * part->curDepth;
        }
        part->pos.y = 0;
        part->pos.z = 0;

        part->rollAngle = (i - 1) * 360 / (numParts - 1) + randAngle;
    }

    return effect;
}

void energy_in_out_init(EffectInstance* effect) {
}

void energy_in_out_update(EffectInstance* effect) {
    EnergyInOutFXData* part = effect->data.energyInOut;
    s32 timeLeft;
    s32 lifetime;
    f32 angle;
    s32 i;

    if (effect->flags & FX_INSTANCE_FLAG_DISMISS) {
        effect->flags &= ~FX_INSTANCE_FLAG_DISMISS;
        part->timeLeft = 16;
    }

    if (part->timeLeft < 1000) {
        part->timeLeft--;
    }

    part->lifetime++;
    if (part->timeLeft < 0) {
        remove_effect(effect);
        return;
    }

    timeLeft = part->timeLeft;
    lifetime = part->lifetime;

    if (timeLeft < 16) {
        part->primCol.a = timeLeft * 16;
    }

    if (lifetime < 16) {
        part->primCol.a = lifetime * 16 + 15;
    }

    part++;
    for (i = 1; i < effect->numParts; i++, part++) {
        part->lifetime++;
        if (part->lifetime >= part->timeLeft) {
            part->lifetime = 0;
            if (part->curDepth < 0.0f) {
                part->pos.x = -part->timeLeft * part->curDepth;
            } else {
                part->pos.x = 0.0f;
            }
            part->rollAngle = rand_int(359);
        }

        part->pos.x += part->curDepth;
        part->rollAngle += part->rollVel;

        angle = (part->lifetime * 180) / part->timeLeft;
        if (angle < 0.0f || angle > 180.0f) {
            part->primCol.a = 0;
        } else {
            part->primCol.a = sin_deg(angle) * 255.0f;
        }
    }
}

void energy_in_out_render(EffectInstance* effect) {
    RenderTask renderTask;
    RenderTask* retTask;

    renderTask.appendGfx = energy_in_out_appendGfx;
    renderTask.appendGfxArg = effect;
    renderTask.dist = 10;
    renderTask.renderMode = RENDER_MODE_CLOUD_NO_ZCMP;

    retTask = queue_render_task(&renderTask);
}

void func_E00D6978(void) {
}

void energy_in_out_appendGfx(void* effect) {
    EnergyInOutFXData* part = ((EffectInstance*)effect)->data.energyInOut;
    s32 alpha = part->primCol.a;
    s32 type = part->type;
    f32 scale = part->scale * part->userScale;
    s32 colR = part->primCol.r;
    s32 colG = part->primCol.g;
    s32 colB = part->primCol.b;
    f32 depth = part->curDepth;
    Matrix4f mtxTransform;
    Matrix4f mtxTemp;
    s32 i;

    gDPPipeSync(gMainGfxPos++);
    gSPSegment(gMainGfxPos++, 0x09, VIRTUAL_TO_PHYSICAL(((EffectInstance*)effect)->shared->graphics));

    guPositionF(mtxTransform, 0.0f, -gCameras[gCurrentCameraID].curYaw, 0.0f, scale, part->pos.x, part->pos.y, part->pos.z);
    guMtxF2L(mtxTransform, &gDisplayContext->matrixStack[gMatrixListPos]);

    gSPMatrix(gMainGfxPos++, &gDisplayContext->matrixStack[gMatrixListPos++], G_MTX_PUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    gDPSetPrimColor(gMainGfxPos++, 0, 0, part->primCol.r, part->primCol.g, part->primCol.b, alpha);
    gDPSetEnvColor(gMainGfxPos++, part->envCol.r, part->envCol.g, part->envCol.b, 0);
    gSPDisplayList(gMainGfxPos++, D_09000200_3D6130);

    part++;
    for (i = 1; i < ((EffectInstance*)effect)->numParts; i++, part++) {
        f32 scale = part->scale;

        gDPSetPrimColor(gMainGfxPos++, 0, 0, colR, colG, colB, (alpha * part->primCol.a) / 255);

        guRotateF(mtxTransform, part->rollAngle, 0.0f, 0.0f, 1.0f);
        guTranslateF(mtxTemp, part->pos.x + depth, 0.0f, 0.0f);
        guMtxCatF(mtxTemp, mtxTransform, mtxTransform);
        if (EnergyInOutGfx[type] == D_09000688_3D65B8 || EnergyInOutGfx[type] == D_09000808_3D6738) {
            guScaleF(mtxTemp, scale, 1.0f, 1.0f);
        } else {
            guScaleF(mtxTemp, scale, scale, 1.0f);
        }
        guMtxCatF(mtxTemp, mtxTransform, mtxTransform);
        guMtxF2L(mtxTransform, &gDisplayContext->matrixStack[gMatrixListPos]);

        gSPMatrix(gMainGfxPos++, &gDisplayContext->matrixStack[gMatrixListPos++], G_MTX_PUSH | G_MTX_MUL | G_MTX_MODELVIEW);
        gSPDisplayList(gMainGfxPos++, EnergyInOutGfx[type]);
        gSPPopMatrix(gMainGfxPos++, G_MTX_MODELVIEW);
    }

    gSPPopMatrix(gMainGfxPos++, G_MTX_MODELVIEW);
}
