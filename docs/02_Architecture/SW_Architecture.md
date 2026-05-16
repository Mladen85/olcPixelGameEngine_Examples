# Software Architecture

---

# Software Component Architecture

This document defines the structural boundaries, data composition, and runtime relationships for the Bouncing Ball component.

## 1. Component Block Diagram
This diagram shows how the system layers are separated. The physics engine logic relies only on the abstract data structures from `olc`, keeping it fully testable outside of an active application window.

```mermaid
graph TD
    subgraph Test_Layer [Test Layer]
        GTest[Google Test Suite]
    end

    subgraph Component_Layer [Pure Software Component]
        Ball[Ball Class<br/>Holds Physics & Collision State]
        OlcVec[olc::vf2d<br/>Data & Math Operators]
    end

    subgraph Application_Layer [Graphical Application Layer]
        GameApp[GameApp Class<br/>Inherits from olc::PixelGameEngine]
    end

    %% Dependencies
    GTest -->|Directly Instantiates & Tests| Ball
    Ball -->|Composition| OlcVec
    GameApp -->|Instantiates & Coordinates| Ball
    GameApp -.->|Inherits Framework| OlcVec
```

## 2. Component Class Diagram
By using `olc::vf2d` (which is a type alias for `olc::v2d_generic<float>`), we utilize pre-existing vector arithmetic while keeping our classes completely decoupled from rendering logic.

```mermaid
classDiagram
    class Ball {
        -m_position : olc::vf2d
        -m_velocity : olc::vf2d
        -m_radius : float
        +Ball(pos: olc::vf2d, vel: olc::vf2d, radius: float)
        +Update(deltaTime: float) void
        +CheckCollisions(minX: float, maxX: float, minY: float, maxY: float) void
        +GetPosition() const olc::vf2d&
        +GetVelocity() const olc::vf2d&
        +GetRadius() float
    }

    class GameApp {
        -m_ball : std::unique_ptr<Ball>
        +OnUserCreate() bool
        +OnUserUpdate() bool
    }

    %% Relationships
    GameApp --> Ball : Composes & Updates
```

---

# Interfaces

---

