// RoboCop (2003) Autosplitter
// by Makkebakke

state("Robocop") {
	
	bool gameActive : "Robocop.exe", 0x1219E0; // 0 in menus, 1 otherwise
	byte screenMode : "Robocop.exe", 0x12A78C; // ID of the current screen
	bool isLoading  : "Robocop.exe", 0x143854; // 0 when idle, 1 when loading
	
}

start {
	return (current.gameActive && !old.gameActive);
}

split {
	if (current.screenMode != old.screenMode) {
		return (current.screenMode == 1);
	}
}

isLoading {
	return current.isLoading;
}
