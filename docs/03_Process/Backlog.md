# Project Backlog: Bouncing Ball Features & Stories

## [ ] FEATURE_01: Mathematical Foundation (Vector2D)
> **Status:** Completed (Inherited via engine dependency `olc::vf2d`)

---

## [ ] FEATURE_02: Pure Physical Kinematics (Ball Engine)
**Feature Goal:** Create a decoupled, unit-tested C++ class that handles a moving ball's positional tracking and boundary collisions using `olc::vf2d` metrics.

### - [ ] STORY_02_01: Linear Position Translation (The Kinematic Update)
*   **Description:** As a simulation developer, I want the ball entity to update its structural coordinates linearly over a given time delta based on its current velocity vector, so that the ball moves smoothly across the screen regardless of the computer's frame rate.
*   **Technical Concept:** Implement the formula $\vec{P}_{new} = \vec{P}_{old} + \vec{V} \cdot \Delta t$ within a public `void Update(float deltaTime)` method.
*   **Acceptance Criteria (Definition of Done):**
    1. A Google Test passes proving that a ball with an initial position of `(100, 150)` and velocity of `(50, -20)` accurately recalculates its position to `(200, 110)` after a `2.0` second time step.
    2. A Google Test passes proving that passing a `0.0` second delta time results in absolutely zero position change.
    3. The code compiles cleanly without including any graphical or windowing header files.

### - [ ] STORY_02_02: Boundary Collision Detection & Reflection
*   **Description:** As a simulation developer, I want the ball entity to evaluate its bounding edges against a defined rectangular viewport and cleanly invert its velocity axis upon impact, so that the ball stays contained inside the playable area.
*   **Technical Concept:** Implement a `void CheckCollisions(float minX, float maxX, float minY, float maxY)` method. The collision checks must take the ball's radius $R$ into account:
    *   If $x - R \le minX$ or $x + R \ge maxX$, invert horizontal velocity: $v_x \leftarrow -v_x$
    *   If $y - R \le minY$ or $y + R \ge maxY$, invert vertical velocity: $v_y \leftarrow -v_y$
*   **Acceptance Criteria (Definition of Done):**
    1. A unit test passes proving that if a ball with radius `5.0` reaches $x = 796.0$ moving right (`vx = 100`), its velocity flips to left (`vx = -100`).
    2. A unit test passes proving that if a ball reaches $y = 4.0$ moving up (`vy = -50`), its velocity flips to down (`vy = 50`).
    3. Collisions on the horizontal axis do not accidentally modify or affect vertical velocity parameters (and vice versa).

### - [ ] STORY_02_03: Parametric Constructor Injection
*   **Description:** As an automation test engineer, I want to initialize a ball entity with explicit, hardcoded position, velocity, and radius values during instantiation, so that I can write reproducible, deterministic unit tests.
*   **Technical Concept:** Expose a constructor: `Ball(olc::vf2d initial_position, olc::vf2d initial_velocity, float radius)`. Expose read-only constant accessor methods (`GetPosition()`, `GetVelocity()`, `GetRadius()`).
*   **Acceptance Criteria (Definition of Done):**
    1. The class cannot be default-instantiated without parameters (forcing explicit configuration).
    2. All fields set by the constructor are accurately exposed via `const` getters without exposing raw pointers or allowing unauthorized mutations outside the update loops.

---

## [ ] FEATURE_03: Frame Lifecycle & Application (GameApp)
**Feature Goal:** Build the graphical runtime shell that launches the OS window, configures randomized initialization inputs, and binds the visual rendering loops to the internal physics model.

### - [ ] STORY_03_01: Engine Infrastructure Lifecycle & Token Setup (Sprint 0)
*   **Description:** As a system installer, I want to set up an empty skeleton `main.cpp` linked with the `olcPixelGameEngine` header definitions, so that I can confirm my compiler paths and linker targets are fully functional.
*   **Acceptance Criteria (Definition of Done):**
    1. The software repository compiles an executable binary without error.

### - [ ] STORY_03_02: Dynamic Application Initialization & Title Bar Compliance
*   **Description:** As an end-user, I want the game window to open at a static resolution of `800x600` with the correct copyright licensing string in the title bar, so that legal requirements are met and the workspace is framed properly.
*   **Acceptance Criteria (Definition of Done):**
    1. Running the application launches a fixed window displaying `"Bouncing Ball Simulation - Powered by olcPixelGameEngine (Javidx9 / OneLoneCoder)"`.

### - [ ] STORY_03_03: Bounded Random Property Generation
*   **Description:** As an observer, I want the ball to spawn at a randomized position and heading when the game launches normally, so that every execution provides a fresh visual sequence.
*   **Acceptance Criteria (Definition of Done):**
    1. Code inside `OnUserCreate()` generates random `x` coordinates between `(0 + Radius)` and `(800 - Radius)`, and random `y` coordinates between `(0 + Radius)` and `(600 - Radius)`.
    2. The generated values are safely passed straight into the `Ball` constructor.

### - [ ] STORY_03_04: Viewport Frame Rendering Pipeline
*   **Description:** As an observer, I want the screen to clear to solid black every frame and draw the ball as a solid circle, so that I see a clean, flicker-free rendering of the ball's movement.
*   **Acceptance Criteria (Definition of Done):**
    1. `OnUserUpdate()` executes a viewport clear operation using color hex `0x000000`.
    2. The engine utilizes `DrawCircle()` mapping parameters directly from `Ball::GetPosition()` and `Ball::GetRadius()`.