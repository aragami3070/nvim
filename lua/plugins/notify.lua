require("notify").setup({
    background_colour = "#000000",
    fps = 60,
    render = "compact",
    stages = "static",
    time_formats = {
      notification = "%T",
      notification_history = "%FT%T"
    },
    timeout = 5000,
    top_down = true
})
