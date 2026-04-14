#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Optional, List, ClassVar
from enum import Enum
from pydantic import BaseModel, ConfigDict


# constants
GEN_PREFIX = "GEN_"
NULL_STR = "nullptr"

matching = True


def clean_name(name: str) -> str:
    # remove non-alphanumeric and non-whitespace characters
    s = re.sub(r"[^\w\s]", "", name)
    # replace any whitespace with underscore
    s = re.sub(r"\s+", "_", s)
    return s


def is_blank(s: str | None) -> bool:
    return not bool(s and s.strip())


class EntranceType(str, Enum):
    Walk = "Walk"
    SingleDoor = "Single Door"
    DoubleDoor = "Double Door"
    VerticalPipe = "Vertical Pipe"
    HorizontalPipe = "Horizontal Pipe"
    BlueWarpPipe = "Blue Warp Pipe"
    Teleport = "Teleport"


class ExitType(str, Enum):
    Walk = "Walk"
    SingleDoor = "Single Door"
    DoubleDoor = "Double Door"
    VerticalPipe = "Vertical Pipe"
    HorizontalPipe = "Horizontal Pipe"


class MarkerType(str, Enum):
    Root = "Root"
    Group = "Group"
    Entry = "Entry"
    Position = "Position"
    Sphere = "Sphere"
    Cylinder = "Cylinder"
    Volume = "Volume"
    Path = "Path"
    NPC = "NPC"
    Entity = "Entity"
    BlockGrid = "BlockGrid"
    CamTarget = "Camera Target"


class MoveType(str, Enum):
    Stationary = "Stationary"
    Wander = "Wander"
    Patrol = "Patrol"


class EntityType(str, Enum):
    BoardedFloor = "BoardedFloor"
    BombableRock = "BombableRock"
    BombableRockWide = "BombableRockWide"
    Padlock = "Padlock"
    PadlockRedFrame = "PadlockRedFrame"
    PadlockRedFace = "PadlockRedFace"
    PadlockBlueFace = "PadlockBlueFace"

    CymbalPlant = "CymbalPlant"
    PinkFlower = "PinkFlower"
    SpinningFlower = "SpinningFlower"
    BellbellPlant = "BellbellPlant"
    TrumpetPlant = "TrumpetPlant"
    Munchlesia = "Munchlesia"
    ArrowSign = "ArrowSign"

    Tweester = "Tweester"
    StarBoxLauncher = "StarBoxLauncher"

    SavePoint = "SavePoint"
    HeartBlock = "HeartBlock"
    SuperBlock = "SuperBlock"
    BrickBlock = "BrickBlock"
    MulticoinBlock = "MulticoinBlock"
    YellowBlock = "YellowBlock"
    HiddenYellowBlock = "HiddenYellowBlock"
    RedBlock = "RedBlock"
    HiddenRedBlock = "HiddenRedBlock"

    Item = "Item"
    Chest = "Chest"
    GiantChest = "GiantChest"
    WoodenCrate = "WoodenCrate"
    HiddenPanel = "HiddenPanel"
    Signpost = "Signpost"
    SimpleSpring = "SimpleSpring"
    ScriptSpring = "ScriptSpring"
    BlueWarpPipe = "BlueWarpPipe"
    PushBlock = "PushBlock"

    RedSwitch = "RedSwitch"
    BlueSwitch = "BlueSwitch"
    HugeBlueSwitch = "HugeBlueSwitch"
    GreenStompSwitch = "GreenStompSwitch"
    TriggerBlock = "TriggerBlock"
    InertYellowBlock = "InertYellowBlock"
    PowBlock = "PowBlock"

    Hammer1Block = "Hammer1Block"
    Hammer1BlockWideX = "Hammer1BlockWideX"
    Hammer1BlockWideZ = "Hammer1BlockWideZ"
    Hammer1BlockTiny = "Hammer1BlockTiny"
    Hammer2Block = "Hammer2Block"
    Hammer2BlockWideX = "Hammer2BlockWideX"
    Hammer2BlockWideZ = "Hammer2BlockWideZ"
    Hammer2BlockTiny = "Hammer2BlockTiny"
    Hammer3Block = "Hammer3Block"
    Hammer3BlockWideX = "Hammer3BlockWideX"
    Hammer3BlockWideZ = "Hammer3BlockWideZ"
    Hammer3BlockTiny = "Hammer3BlockTiny"


class Model(BaseModel):
    model_config = ConfigDict(extra="forbid")


