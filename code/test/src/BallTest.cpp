#include <gtest/gtest.h>
#include "Ball.hpp"
// #include "olcPixelGameEngine.h"


TEST(BallPhysicsTest, Update_PositionChangesLinearlyWithVelocityAndDeltaTime) {
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


TEST(BallPhysicsTest, Update_PositionChangesLinearlyWithNegativeVelocityAndDeltaTime) {
    olc::vf2d initPosition(100.0f, 150.0f);
    olc::vf2d initVelocity(50.0f, -20.0f);
    float radius = 10.0f;

    Ball ball(initPosition, initVelocity, radius);

    // Game time advances 2 seconds
    float deltaTime = 2.0f;
    ball.Update(deltaTime);
    
    EXPECT_FLOAT_EQ(ball.GetPosition().x, 200.0f);
    EXPECT_FLOAT_EQ(ball.GetPosition().y, 110.0f);
}


TEST(BallPhysicsTest, Update_PositionNotChangedWithVelocityAndDeltaTimeZero) {
    olc::vf2d initPosition(100.0f, 150.0f);
    olc::vf2d initVelocity(50.0f, -20.0f);
    float radius = 10.0f;

    Ball ball(initPosition, initVelocity, radius);

    // Game time advances 2 seconds
    float deltaTime = 0.0f;
    ball.Update(deltaTime);
    
    EXPECT_FLOAT_EQ(ball.GetPosition().x, 100.0f);
    EXPECT_FLOAT_EQ(ball.GetPosition().y, 150.0f);
}


TEST(BallPhysicsTest, Update_PositionNotChangedWithVelocityZeroAndDeltaTime) {
    olc::vf2d initPosition(100.0f, 150.0f);
    olc::vf2d initVelocity(0.0f, 0.0f);
    float radius = 10.0f;

    Ball ball(initPosition, initVelocity, radius);

    // Game time advances 2 seconds
    float deltaTime = 5.0f;
    ball.Update(deltaTime);
    
    EXPECT_FLOAT_EQ(ball.GetPosition().x, 100.0f);
    EXPECT_FLOAT_EQ(ball.GetPosition().y, 150.0f);
}