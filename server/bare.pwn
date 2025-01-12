#include <a_samp>
#include <core>
#include <float>

#include "mdialog.inc"

#pragma tabsize 0

enum {
  // 10x  welcome
  DIALOG_WELCOME       = 100,    // Добро пожаловать на сервер! Пропишите пожалуйста /q...
  // 11x  register
  DIALOG_REG_START     = 110,    // Ваш аккаунт не зарегистрирован. Введите email для продолжения.
  DIALOG_REG_CONFIRM   = 111,    // Проверьте email, на него код подтверждения будет отправлен.
  DIALOG_REG_CODE      = 112,    // Введите код, отправленный вам на почту.
  // 12x  login
  DIALOG_LOGIN_PROMPT  = 120,    // Ваш аккаунт зарегистрирован! Введите пароль для входа.
  DIALOG_PASS_RESET    = 121     // Забыли пароль? Введите код, отправленный вам на почту.
};

// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!
// !!!!!!!! ПЕРЕНЕСТИ В ОТДЕЛЬНЫЙ ИНКЛУД !!!!!!!!

// ~ ЕБУЧИЕ ДИАЛОГИ ~ 
// ------------------

DialogCreate:Welcome(playerid) {
  Dialog_Open(
    playerid,
    Dialog:Welcome,
    DIALOG_STYLE_MSGBOX,
    "Welcome!",
    "Добро пожаловать на сервернейм!\n\n"                                     \
    "Продолжая, вы соглашаетесь с условиями использования,\n"                 \
    "политикой конфиденциальности и прочей хуйней. (aiwprton.ru/rules) \n\n"  \
    "Если вы не согласны с этим, выйдите из игры. (/q)",
    "Принять", 
    ""  // пустая кнопка для отказа
  ); 
}

DialogResponse:Welcome(playerid, response, listitem, inputtext[]) {
  if (!response) {
    Kick(playerid);
  } else {
    // проверка на наличие игроча в бд
    Dialog_Show(playerid, Dialog:RegStart); 
  }
  return 1;
}

DialogCreate:RegStart(playerid)
{
    Dialog_Open(
        playerid,
        Dialog:RegStart,
        DIALOG_STYLE_INPUT,
        "Регистрация",
        "Ваш аккаунт не зарегистрирован. Введите email для продолжения:",
        "Продолжить",
        "Назад"
    );
}

// ------------------

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
	SetPlayerInterior(playerid,0);
	TogglePlayerClock(playerid,0);
	return 1;
}

public OnPlayerRequestClass(playerid, classid) {

	TogglePlayerSpectating(playerid, true);

  Dialog_Show(playerid, Dialog:Welcome);

	// ShowPlayerDialog(playerid, 1488, DIALOG_STYLE_PASSWORD, "Авторизация", "введи в ето поле ваш пароль:", "ок", "не ок");
	return 0;
}