class JsonTexturePanner(Model):
    TEXEL_RATIO: ClassVar[int] = 1024
    DEFAULT_MAXIMUM: ClassVar[int] = 0x20000

    id: int
    generate: bool
    useTexels: bool
    max: int
    init: List[int]
    step: List[int]
    freq: List[int]

    def is_nonzero(self) -> bool:
        return (
            any(v != 0 for v in self.init) or
            any(v != 0 for v in self.step)
        )

    def get_output(self) -> tuple[int, list[int], list[int], list[int]]:
        if self.useTexels:
            max_uv = self.max * self.TEXEL_RATIO
            step_uv = [v * self.TEXEL_RATIO for v in self.step]
            init_uv = [v * self.TEXEL_RATIO for v in self.init]
        else:
            max_uv = self.max
            step_uv = list(self.step)
            init_uv = list(self.init)

        return max_uv, step_uv, list(self.freq), init_uv


class JsonEntrance(Model):
    type: EntranceType
    name: str
    markerName: str

    door1Name: Optional[str] = None
    door2Name: Optional[str] = None
    doorSound: Optional[str] = None
    doorSwing: Optional[str] = None

    pipeCollider: Optional[str] = None
    warpPipeEntity: Optional[str] = None

    hasCallback: bool


class JsonExit(Model):
    type: ExitType
    name: str

    destMap: Optional[str] = None
    destMarkerName: Optional[str] = None
    useDestMarkerID: bool

    markerName: Optional[str] = None
    colliderName: Optional[str] = None

    door1Name: Optional[str] = None
    door2Name: Optional[str] = None
    doorSound: Optional[str] = None
    doorSwing: Optional[str] = None

    lockName: Optional[str] = None
    hasCallback: bool


class JsonTree(Model):
    # TODO: define when known
    pass


class JsonBush(Model):
    # TODO: define when known
    pass


class JsonDetectData(Model):
    center: List[int]
    useCircle: bool
    radius: int
    height: Optional[int] = None
    sizeX: int
    sizeZ: int


class JsonWanderData(Model):
    center: List[int]
    useCircle: bool
    radius: int
    sizeX: int
    sizeZ: int
    overrideSpeed: bool
    speed: float


class JsonPatrolData(Model):
    points: List[List[int]]
    overrideSpeed: bool
    speed: float


class JsonSpriteData(Model):
    id: int
    palette: int
    anim: int
    animName: Optional[str] = None
    flipX: bool
    flipY: bool


class JsonNpcComp(Model):
    moveType: MoveType
    flying: bool

    sprite: Optional[JsonSpriteData] = None
    detect: Optional[JsonDetectData] = None
    wander: Optional[JsonWanderData] = None
    patrol: Optional[JsonPatrolData] = None


class JsonGridComp(Model):
    gridIndex: int
    gridSizeX: int
    gridSizeZ: int
    gridSpacing: int
    gridUseGravity: bool
    occupants: List[List[int]]  # [ [x, z, typeID], ... ]


class JsonPathComp(Model):
    waypoints: List[List[int]]
    showInterp: bool


class JsonVolumeComp(Model):
    radius: float
    height: float
    minPos: List[float]
    maxPos: List[float]


class JsonCameraZone(Model):
    type: int
    flag: bool

    boomLength: float
    boomPitch: float
    viewPitch: float

    posA: List[int]
    posB: List[int]
    posC: List[int]


class JsonCamTargetComp(Model):
    useZone: bool

    overrideDist: bool
    boomLength: float

    overrideAngles: bool
    boomPitch: float
    viewPitch: float

    generatePan: bool
    moveSpeed: float

    cameraZone: Optional[JsonCameraZone] = None


class JsonEntityComp(Model):
    type: EntityType

    itemName: Optional[str] = None
    gameFlagName: Optional[str] = None
    areaFlagName: Optional[str] = None
    scriptName: Optional[str] = None

    index: Optional[int] = None
    style: Optional[int] = None

    modelName: Optional[str] = None
    colliderName: Optional[str] = None
    targetName: Optional[str] = None
    entryName: Optional[str] = None

    angle: Optional[int] = None
    launchDist: Optional[int] = None

    mapVarName: Optional[str] = None
    spawnMode: Optional[str] = None
    pathsName: Optional[str] = None


class JsonMarker(Model):
    id: int
    parent: Optional[int] = None # not relevant for feature generation

    name: str
    desc: Optional[str] = None
    hidden: bool

    type: MarkerType
    pos: List[int]
    yaw: float
    extracted: bool

    npcComp: Optional[JsonNpcComp] = None
    gridComp: Optional[JsonGridComp] = None
    pathComp: Optional[JsonPathComp] = None
    volComp: Optional[JsonVolumeComp] = None
    entityComp: Optional[JsonEntityComp] = None
    camTargetComp: Optional[JsonCamTargetComp] = None


