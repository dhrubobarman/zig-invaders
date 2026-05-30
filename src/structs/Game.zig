const rl = @import("raylib");
const Player = @import("Player.zig").Player;
const Bullet = @import("Bullet.zig").Bullet;
const ObjectPool = @import("ObjectPool.zig").ObjectPool;

const screenWidth = 800;
const screenHeight = 600;

const playerWidth = 50;
const playerHeight = 30;

const BulletPool = ObjectPool(Bullet, 10);

pub const Game = struct {
    screenWidth: i32,
    screenHeight: i32,

    bulletWidth: i32,
    bulletHeight: i32,

    playerWidth: i32,
    playerHeight: i32,
    playerStartY: i32,

    shieldStartX: i32,
    shieldY: i32,
    shieldWidth: i32,
    shieldHeight: i32,
    shieldSpacing: i32,

    invaderStartX: i32,
    invaderStartY: i32,
    invaderWidth: i32,
    invaderHeight: i32,
    invaderSpacingX: i32,
    invaderSpacingY: i32,

    player: Player,
    bullets: BulletPool,

    pub fn init(
        bulletWidth: i32,
        bulletHeight: i32,
        shieldStartX: i32,
        shieldY: i32,
        shieldWidth: i32,
        shieldHeight: i32,
        shieldSpacing: i32,
        invaderStartX: i32,
        invaderStartY: i32,
        invaderWidth: i32,
        invaderHeight: i32,
        invaderSpacingX: i32,
        invaderSpacingY: i32,
    ) @This() {
        const playerStartX = screenWidth / 2 - playerWidth / 2;
        const playerStartY = screenHeight - 60;

        return .{
            .screenWidth = screenWidth,
            .screenHeight = screenHeight,

            .playerWidth = playerWidth,
            .playerHeight = playerHeight,
            .playerStartY = playerStartY,

            .shieldStartX = shieldStartX,
            .shieldY = shieldY,
            .shieldWidth = shieldWidth,
            .shieldHeight = shieldHeight,
            .shieldSpacing = shieldSpacing,

            .invaderStartX = invaderStartX,
            .invaderStartY = invaderStartY,
            .invaderWidth = invaderWidth,
            .invaderHeight = invaderHeight,
            .invaderSpacingX = invaderSpacingX,
            .invaderSpacingY = invaderSpacingY,
            .bulletWidth = bulletWidth,
            .bulletHeight = bulletHeight,

            .bullets = BulletPool.init(),

            .player = Player.init(
                playerStartX,
                playerStartY,
                playerWidth,
                playerHeight,
            ),
        };
    }

    pub fn update(self: *@This()) void {
        self.player.update();

        if (rl.isKeyPressed(rl.KeyboardKey.space)) {
            _ = Bullet.spawn(
                &self.bullets,
                self.player.positionX + @divTrunc(self.player.width, 2),
                self.player.positionY,
                self.bulletWidth,
                self.bulletHeight,
            );
        }

        self.bullets.update();
    }

    pub fn draw(self: @This()) void {
        self.player.draw();
        self.bullets.draw();
    }
};
