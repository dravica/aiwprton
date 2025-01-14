// стандартные инклуды
#include <a_samp>
#include <core>
#include <float>
// внешние зависимости
#include <Pawn.Regex>
#include <mdialog>
// части самого гейммода
#include "auth.inc"
// не знаю, зачем оно нужно
#pragma tabsize 0

main() {
    print("Bare Script\n");
}

public OnGameModeInit() {
    return 1;
}

public OnPlayerConnect(playerid) {
    return 1;
}

public OnPlayerSpawn(playerid) {
    SetPlayerInterior(playerid, 0);
    TogglePlayerClock(playerid, 0);
    return 1;
}

public OnPlayerRequestClass(playerid, classid) {
    new text[144];
    format(text, sizeof(text), "Your requested class ID is:{fcd5ce} %d", classid);
    SendClientMessage(playerid, -1, text);

    TogglePlayerSpectating(playerid, true);
    Dialog_Show(playerid, Dialog:Welcome);

    return 0;
}