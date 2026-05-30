const rl = @import("raylib");
const Rectangle = @import("Rectangle.zig").Rectangle;

pub const Player = struct {
    positionX: i32,
    positionY: i32,
    width: i32,
    height: i32,
    speed: i32,

    pub fn init(
        positionX: i32,
        positionY: i32,
        width: i32,
        height: i32,
    ) @This() {
        return .{
            .positionX = positionX,
            .positionY = positionY,
            .width = width,
            .height = height,
            .speed = 5,
        };
    }

    pub fn update(self: *@This()) void {
        if (rl.isKeyDown(.right)) {
            self.positionX += self.speed;
        }

        if (rl.isKeyDown(.left)) {
            self.positionX -= self.speed;
        }

        if (rl.isKeyDown(.up)) {
            self.positionY -= self.speed;
        }

        if (rl.isKeyDown(.down)) {
            self.positionY += self.speed;
        }
        const screenWidth = rl.getScreenWidth();
        const screenHeight = rl.getScreenHeight();

        // Prevent leaving screen
        if (self.positionX < 0) {
            self.positionX = 0;
        }
        if (self.positionX + self.width > screenWidth) {
            self.positionX = screenWidth - self.width;
        }
        if (self.positionY < 0) {
            self.positionY = 0;
        }
        if (self.positionY + self.height > screenHeight) {
            self.positionY = screenHeight - self.height;
        }
    }

    pub fn draw(self: @This()) void {
        rl.drawRectangle(
            self.positionX,
            self.positionY,
            self.width,
            self.height,
            rl.Color.blue,
        );
    }

    pub fn getRect(self: @This()) Rectangle {
        return .{
            .x = self.positionX,
            .y = self.positionY,
            .width = self.width,
            .height = self.height,
        };
    }
};
