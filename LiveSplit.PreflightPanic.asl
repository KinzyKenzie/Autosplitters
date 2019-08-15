state("devdiary1")
{
	byte sceneID : "devdiary1.exe", 0x004B0940, 0x0, 0x44, 0x2C, 0x640;
}

start
{
	return (old.sceneID == 0 && current.sceneID == 32);
}

split
{
	return (current.sceneID < old.sceneID);
}