class JsonMap(Model):
    overrideShape: bool
    overrideHit: bool
    overrideTex: bool
    shapeOverrideName: Optional[str] = None
    hitOverrideName: Optional[str] = None

    overrideEntryCount: Optional[int] = None

    locationName: Optional[str] = None

    camVfov: int
    camNearClip: int
    camFarClip: int
    camBackgroundColor: List[int]
    camLeadsPlayer: bool

    fogWorld: List[int]
    fogEntity: List[int]

    hasSpriteShading: bool
    # used by pmret
    shadingProfile: Optional[str] = None
    # used by dx
    shadingOffset: int
    shadingBaseColor: Optional[List[int]] = None

    texPanners: List[JsonTexturePanner] = []
    entrances: List[JsonEntrance] = []
    exits: List[JsonExit] = []
    trees: List[JsonTree] = []
    bushes: List[JsonBush] = []
    markers: List[JsonMarker] = []


def add_entry_list(lines: list[str], json_map: JsonMap) -> None:
    markers = json_map.markers

    # first pass: check if any Entry markers exist
    if not any(m.type == MarkerType.Entry for m in markers):
        return

    entry_list_lines: list[str] = []

    # second pass: generate entries
    for m in markers:
        if m.type == MarkerType.Entry:
            x, y, z = m.pos
            yaw = m.yaw

            entry_list_lines.append(
                f"    {{ {x:6.1f}, {y:6.1f}, {z:6.1f}, {yaw:6.1f} }},"
            )

    # generate lines
    lines.append(f"#define {GEN_PREFIX}ENTRY_LIST \\")
    for line in entry_list_lines:
        lines.append(line + " \\")
    lines.append("")


def add_tex_panners(lines: list[str], json_map: JsonMap) -> None:
    for p in (json_map.texPanners or []):
        if not (p.generate or p.is_nonzero()):
            continue

        max_uv, step_uv, freq, init_uv = p.get_output()

        lines.append(f"#define {GEN_PREFIX}TEX_PANNER_{p.id:X} \\")

        lines.append(f"    TEX_PAN_PARAMS_ID(TEX_PANNER_{p.id:X}) \\")

        if p.useTexels or max_uv != p.DEFAULT_MAXIMUM:
            lines.append(f"    TEX_PAN_PARAMS_MAX(0x{max_uv:X}) \\")

        lines.append(
            "    TEX_PAN_PARAMS_STEP("
            f"{step_uv[0]:6d},{step_uv[1]:6d},{step_uv[2]:6d},{step_uv[3]:6d}) \\"
        )
        lines.append(
            "    TEX_PAN_PARAMS_FREQ("
            f"{freq[0]:6d},{freq[1]:6d},{freq[2]:6d},{freq[3]:6d}) \\"
        )
        lines.append(
            "    TEX_PAN_PARAMS_INIT("
            f"{init_uv[0]:6d},{init_uv[1]:6d},{init_uv[2]:6d},{init_uv[3]:6d}) \\"
        )
        lines.append("")


def add_npc_defines(lines: list[str], npc: JsonNpcComp, namespace: str) -> None:
    is_flying = "TRUE" if npc.flying else "FALSE"

    def speed_override_text(override: bool, speed: float) -> str:
        if override:
            return f"OVERRIDE_MOVEMENT_SPEED({speed:f})"
        return "NO_OVERRIDE_MOVEMENT_SPEED"

    lines.append(f"#define {namespace}_TERRITORY \\")

    if npc.moveType == MoveType.Wander and npc.wander is not None:
        spd = speed_override_text(npc.wander.overrideSpeed, npc.wander.speed)

        cx, cy, cz = npc.wander.center
        lines.append("{ \\")
        lines.append("    .wander = { \\")
        lines.append(f"        .centerPos   = {{ {cx}, {cy}, {cz} }}, \\")

        if npc.wander.useCircle:
            lines.append(f"        .wanderSize  = {{ {npc.wander.radius} }}, \\")
            wander_shape = "SHAPE_CYLINDER"
        else:
            lines.append(f"        .wanderSize  = {{ {npc.wander.sizeX}, {npc.wander.sizeZ} }}, \\")
            wander_shape = "SHAPE_RECT"

        lines.append(f"        .moveSpeedOverride = {spd}, \\")
        lines.append(f"        .wanderShape = {wander_shape}, \\")

        if npc.detect is None:
            raise ValueError("NPC Wander territory requires detect data")

        dx, dy, dz = npc.detect.center
        lines.append(f"        .detectPos   = {{ {dx}, {dy}, {dz} }}, \\")

        if npc.detect.useCircle:
            lines.append(f"        .detectSize  = {{ {npc.detect.radius}, {npc.detect.height} }}, \\")
            detect_shape = "SHAPE_CYLINDER"
        else:
            lines.append(f"        .detectSize  = {{ {npc.detect.sizeX}, {npc.detect.sizeZ} }}, \\")
            detect_shape = "SHAPE_RECT"

        lines.append(f"        .detectShape = {detect_shape}, \\")
        lines.append(f"        .isFlying = {is_flying}, \\")
        lines.append("    }, \\")
        lines.append("}") # no line continuation

    elif npc.moveType == MoveType.Patrol and npc.patrol is not None:
        spd = speed_override_text(npc.patrol.overrideSpeed, npc.patrol.speed)

        pts = npc.patrol.points or []
        lines.append("{ \\")
        lines.append("    .patrol = { \\")
        lines.append(f"        .numPoints = {len(pts)}, \\")
        lines.append("        .points = { \\")

        for p in pts:
            if p is None or len(p) != 3:
                continue
            x, y, z = p
            lines.append(f"            {{ {x}, {y}, {z} }}, \\")

        lines.append("        }, \\")
        lines.append(f"        .moveSpeedOverride = {spd}, \\")

        if npc.detect is None:
            raise ValueError("NPC Patrol territory requires detect data")

        dx, dy, dz = npc.detect.center
        lines.append(f"        .detectPos   = {{ {dx}, {dy}, {dz} }}, \\")

        if npc.detect.useCircle:
            lines.append(f"        .detectSize  = {{ {npc.detect.radius}, {npc.detect.height} }}, \\")
            detect_shape = "SHAPE_CYLINDER"
        else:
            lines.append(f"        .detectSize  = {{ {npc.detect.sizeX}, {npc.detect.sizeZ} }}, \\")
            detect_shape = "SHAPE_RECT"

        lines.append(f"        .detectShape = {detect_shape}, \\")
        lines.append(f"        .isFlying = {is_flying}, \\")
        lines.append("    }, \\")
        lines.append("}") # no line continuation

    else:
        lines.append("{}") # no line continuation


