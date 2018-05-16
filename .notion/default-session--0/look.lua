-- Based on look_clean.lua drawing engine configuration file for Ion.

if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
	shadow_colour     = "grey",
	highlight_colour  = "grey",
	background_colour = "#CCCCCC",
	foreground_colour = "#000000",
	padding_pixels    = 1,
	highlight_pixels  = 1,
	shadow_pixels     = 1,
	border_style      = "elevated",
	font              = "fixed",
	text_align        = "center",
})


de.defstyle("frame", {
	based_on               = "*",
	padding_colour         = "#545d75",
	transparent_background = false,
	background_colour      = "black",
})


de.defstyle("frame-tiled", {
	based_on         = "frame",
	padding_pixels   = 0,
	highlight_pixels = 0,
	shadow_pixels    = 0,
	spacing          = 0,
})


de.defstyle("tab", {
	based_on = "*",
	font = "-*-helvetica-medium-r-normal-*-12-*-*-*-*-*-*-*",

	de.substyle("active-selected", {
		shadow_colour     = "#6966a6",
		highlight_colour  = "#6966a6",
		foreground_colour = "white",
		background_colour = "#8986c6",	
	}),

	de.substyle("active-unselected", {
		shadow_colour     = "#404443",
		highlight_colour  = "#404443",
		background_colour = "#606463",
		foreground_colour = "grey",
	}),

	de.substyle("inactive-selected", {
		shadow_colour     = "#404443",
		highlight_colour  = "#404443",
		background_colour = "#606463",
		foreground_colour = "grey",
	}),

	de.substyle("inactive-unselected", {
		shadow_colour     = "#404443",
		highlight_colour  = "#404443",
		background_colour = "#606463",
		foreground_colour = "grey",
	}),
	
	text_align     = "left",
	padding_pixels = 3,
})


de.defstyle("tab-frame", {
	based_on = "tab",
	de.substyle("*-*-*-*-activity", {
		shadow_colour     = "#770000",
		highlight_colour  = "#770000",
		background_colour = "#BC0000",
		foreground_colour = "#ffffff",
	}),
})


de.defstyle("tab-frame-tiled", {
	based_on = "tab-frame",
	spacing  = 0,
})


de.defstyle("tab-menuentry", {
	based_on   = "tab",
	text_align = "left",
	de.substyle("inactive-selected", {
		shadow_colour     = "#424468",
		highlight_colour  = "#424468",
		background_colour = "#626488",
		foreground_colour = "grey",
	}),
})


de.defstyle("tab-menuentry-big", {
	based_on       = "tab-menuentry",
	font           = "-*-helvetica-bold-r-normal-*-12-*-*-*-*-*-*-*",
	padding_pixels = 3,
})


de.defstyle("input", {
	based_on          = "*",
	shadow_colour     = "#404443",
	highlight_colour  = "#404443",
	background_colour = "#545d75",
	foreground_colour = "white",
	padding_pixels    = 0,
	highlight_pixels  = 1,
	shadow_pixels     = 1,
	border_style      = "elevated",
	de.substyle("*-cursor", {
		background_colour = "white",
		foreground_colour = "#545d75",
	}),
	de.substyle("*-selection", {
		background_colour = "#aaaaaa",
		foreground_colour = "black",
	}),
	font = "fixed",
})


de.defstyle("stdisp", {
	based_on          = "*",
	shadow_pixels     = 0,
	highlight_pixels  = 0,
	background_colour = "black",
	foreground_colour = "#8b8989",
	text_align        = "right",
})


gr.refresh()

