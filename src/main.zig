const rl = @import("raylib");
const Player = @import("structs/Player.zig").Player;
const Game = @import("structs/Game.zig").Game;

pub fn main() void {
    var game = Game.init(
        4,
        10,
        100,
        450,
        60,
        40,
        120,
        50,
        50,
        40,
        30,
        20,
        20,
    );

    rl.initWindow(game.screenWidth, game.screenHeight, "Zig Invaders");

    defer rl.closeWindow();

    rl.setTargetFPS(60);
    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
        rl.clearBackground(rl.Color.black);
        game.update();
        game.draw();
        rl.drawText("Zig Invaders", 300, 250, 40, rl.Color.white);
    }
}