def add_block_grid_defines(lines: list[str], marker: JsonMarker, namespace: str) -> None:
    assert marker.gridComp is not None
    grid = marker.gridComp

    px, py, pz = marker.pos

    gi = grid.gridIndex
    size_x = grid.gridSizeX
    size_z = grid.gridSizeZ
    occupants = grid.occupants or []
    useGravity = grid.gridUseGravity

    lines.append(
        f"#define {namespace}_GRID_PARAMS {gi}, {size_x}, {size_z}, {px}, {py}, {pz}, {NULL_STR}"
    )

    if len(occupants) == 0:
        lines.append(f"#define {namespace}_GRID_CONTENT \\")
        lines.append("    Set(LVar0, LVar0) \\") # NOP
        return

    lines.append(f"#define {namespace}_GRID_CONTENT \\")

    if useGravity:
        lines.append("    Call(SetPushBlockFallEffect, 0, Ref(N(push_block_handle_fall))) \\")

    for occ in occupants:
        if len(occ) < 3:
            raise ValueError(f"BlockGrid marker '{marker.name}' has malformed occupant {occ!r}")
        ox, oz, type_id = occ[0], occ[1], occ[2]

        if not (0 <= ox < size_x and 0 <= oz < size_z):
            raise ValueError(
                f"BlockGrid marker '{marker.name}' occupant out of bounds: x={ox}, z={oz}, "
                f"gridSizeX={size_x}, gridSizeZ={size_z}"
            )

        if type_id == 1:
            lines.append(f"    Call(SetPushBlock, {gi}, {ox}, {oz}, PUSH_GRID_BLOCK) \\")
        elif type_id == 2:
            lines.append(f"    Call(SetPushBlock, {gi}, {ox}, {oz}, PUSH_GRID_OBSTRUCTION) \\")


def add_block_grid_defines_dx(lines: list[str], marker: JsonMarker, namespace: str) -> None:
    px, py, pz = marker.pos

    gi = marker.gridComp.gridIndex
    size_x = marker.gridComp.gridSizeX
    size_z = marker.gridComp.gridSizeZ

    lines.append(
        f"#define {namespace}_GRID_PARAMS {gi}, {size_x}, {size_z}, {px}, {py}, {pz}, {NULL_STR}"
    )

    occs = marker.gridComp.occupants or []
    if len(occs) == 0:
        lines.append(f"#define {namespace}_GRID_CONTENT \\")
        lines.append("    Set(LVar0, LVar0) \\") # NOP
        return

    # build grid[sizeX][sizeZ] filled with 0
    grid = [[0 for _ in range(size_z)] for _ in range(size_x)]

    # fill occupants: grid[x][z] = typeID
    for occ in occs:
        if len(occ) < 3:
            raise ValueError(f"BlockGrid marker '{marker.name}' has malformed occupant {occ!r}")
        ox, oz, type_id = occ[0], occ[1], occ[2]

        if not (0 <= ox < size_x and 0 <= oz < size_z):
            raise ValueError(
                f"BlockGrid marker '{marker.name}' occupant out of bounds: x={ox}, z={oz}, "
                f"gridSizeX={size_x}, gridSizeZ={size_z}"
            )
        grid[ox][oz] = int(type_id)

    # optimize using FillPushBlockZ: scan each Z row, compress runs across X
    lines.append(f"#define {namespace}_GRID_CONTENT \\")
    for j in range(size_z):
        i = 0
        while i < size_x:
            cur = grid[i][j]
            if cur == 0:
                i += 1
                continue

            end = i
            k = i + 1
            while k < size_x and grid[k][j] == cur:
                end = k
                k += 1

            occupant = "PUSH_GRID_BLOCK" if cur == 1 else "PUSH_GRID_OBSTRUCTION"

            if end != i:
                lines.append(f"    Call(FillPushBlockZ, {gi}, {j}, {i}, {end}, {occupant}) \\")
            else:
                lines.append(f"    Call(SetPushBlock, {gi}, {i}, {j}, {occupant}) \\")

            i = end + 1


