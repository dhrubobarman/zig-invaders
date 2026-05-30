# Zig Invaders

A small Space Invaders–style game written in Zig using `raylib` for graphics and input.

## Overview

`Zig Invaders` is a simple arcade-style shoot-’em-up demo built in Zig. The project includes:

- player movement and screen boundary handling
- a bullet object pool for firing projectiles
- a basic game loop using `raylib`
- an extensible structure for future invaders, shields, and collision logic

## Controls

- Arrow keys: move the player ship
- Space: fire a bullet
- Close the window or press the window close button to exit

## Prerequisites

- [Zig](https://ziglang.org/download/) (latest stable or master)
- `raylib` dependency is provided through the Zig build system via `raylib_zig`

## Build

To build the project:

```bash
zig build
```

The executable will be located in `zig-out/bin/zig_invaders`.

## Run

To build and run immediately:

```bash
zig build run
```

You can also pass command-line arguments through the build runner:

```bash
zig build run -- arg1 arg2
```

## Project structure

- `src/main.zig` — game entry point and main loop
- `src/structs/Game.zig` — game state, update, and draw logic
- `src/structs/Player.zig` — player movement and rendering
- `src/structs/Bullet.zig` — bullet spawning, movement, and drawing
- `src/structs/ObjectPool.zig` — reusable pool for active bullets
- `build.zig` — Zig build script and `raylib` dependency configuration

## Testing

This repository also includes a minimal package entry point and tests for the package API. Run:

```bash
zig build test
```