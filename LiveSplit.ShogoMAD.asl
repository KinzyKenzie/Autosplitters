state("Client") {
    string16 stage : 0x89D74, 0x12C, 0x694;
}

startup {
    settings.Add("Main Stages", true);
	settings.SetToolTip("Main Stages", "Splits when a stage is finished");
	
    settings.Add("Good Ending", true);
    settings.Add("Bad Ending", false);

    // Internal level ID, readable name, the default (null = not ticked by default), and the parent
    vars.stages = new[] {
        new[] { "01_Ambush",        "The Ambush",                 null,       "Main Stages" },
        new[] { "02_Quarters",      "Calm Before The Storm",      null,       "Main Stages" },
        new[] { "03_MCA_Dock",      "Mission Briefing",           null,       "Main Stages" },
        new[] { "04_Shuttlebay",    "Shuttle Bay Cutscene",       "default",  "Main Stages" },
        new[] { "05_LZ_Monitaur",   "The Storm",                  "default",  "Main Stages" },
        new[] { "06_Entrance",      "Approach",                   "default",  "Main Stages" },
        new[] { "07_Avernus1",      "City Of Ghosts",             "default",  "Main Stages" },
        new[] { "08_Airshafts",     "High And Low",               "default",  "Main Stages" },
        new[] { "09_Comm1",         "Infiltration",               "default",  "Main Stages" },
        new[] { "10_Comm2",         "A Familiar Voice",           "default",  "Main Stages" },
        new[] { "12_Comm3",         "Escape",                     "default",  "Main Stages" },
        new[] { "13_New_MCA",       "Once a Thief",               "default",  "Main Stages" },
        new[] { "14_Maritropa1",    "Public Nuisance",            "default",  "Main Stages" },
        new[] { "15_Depot",         "MEV Depot 17",               "default",  "Main Stages" },
        new[] { "16_Slums",         "Maritropa Slums",            "default",  "Main Stages" },
        new[] { "17_Lost_Cat",      "Lost Cat",                   null,       "Main Stages" },
        new[] { "18_Slums",         "Maritropa Slums II",         null,       "Main Stages" },
        new[] { "19_Rendezvous",    "The Mecca",                  "default",  "Main Stages" },
        new[] { "20_Maritropa1",    "Shanira District",           "default",  "Main Stages" },
        new[] { "21_Maritropa2",    "City On Fire",               "default",  "Main Stages" },
        new[] { "22_Tram",          "Downtown Train",             null,       "Main Stages" },
        new[] { "24_CMC-Sec1",      "The Favor",                  "default",  "Main Stages" },
        new[] { "25_CMC_Sec2",      "Rescue Attempt",             null,       "Main Stages" },
        new[] { "26_Tram",          "Runaway Train",              "default",  "Main Stages" },
        new[] { "27_New_MCA",       "Bullet In The Head",         "default",  "Main Stages" },
        new[] { "28_Airshipdock",   "An Old Friend",              "default",  "Main Stages" },
        new[] { "29_Airship",       "A New Insight",              "default",  "Main Stages" },
        new[] { "30_Research",      "Oshii Research Station",     "default",  "Main Stages" },
        new[] { "31_Avernus1",      "City Of Hope",               "default",  "Main Stages" },
        new[] { "32_Museum",        "History of Warfare",         null,       "Main Stages" },
        new[] { "33_Quarters",      "Prodigal Son",               null,       "Main Stages" },

        new[] { "34_Spires",        "Unnexpected Complications",  "default",  "Good Ending" },
        new[] { "35_Fortress",      "The Hidden Fortress",        "default",  "Good Ending" },
        new[] { "36_Elevator",      "Baku",                       "default",  "Good Ending" },
        new[] { "37_Gabriel",       "Brother's Keeper",           "default",  "Good Ending" },

        new[] { "34_Energy_Plant",  "Belly of the Beast",         null,       "Bad Ending"  },
        new[] { "35_Command",       "Central Command",            null,       "Bad Ending"  },
        new[] { "36_Kato_Center",   "Countdown",                  null,       "Bad Ending"  }
    };

    foreach (string[] istage in vars.stages) {
        bool default_on = (istage[2] != null);
        settings.Add(istage[0], default_on, istage[1], istage[3]);
    }
}

start {
    // If we entered 01_Ambush, we're starting the timer
    if ((current.stage == vars.stages[0][0]) && (current.stage != old.stage)) {
        return true;
    }
}

split {
    // If we've changed stage, split if the old stage was ticked
    if (current.stage != old.stage) {
        return settings[old.stage];
    }
}