def add_entity_defines(lines: list[str], ent: JsonEntityComp, namespace: str, marker_lookup: dict[str, JsonMarker]) -> None:
    # special case item entities
    if ent.type is EntityType.Item:
        add_entity_item_defines(lines, ent, namespace)
        return

    # collect type specific arg defines and setup script body
    args: list[str] = []
    body: list[str] = []

    args.append(f"#define {namespace}_TYPE Entity_{ent.type.value}")
    body.append(f"#define {namespace}_BODY \\")
    body.append(f"    EVT_MAKE_ENTITY({namespace}_TYPE, {namespace}_ARGS) \\")

    match ent.type:
        case EntityType.Item:
            # already handled
            return

        case (
            EntityType.SavePoint
            | EntityType.Padlock
            | EntityType.PadlockRedFrame
            | EntityType.PadlockRedFace
            | EntityType.PadlockBlueFace
            | EntityType.CymbalPlant
            | EntityType.PinkFlower
            | EntityType.BellbellPlant
            | EntityType.TrumpetPlant
            | EntityType.Munchlesia
        ):
            # basic entities only need position and yaw
            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR")

        case (
            EntityType.BrickBlock
            | EntityType.TriggerBlock
            | EntityType.InertYellowBlock
            | EntityType.PowBlock
            | EntityType.RedSwitch
            | EntityType.GreenStompSwitch
            | EntityType.Signpost
            | EntityType.BoardedFloor
            | EntityType.ScriptSpring
            | EntityType.StarBoxLauncher
            | EntityType.BombableRock
            | EntityType.BombableRockWide
            | EntityType.Hammer1Block
            | EntityType.Hammer1BlockWideX
            | EntityType.Hammer1BlockWideZ
            | EntityType.Hammer1BlockTiny
            | EntityType.Hammer2Block
            | EntityType.Hammer2BlockWideX
            | EntityType.Hammer2BlockWideZ
            | EntityType.Hammer2BlockTiny
            | EntityType.Hammer3Block
            | EntityType.Hammer3BlockWideX
            | EntityType.Hammer3BlockWideZ
            | EntityType.Hammer3BlockTiny
        ):
            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR")

            if not is_blank(ent.scriptName):
                args.append(f"#define {namespace}_SCRIPT {ent.scriptName}")
                body.append(f"    Call(AssignScript, Ref({namespace}_SCRIPT)) \\")

        case (
            EntityType.BlueSwitch
            | EntityType.HugeBlueSwitch
        ):
            if ent.index is not None:
                args.append(f"#define {namespace}_INDEX {ent.index}")
                args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {namespace}_INDEX")
            else:
                args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR")

            if ent.areaFlagName is not None:
                args.append(f"#define {namespace}_FLAG {ent.areaFlagName}")
                body.append(f"    Call(AssignSwitchFlag, EVT_INDEX_OF_AREA_FLAG({namespace}_FLAG)) \\")

        case (
            EntityType.YellowBlock
            | EntityType.HiddenYellowBlock
            | EntityType.RedBlock
            | EntityType.HiddenRedBlock
        ):
            if is_blank(ent.itemName):
                raise ValueError(f"{namespace}: {ent.type.value} requires itemName")

            args.append(f"#define {namespace}_ITEM {ent.itemName}")
            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {namespace}_ITEM")

            if ent.gameFlagName is not None:
                args.append(f"#define {namespace}_FLAG {ent.gameFlagName}")
                body.append(f"    Call(AssignBlockFlag, {namespace}_FLAG) \\")

            if ent.scriptName is not None:
                args.append(f"#define {namespace}_SCRIPT {ent.scriptName}")
                body.append(f"    Call(AssignScript, Ref({namespace}_SCRIPT)) \\")

        case EntityType.MulticoinBlock:
            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR")

            if ent.gameFlagName is not None:
                args.append(f"#define {namespace}_FLAG {ent.gameFlagName}")
                body.append(f"    Call(AssignBlockFlag, {namespace}_FLAG) \\")

        case EntityType.HiddenPanel:
            if ent.modelName is None:
                raise ValueError(f"{namespace}: HiddenPanel requires modelName")

            args.append(f"#define {namespace}_MODEL {ent.modelName}")
            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {namespace}_MODEL")

            if ent.gameFlagName is not None:
                args.append(f"#define {namespace}_FLAG {ent.gameFlagName}")
                body.append(f"    Call(AssignPanelFlag, {namespace}_FLAG) \\")

        case (
            EntityType.Chest
            | EntityType.GiantChest
        ):
            # chests have unused arg for itemID. generate with ITEM_NONE to match.
            # ...except a couple giant chests (tik_25) DO have this set, even though its unused.
            if ent.itemName is not None:
                args.append(f"#define {namespace}_ITEM {ent.itemName}")
                args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {namespace}_ITEM")
            else:
                args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, ITEM_NONE")

            if ent.gameFlagName is not None:
                args.append(f"#define {namespace}_FLAG {ent.gameFlagName}")
                body.append(f"    Call(AssignChestFlag, {namespace}_FLAG) \\")

            if ent.scriptName is not None:
                args.append(f"#define {namespace}_SCRIPT {ent.scriptName}")
                body.append(f"    Call(AssignScript, Ref({namespace}_SCRIPT)) \\")

        case EntityType.WoodenCrate:
            # too restrictive?
            if ent.itemName is None or not ent.itemName.startswith("ITEM_"):
                raise ValueError(f"{namespace}: WoodenCrate requires valid itemName ({ent.itemName})")

            if not ent.itemName or ent.itemName == "ITEM_NONE":
                args.append(f"#define {namespace}_ITEM -1")
            else:
                args.append(f"#define {namespace}_ITEM {ent.itemName}")

            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {namespace}_ITEM")

            if ent.gameFlagName is not None:
                args.append(f"#define {namespace}_FLAG {ent.gameFlagName}")
                body.append(f"    Call(AssignCrateFlag, {namespace}_FLAG) \\")

        case EntityType.HeartBlock:
            if ent.style is not None:
                args.append(f"#define {namespace}_STYLE {ent.style}")
                args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {namespace}_STYLE")
            else:
                args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR")

        case EntityType.SuperBlock:
            if is_blank(ent.mapVarName):
                raise ValueError(f"{namespace}: SuperBlock requires mapVarName")
            if is_blank(ent.gameFlagName):
                raise ValueError(f"{namespace}: SuperBlock requires gameFlagName")

            args.append(f"#define {namespace}_VAR {ent.mapVarName}")
            args.append(f"#define {namespace}_FLAG {ent.gameFlagName}")
            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR")

        case EntityType.ArrowSign:
            args.append(f"#define {namespace}_ANGLE {ent.angle}")
            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {namespace}_ANGLE")

        case EntityType.SimpleSpring:
            if ent.launchDist is None:
                raise ValueError(f"{namespace}: SimpleSpring requires launchDist")

            args.append(f"#define {namespace}_DIST {ent.launchDist}")
            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {namespace}_DIST")

        case EntityType.SpinningFlower:
            if ent.targetName is not None:
                target = marker_lookup.get(ent.targetName)
                if target is None:
                    raise ValueError(f"{namespace}: target marker '{ent.targetName}' not found")
                target_namespace = GEN_PREFIX + clean_name(target.name)

                args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {target_namespace}_VEC")
            else:
                args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR")

        case EntityType.BlueWarpPipe:
            if is_blank(ent.entryName):
                raise ValueError(f"{namespace}: BlueWarpPipe requires entryName")
            if is_blank(ent.scriptName):
                raise ValueError(f"{namespace}: BlueWarpPipe requires scriptName")
            if is_blank(ent.gameFlagName):
                raise ValueError(f"{namespace}: BlueWarpPipe requires gameFlagName")

            args.append(f"#define {namespace}_ENTRY {ent.entryName}")
            args.append(f"#define {namespace}_SCRIPT {ent.scriptName}")
            args.append(f"#define {namespace}_FLAG {ent.gameFlagName}")

            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, "
                f"{namespace}_ENTRY, {namespace}_SCRIPT, EVT_INDEX_OF_GAME_FLAG({namespace}_FLAG)")

        case EntityType.Tweester:
            if is_blank(ent.pathsName):
                raise ValueError(f"{namespace}: Tweester requires pathsName")
            if is_blank(ent.scriptName):
                raise ValueError(f"{namespace}: Tweester requires scriptName")

            args.append(f"#define {namespace}_PATHS {ent.pathsName}")
            args.append(f"#define {namespace}_ARGS {namespace}_VEC, {namespace}_DIR, {namespace}_PATHS")

            if ent.scriptName is not None:
                args.append(f"#define {namespace}_SCRIPT {ent.scriptName}")
                body.append(f"    Call(AssignScript, {namespace}_SCRIPT) \\")

        case _:
            raise ValueError(f"{namespace}: Unsupported entity type ({ent.type.value})")

    lines.extend(args)
    lines.extend(body)


