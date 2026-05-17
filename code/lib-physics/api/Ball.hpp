#pragma once

#include "utilities/olcUTIL_Geometry2D.h"

class Ball {
public:
    Ball(olc::vf2d initPos, olc::vf2d initVel, float radius);

    void Update(float deltaTime);

    const olc::vf2d& GetPosition() const;

private:
    olc::vf2d m_position;
    olc::vf2d m_velocity;
    float     m_radius;
};