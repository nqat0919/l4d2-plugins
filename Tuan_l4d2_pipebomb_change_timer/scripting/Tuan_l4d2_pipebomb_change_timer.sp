#pragma semicolon 1
#pragma newdecls required
#include <sourcemod>
#include <sdktools>
#include <left4dhooks>
#include <colors>
#define PLUGIN_VERSION "1.2"
ConVar pipebomb_duration;

enum struct Context
{
	ArrayList projectiles;
	bool init;
	float time;
	void constructor()
	{
		if (this.init) return;
		this.init = true;
		this.projectiles = new ArrayList();
		this.time = GetExplodeTime(); //mặc định
	}
	
	void toggleMode()
	{
		this.time = this.time == GetExplodeTime() ? 1.0 : GetExplodeTime();
	}
}
Context g_clientPrj[MAXPLAYERS + 1];
bool g_InReload[MAXPLAYERS + 1];
bool g_ShowHelp[MAXPLAYERS + 1];
#define TRANSLATION_FILENAME 	"l4d2_pipebomb_change_timer.tuan.phrases"

public Plugin myinfo = 
{
	name 			= "[L4D2] Pipebomb changing timer",
	author 			= "Tuan",
	description 	= "Allows survivors to change their pipebomb timer on its explosion",
	version 		=  PLUGIN_VERSION,
	url 			= ""
}

public void OnPluginStart()
{
	LoadTrans();
	pipebomb_duration = FindConVar("pipe_bomb_timer_duration");
	for (int i = 1; i <= MaxClients; i++)
	{
		g_clientPrj[i].constructor();
	}
}

void LoadTrans()
{
	char path[256];
	BuildPath(Path_SM, path, sizeof(path), "translations/%s.txt", TRANSLATION_FILENAME);
	if (FileExists(path)) {
		LoadTranslations(TRANSLATION_FILENAME);
	}
}

public void OnPlayerRunCmdPost(int client, int buttons)
{
	int weapon = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
	if ( weapon == -1 )
		return;
	char className[64];
	char message[255];
	GetEntityClassname(weapon, className, sizeof className);
	if (strcmp(className, "weapon_pipe_bomb") != 0) return;
	if (buttons & IN_ATTACK)
	{
		if (!g_ShowHelp[client])
		{
			Format(message, sizeof(message), "%t", "Helper Message");
			CPrintToChat(client, message);
			g_ShowHelp[client] = true;
			g_clientPrj[client].time = GetExplodeTime(); //Đặt lại thời gian nổ mặc định cho Pipebomb này
		}
		if (!g_InReload[client] && (buttons & IN_RELOAD))
		{
			g_clientPrj[client].toggleMode();
			g_InReload[client] = true;
			Format(message, sizeof(message), "%t", "Change Message", RoundFloat(g_clientPrj[client].time));
			CPrintToChat(client, message);
		}
		else if (g_InReload[client] && !(buttons & IN_RELOAD))
			g_InReload[client] = false;
	}
	else
	{
		g_ShowHelp[client] = false;
	}
}

public void OnEntityCreated(int entity, const char[] classname)
{
	if (strcmp(classname, "pipe_bomb_projectile") != 0) return;
	SDKHook(entity, SDKHook_SpawnPost, OnSpawnPost);
}

public void OnSpawnPost( int entity )
{
	RequestFrame(NextFrame, EntIndexToEntRef(entity));
}

public void NextFrame(int entityRef)
{
	int entity = EntRefToEntIndex(entityRef);
	if (entity <= MaxClients || !IsValidEntity(entity)) return;
	int client = GetEntPropEnt(entity, Prop_Data, "m_hThrower");
	if (1 <= client <= MaxClients && IsClientConnected(client) && GetClientTeam(client) == 2)
	{
		g_clientPrj[client].projectiles.Push(entityRef);
		CreateTimer(g_clientPrj[client].time, Explode_Timer_Handle, client);
	}
}

Action Explode_Timer_Handle(Handle timer, int client)
{
	if (!IsClientConnected(client) || !g_clientPrj[client].projectiles.Length) return Plugin_Continue;
	int entity = EntRefToEntIndex(g_clientPrj[client].projectiles.Get(0));
	g_clientPrj[client].projectiles.Erase(0);
	if (!IsValidEntity(entity) || entity <= MaxClients) return Plugin_Continue;
	L4D_DetonateProjectile(entity);
	return Plugin_Continue;
}

public void OnMapEnd() 
{
	for (int i = 1; i <= MaxClients; i++)
	{
		g_clientPrj[i].projectiles.Clear();
	}
}

public void OnClientPutInServer(int client)
{
	if (!g_clientPrj[client].init){
		g_clientPrj[client].constructor();
	}
}

float GetExplodeTime()
{
	return pipebomb_duration.FloatValue;
}