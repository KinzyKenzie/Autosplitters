state("The_Haunted_Island")
{
	float scene : "UnityPlayer.dll", 0x0108FA30, 0x4, 0x18, 0x24, 0x14, 0x30C;
	float fade : "UnityPlayer.dll", 0x01097998, 0x0, 0x554, 0x2D0, 0xC4, 0x2D0;
}

init
{
	refreshRate = 300;
}

startup
{
	vars.sceneID = new string[] {
		"MainMenu",
		"PhoneCall",
		"Boat",
		"Island",
		"CaveExplosion",
		"Cave",
		"CaveExit",
		"Dance",
		"PickWinner",
		"Goodbye"
	};
	
	vars.scenes = new Dictionary<string, int> {
		{"MainMenu", 688},
		{"PhoneCall", 1907},
		{"Boat", 16734},
		{"Island", 14091},
		{"CaveExplosion", 7841},
		{"Cave", 6453},
		{"CaveExit", 7955},
		{"Dance", 8853},
		{"PickWinner", 466},
		{"Goodbye", 7078}
	};
	
	settings.Add("Split on Load", true);
	settings.Add("PhoneCall", true, "Office", "Split on Load");
	settings.Add("Boat", true, "Boat Cutscene", "Split on Load");
	settings.Add("Island", true, "Dynamite Get", "Split on Load");
	settings.Add("CaveExplosion", true, "Cave Opening", "Split on Load");
	settings.Add("Cave", true, "Cave Interior", "Split on Load");
	settings.Add("CaveExit", true, "Reunited", "Split on Load");
	settings.Add("Dance", true, "Dance Party", "Split on Load");
	settings.Add("PickWinner", true, "Pick the Winner", "Split on Load");
	settings.Add("Goodbye", true, "Wave Goodbye", "Split on Load");
}

exit
{
	timer.IsGameTimePaused = true;
}

start
{
	if (current.fade < old.fade) return true;
}

split
{
	if (current.scene != old.scene)
	{
		string segment;
		
		for (int i = 1; i < vars.scenes.Count; i++)
		{
			segment = vars.sceneID[i];
			
			if (Math.Abs(old.scene - vars.scenes[segment]) <= 1 && settings[segment])
			{
				return true;
			}
		}
	}
}
