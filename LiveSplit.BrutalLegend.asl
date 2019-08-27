state("BrutalLegend")
{
	float tributes : "BrutalLegend.exe", 0x00C09CB0, 0x44, 0x28, 0x0, 0x14, 0x46C;
}

startup
{
	settings.Add("Campaign", true);
	settings.Add("FT25", true, "Brütal Victory", "Campaign");
	settings.SetToolTip("FT25", "Note: Does NOT split for \"Welcome to the Age of Metal\", and \"Abomination Overdrive\"");
	
	settings.Add("Collectables", false);
	settings.Add("FT5", false, "Bound Serpent Freed", "Collectables");
	settings.Add("FT10", false, "Various (Worth 10 Tributes)", "Collectables");
	settings.SetToolTip("FT10", "Buried Metal, Landmark Viewer, Lightning Spark Plug Jump");
}

exit
{
	timer.IsGameTimePaused = true;
}

split
{
	if (current.tributes > old.tributes)
	{
		float diff = current.tributes - old.tributes;
		
		if (diff < 6)
		{
			return settings["FT5"];
		}
		else if (diff < 11)
		{
			return settings["FT10"];
		}
		else if (diff < 24 || diff > 36)
		{
			// Avoid increase of 15 (free-roam kills)
			// Avoid huge increases (loading save/chapter)
			return false;
		}
		else
		{
			return settings["FT25"];
		}
	}
}