def add_entity_item_defines(lines: list[str], ent: JsonEntityComp, namespace: str) -> None:
    # too restrictive?
    if ent.itemName is None or not ent.itemName.startswith("ITEM_"):
        raise ValueError(f"{namespace}: ItemEntity requires valid itemName ({ent.itemName})")
    if is_blank(ent.spawnMode):
        raise ValueError(f"{namespace}: ItemEntity requires spawnMode")
    if is_blank(ent.gameFlagName):
        raise ValueError(f"{namespace}: ItemEntity requires gameFlagName")

    lines.append(f"#define {namespace}_ITEM {ent.itemName}")
    lines.append(f"#define {namespace}_SPAWN {ent.spawnMode}")
    lines.append(f"#define {namespace}_FLAG {ent.gameFlagName}")

    lines.append(
        f"#define {namespace}_ARGS "
        f"{ent.itemName}, {namespace}_VEC, {ent.spawnMode}, {ent.gameFlagName}"
    )

    lines.append(f"#define {namespace}_BODY \\")
    lines.append(f"    Call(MakeItemEntity, {namespace}_ARGS)")


def add_markers(lines: list[str], json_map: JsonMap) -> None:
    # create name --> marker lookup
    marker_lookup = {m.name: m for m in (json_map.markers or [])}

    for m in (json_map.markers or []):
        if m.type in (MarkerType.Root, MarkerType.Group):
            continue

        x, y, z = m.pos
        yaw = int(round(m.yaw))

        namespace = GEN_PREFIX + clean_name(m.name)

        lines.append(f"#define {namespace}_X {x:d}")
        lines.append(f"#define {namespace}_Y {y:d}")
        lines.append(f"#define {namespace}_Z {z:d}")
        lines.append(f"#define {namespace}_DIR {yaw:d}")
        lines.append(f"#define {namespace}_VEC {x:d},{y:d},{z:d}")

        match m.type:
            case MarkerType.Root | MarkerType.Group:
                # should be unreachable due to earlier return
                raise RuntimeError("Unexpected Root/Group marker in header generation")

            case MarkerType.Position | MarkerType.Entry:
                # no additional defines
                pass

            case MarkerType.Sphere:
                if m.volComp is None:
                    raise ValueError(f"Sphere marker '{m.name}' missing volComp")
                radius = int(round(m.volComp.radius))
                lines.append(f"#define {namespace}_RAD {radius}")

            case MarkerType.Cylinder:
                if m.volComp is None:
                    raise ValueError(f"Cylinder marker '{m.name}' missing volComp")
                radius = int(round(m.volComp.radius))
                height = int(round(m.volComp.height))
                lines.append(f"#define {namespace}_RAD {radius}")
                lines.append(f"#define {namespace}_HEIGHT {height}")

            case MarkerType.Volume:
                if m.volComp is None:
                    raise ValueError(f"Volume marker '{m.name}' missing volComp")
                # json float -> integer grid coords
                x1, y1, z1 = (int(round(v)) for v in m.volComp.minPos[:3])
                x2, y2, z2 = (int(round(v)) for v in m.volComp.maxPos[:3])

                if not matching:
                    # ensure min <= max per axis
                    if x2 < x1: x1, x2 = x2, x1
                    if y2 < y1: y1, y2 = y2, y1
                    if z2 < z1: z1, z2 = z2, z1

                lines.append(f"#define {namespace}_MIN_X {x1}")
                lines.append(f"#define {namespace}_MIN_Y {y1}")
                lines.append(f"#define {namespace}_MIN_Z {z1}")
                lines.append(f"#define {namespace}_MIN_XZ  {x1},{z1}")
                lines.append(f"#define {namespace}_MIN_VEC {x1},{y1},{z1}")

                lines.append(f"#define {namespace}_MAX_X {x2}")
                lines.append(f"#define {namespace}_MAX_Y {y2}")
                lines.append(f"#define {namespace}_MAX_Z {z2}")
                lines.append(f"#define {namespace}_MAX_XZ  {x2},{z2}")
                lines.append(f"#define {namespace}_MAX_VEC {x2},{y2},{z2}")

            case MarkerType.Path:
                if m.pathComp is None:
                    raise ValueError(f"Path marker '{m.name}' missing pathComp")

                if len(m.pathComp.waypoints) > 0:
                    lines.append(f"#define {namespace}_PATH \\")
                    for x, y, z in m.pathComp.waypoints:
                        lines.append(f"    {{ {x:4d}, {y:4d}, {z:4d} }}, \\")

            case MarkerType.NPC:
                if m.npcComp is None:
                    raise ValueError(f"NPC marker '{m.name}' missing npcComp")

                add_npc_defines(lines, m.npcComp, namespace)

            case MarkerType.Entity:
                if m.entityComp is None:
                    raise ValueError(f"Entity marker '{m.name}' missing entityComp")

                add_entity_defines(lines, m.entityComp, namespace, marker_lookup)

            case MarkerType.BlockGrid:
                if m.gridComp is None:
                    raise ValueError(f"BlockGrid marker '{m.name}' missing gridComp")

                add_block_grid_defines(lines, m, namespace)

            case MarkerType.CamTarget:
                # TODO
                pass

            case _:
                raise ValueError(f"Unhandled marker type: {m.type}")

        lines.append("")


