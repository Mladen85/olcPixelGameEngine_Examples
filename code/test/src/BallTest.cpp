#include <gtest/gtest.h>
#include "Ball.hpp"
// #include "olcPixelGameEngine.h"

TEST(BallPhysicsTest, PositionChangesLinearlyWithVelocityAndDeltaTime) {
    olc::vf2d initPosition(100.0f, 100.0f);
    olc::vf2d initVelocity(10.0f, 10.0f);
    float radius = 10.0f;

    Ball ball(initPosition, initVelocity, radius);

    // Game time advances 2 seconds
    float deltaTime = 2.0f;
    ball.Update(deltaTime);
    
    // Assert; Verify ball moved to new (expected) position
    // newX = 100.0f + (10.0f * 2.0f) = 120.0f
    // newY = 100.0f + (10.0f * 2.0f) = 120.0f
    EXPECT_FLOAT_EQ(ball.GetPosition().x, 120.0f);
    EXPECT_FLOAT_EQ(ball.GetPosition().y, 120.0f);
}