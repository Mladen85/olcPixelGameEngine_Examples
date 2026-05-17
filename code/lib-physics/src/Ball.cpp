#include "Ball.hpp"

Ball::Ball(olc::vf2d initPosition, olc::vf2d initVelocity, float radius) :
    m_position(initPosition),
    m_velocity(initVelocity),
    m_radius(radius)
{
    //
}

void Ball::Update(float deltaTime) {
    (void)deltaTime;
}

const olc::vf2d& Ball::GetPosition() const {
    return m_position;
}