def add_fog_defines(lines: list[str], name: str, params: List[int]) -> None:
    # check if enabled
    if params[0] == 0:
        return

    # unpack
    r = params[1]
    g = params[2]
    b = params[3]
    a = params[4]
    near = params[5]
    far = params[6]

    lines.append(f"#define {GEN_PREFIX}{name}_FOG_RGBA {r:d},{g:d},{b:d},{a:d}")
    lines.append(f"#define {GEN_PREFIX}{name}_FOG_NEAR {near:d}")
    lines.append(f"#define {GEN_PREFIX}{name}_FOG_FAR  {far:d}")
    lines.append(f"#define {GEN_PREFIX}{name}_FOG_DIST {near:d},{far:d}")
    lines.append("")


def render_header(map_name: str, features_path: Path | None, json_map: JsonMap) -> str:
    lines: list[str] = []
    lines.append("// Auto-generated from features.json. Do not edit.")
    lines.append("")

    if json_map.locationName is not None:
        lines.append(f"#define {GEN_PREFIX}MAP_LOCATION {json_map.locationName}")

    if json_map.shadingProfile is not None:
        lines.append(f"#define {GEN_PREFIX}SPRITE_SHADING SHADING_{json_map.shadingProfile.upper()}")
    else:
        lines.append(f"#define {GEN_PREFIX}SPRITE_SHADING SHADING_NONE")

    lines.append("")

    lines.append(f"#define {GEN_PREFIX}CAM_VFOV {json_map.camVfov:d}")
    lines.append(f"#define {GEN_PREFIX}CAM_NEAR_CLIP {json_map.camNearClip:d}")
    lines.append(f"#define {GEN_PREFIX}CAM_FAR_CLIP {json_map.camFarClip:d}")
    lines.append(f"#define {GEN_PREFIX}CAM_BG_R {json_map.camBackgroundColor[0]:d}")
    lines.append(f"#define {GEN_PREFIX}CAM_BG_G {json_map.camBackgroundColor[1]:d}")
    lines.append(f"#define {GEN_PREFIX}CAM_BG_B {json_map.camBackgroundColor[2]:d}")
    lines.append(f"#define {GEN_PREFIX}CAM_LEADS_PLAYER {json_map.camLeadsPlayer:d}")
    lines.append("")

    add_fog_defines(lines, "WORLD", json_map.fogWorld)
    add_fog_defines(lines, "ENTITY", json_map.fogEntity)

    add_entry_list(lines, json_map)

    add_tex_panners(lines, json_map)

    add_markers(lines, json_map)

    lines.append("")
    return "\n".join(lines)


