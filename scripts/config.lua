Setup.Package
{
 	vendor = "liflg.org",
 	id = "machinarium",
 	description = "Machinarium",
 	version = "1.02-german",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg"
 	},

	Setup.Media
 	{
 		id = "machinarium-disc",
		description = "German Machinarium DVD",
		uniquefile = "Dokumente/Handbuch.pdf"	
 	},

	Setup.Option {
		required = true,
		description = "Files for Machinarium",
		bytes = 365159282,
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Machinarium",
                        genericname = "Machinarium Adventure",
                        tooltip = "Play Machinarium",
                        builtin_icon = false,
                        icon = "machinarium.png",
                        commandline = "%0/Machinarium.sh",
                        category = "Game",
                },
		
		Setup.File {
			source = "media://machinarium-disc/Machinarium/",
			filter = function(dest)
				if ( string.match( dest, "Icon_" ) ) then
					return nil
				end
				if ( string.match( dest, "machinarium.exe" ) ) then
					return nil
				end	
				return dest
			end
		},

		Setup.File 
		{
			wildcards =  {"Machinarium.sh", "Machinarium" },
			permissions = "0755",
		},

		Setup.File
		{	
			wildcards = { "README.liflg", "machinarium.png" },
		},

		Setup.File
		{
			source = "media://machinarium-disc/Dokumente/",
		},
		
		Setup.Option {
			value = true,
			required = true,
			description = "Apply Patch 1.02",
			tooltip = "Latest update",
			bytes = 85689840,
			Setup.File{
				allowoverwrite = true,
				source = "base:///patch_02-DE.tar/",
			},
		},
	},

	Setup.Option {
		required = true,
		description = "Flashplayer libraries",
		bytes = 17928524,

		Setup.File {
			source = "base:///libs-firefox.tar",
		},
	},
}	
