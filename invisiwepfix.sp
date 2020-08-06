#include <sourcemod>
#include <sdktools>
#include <tf2>
#include <tf2_stocks>

public Plugin myinfo = 
{
	name = "inivisiwepfix",
	author = "Frenzoid",
	description = "Fixes invisible weapons on red team",
	version = "1.0",
	url = ""
};

public void OnPluginStart()
{
	HookEvent("teamplay_round_start", Fix_Function, EventHookMode_Post);
}

public Action Fix_Function(Event eEvent, const char[] sName, bool bDontBroadcast)
{
	for (new i = 1; i <= MaxClients; i++)
	{
		if (IsClientInGame(i) && (!IsFakeClient(i)) && IsPlayerAlive(i))
		{
			TF2_RemoveAllWeapons(i);
			TF2_RegeneratePlayer(i);
		}
	}
}

