pub fn ObjectPool(comptime T: type, comptime capacity: usize) type {
    return struct {
        const Self = @This();
        items: [capacity]T,

        pub fn init() Self {
            var self: Self = undefined;
            for (&self.items) |*item| {
                item.* = .{};
                item.active = false;
            }
            return self;
        }

        pub fn spawn(self: *Self) ?*T {
            for (&self.items) |*item| {
                if (!item.active) {
                    return item;
                }
            }
            return null;
        }

        pub fn update(self: *Self) void {
            for (&self.items) |*item| {
                if (!item.active) continue;
                item.update();
            }
        }

        pub fn draw(self: *const Self) void {
            for (&self.items) |*item| {
                if (!item.active) continue;
                item.draw();
            }
        }
    };
}
