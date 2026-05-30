pub const Rectangle = struct {
    x: i32,
    y: i32,
    width: i32,
    height: i32,
    pub fn intersects(this: Rectangle, other: Rectangle) bool {
        return this.x < other.x + other.width and
            this.x + this.width > other.x and
            this.y < other.y + other.height and
            this.y + this.height > other.y;
    }
};
