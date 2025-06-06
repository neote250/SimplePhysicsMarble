# SimplePhysicsMarble

A quick and fun physics-based marble game built with the Godot Engine. Watch marbles bounce through obstacles using realistic 2D physics simulation.
Obviously this was done with limited time so it only has limited features. Could expand on this to make it a real game, but for now it is just an example.

<img width="1280" alt="SSBasicMarbleMazeGame" src="https://github.com/user-attachments/assets/4a22b27d-78e7-4b1c-be22-78e5b1cbdd35" />

## 🎮 Game Overview

SimplePhysicsMarble is a physics demonstration game where players bounce marbles in a physics playground. The marbles interact with various obstacles and surfaces using Godot's built-in physics engine, creating an engaging and satisfying gameplay experience.

## ✨ Features

- **Realistic Physics**: Utilizes Godot's Box2D physics engine for accurate marble movement and collisions
- **Dynamic Obstacles**: Various walls and holes for marbles to interact with
- **Bounce & Collision Effects**: Realistic bounce, friction, and collision responses
- **Lightweight & Fast**: Optimized for smooth performance across different devices

## 🚀 Getting Started

### Prerequisites

- Godot Engine 4.4 (download from [godotengine.org](https://godotengine.org))
- Basic understanding of Godot project structure (optional)

### Installation & Running

1. **Clone the Repository**
   ```bash
   git clone https://github.com/neote250/SimplePhysicsMarble.git
   cd SimplePhysicsMarble
   ```

2. **Open in Godot**
   - Launch Godot Engine
   - Click "Import" and select the project folder
   - Click "Import & Edit"

3. **Run the Game**
   - Press `F5` or click the "Play" button
   - Select the main scene if prompted

## 🎯 How to Play

- **Tilt Maze**: Use the left and right arrows to tilt the maze in order to get the marble to the goal
- **Watch Physics**: Observe how marbles interact with obstacles and surfaces

## 🔧 Technical Details

### Physics Components Used

- **RigidBody2D**: For the marble physics simulation with mass, gravity, and collision response
- **StaticBody2D**: For stationary obstacles like walls
- **CollisionShape2D**: Defines collision boundaries for all physics objects
- **PhysicsMaterial**: Controls bounce, friction, and other material properties

### Project Structure

```
SimplePhysicsMarble/
├── scenes/          # Game scenes and UI
├── scripts/         # GDScript files for game logic
├── assets/          # Sprites, sounds, and other resources
└── project.godot    # Godot project file
```

### Key Physics Features

- **Gravity Simulation**: Marbles fall under realistic gravity
- **Collision Detection**: Accurate collision between marbles and obstacles
- **Bounce Physics**: Configurable bounce properties for different materials
- **Friction Effects**: Surface friction affects marble movement

## 🛠️ Development

### Built With

- **Godot Engine 4.4**: Game engine and development environment
- **GDScript**: Primary scripting language
- **Box2D Physics**: 2D physics simulation (built into Godot)

### Physics Configuration

The game uses Godot's built-in physics with custom configurations for:
- Marble mass and bounce properties
- Obstacle friction and restitution
- Gravity strength and direction
- Collision layers and masks for proper interaction

## 🎨 Customization

Feel free to modify:
- **Marble Properties**: Adjust size, mass, bounce in the marble scene
- **Obstacle Layout**: Modify or add new obstacles in the main scene
- **Physics Materials**: Create new PhysicsMaterial resources for different effects
- **Visual Effects**: Add particle systems or visual feedback for collisions

## 📝 Learning Resources

This project demonstrates several important Godot concepts:
- RigidBody2D physics simulation
- Collision detection and response
- Scene instancing and management
- Physics material configuration

For more information about Godot physics, check out:
- [Godot Physics Introduction](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html)
- [2D Physics in Godot](https://docs.godotengine.org/en/stable/tutorials/physics/index.html)

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Built with the amazing [Godot Engine](https://godotengine.org)
- Inspired by classic marble/pachinko physics games
- Thanks to the Godot community for excellent documentation and tutorials

---

**Enjoy experimenting with physics!** 🎲

*For questions or suggestions, feel free to open an issue or reach out through GitHub.*
