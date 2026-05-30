const rl = @import("raylib");

pub const Bullet = struct {
    active: bool = false,
    x: i32 = 0,
    y: i32 = 0,
    width: i32 = 4,
    height: i32 = 15,
    speed: i32 = 8,

    pub fn spawn(
        pool: anytype,
        x: i32,
        y: i32,
        width: i32,
        height: i32,
    ) ?*@This() {
        const bullet = pool.spawn() orelse return null;
        bullet.* = .{
            .active = true,
            .x = x - @divTrunc(width, 2),
            .y = y,
            .width = width,
            .height = height,
        };

        return bullet;
    }

    pub fn update(self: *@This()) void {
        if (!self.active) return;
        self.y -= self.speed;
        if (self.y + self.height < 0) {
            self.active = false;
        }
    }

    pub fn draw(self: *const @This()) void {
        rl.drawRectangle(
            self.x,
            self.y,
            self.width,
            self.height,
            rl.Color.red,
        );
    }
};
