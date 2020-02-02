using Godot;
using System;

public class YourCustomClass : Node
{
	// Member variables here, example:
	private int a = 2;
	private string b = "textvar";

	public override void _Ready()
	{
		// Called every time the node is added to the scene.
		// Initialization here.
		GD.Print("Hello from C# to Godot :)");
	}

	public override void _Process(float delta)
	{
		// Called every frame. Delta is time since the last frame.
		// Update game logic here.
	}
	
	public override void _UnhandledInput(InputEvent @event)
{
	if (@event is InputEventKey eventKey)
		if (eventKey.Pressed && eventKey.Scancode == (int)KeyList.Escape)
			GetTree().Quit();
}
}
