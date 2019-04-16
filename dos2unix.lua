-- scaffold geniefile for dos2unix

dos2unix_script = path.getabsolute(path.getdirectory(_SCRIPT))
dos2unix_root = path.join(dos2unix_script, "dos2unix")

dos2unix_includedirs = {
	path.join(dos2unix_script, "config"),
	dos2unix_root,
}

dos2unix_libdirs = {}
dos2unix_links = {}
dos2unix_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { dos2unix_includedirs }
	end,

	_add_defines = function()
		defines { dos2unix_defines }
	end,

	_add_libdirs = function()
		libdirs { dos2unix_libdirs }
	end,

	_add_external_links = function()
		links { dos2unix_links }
	end,

	_add_self_links = function()
		links { "dos2unix" }
	end,

	_create_projects = function()

project "dos2unix"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		dos2unix_includedirs,
	}

	defines {}

	files {
		path.join(dos2unix_script, "config", "**.h"),
		path.join(dos2unix_root, "**.h"),
		path.join(dos2unix_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
