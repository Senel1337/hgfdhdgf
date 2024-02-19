local client_latency, client_screen_size, client_set_event_callback, client_system_time, renderer_gradient, renderer_rectangle, renderer_text, ui_get = client.latency, client.screen_size, client.set_event_callback, client.system_time, renderer.gradient, renderer.rectangle, renderer.text, ui.get
local font = renderer.create_font("Verdana", 13, 500, 0, 144)
local screen_x, screen_y = engine.get_screen_size()
local box_x, box_y = 200, 30

ui.new_label("LUA", "A", "============================")
styles = {"Solus old", "Solus new"}
checkbox = ui.new_checkbox("LUA", "A", "GS Watermark")
style_combo = ui.new_combobox("LUA", "A", "GS Watermark style", "style_combo", styles)
ui.new_label("LUA", "A", "============================")

watermark = function()
    menucolor = ui.get_menu_color()
    textt = "game" .. "sense" .. ".moscow | " .. globals.get_framerate() .. " fps | " .. globals.get_time()
    ts = renderer.get_text_width(font, textt)
    if ui.get(style_combo) == 0 then
        renderer.rectangle_filled(screen_x - ts -box_x / 3 - 10 + 6, 19, ts + 8, box_y - 10, color.new(20, 20, 20, 125))
        renderer.rectangle_filled(screen_x - ts -box_x / 3 - 10 + 6, 19, ts + 8, 3, menucolor)

        renderer.text(font, screen_x - ts -box_x / 3 - 10 + 10, 23, color.new(255, 255, 255, 255), "game")
        renderer.text(font, screen_x - ts -box_x / 3 - 10 + 37, 23, menucolor, " sense")
        renderer.text(font, screen_x - ts -box_x / 3 - 10 + 68, 23, color.new(255, 255, 255, 255), " .moscow | " .. globals.get_framerate() .. " fps | " .. globals.get_time()) 
    elseif ui.get(style_combo) == 1 then         
        renderer.rectangle_rounded(screen_x - ts -box_x / 3 - 10 + 6, 18, ts + 14, 17, 60, 4, menucolor)
        renderer.rectangle_rounded(screen_x - ts -box_x / 3 - 9 + 6, 19, ts + 12, box_y - 15, 60, 4, color.new(20, 20, 20, 255))

        renderer.text(font, screen_x - ts -box_x / 3 - 10 + 10, 19, color.new(255, 255, 255, 255), textt)
    end 
end
render = function()
    if not ui.get(checkbox) then return end
	watermark()
end

client_set_event_callback("on_paint", render)