def write_if_changed(path: Path, content: str) -> None:
    if path.exists():
        existing = path.read_text()
        if existing == content:
            return
    path.write_text(content)


def ensure_header_include(map_header: Path) -> None:
    if not map_header.exists():
        return

    lines = map_header.read_text().splitlines()
    include_line = f'#include "generated.h"'
    if include_line in lines:
        return

    for idx, line in enumerate(lines):
        if line.strip() == '#include "map.h"':
            lines.insert(idx, include_line)
            break
    else:
        lines.insert(0, include_line)

    write_if_changed(map_header, "\n".join(lines) + "\n")


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate map features header")
    parser.add_argument("map_dir")
    args = parser.parse_args()

    map_dir = Path(args.map_dir)
    output = map_dir / "generated.h"
    features_path = map_dir / "features.json"
    if not features_path.exists():
        features_path = None
    map_name = map_dir.name

    if features_path is not None:
        json_data = json.loads(features_path.read_text())
    else:
        json_data = {}

    json_map = JsonMap.model_validate(json_data)

    output.parent.mkdir(parents=True, exist_ok=True)
    content = render_header(map_name, features_path, json_map)
    write_if_changed(output, content)
    ensure_header_include(map_dir / f"{map_name}.h")


if __name__ == "__main__":
    main()
