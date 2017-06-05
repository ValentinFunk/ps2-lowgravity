local MODULE = {}

MODULE.Name = "PS2 Low Gravity"
MODULE.Author = "Kamshak"

MODULE.Blueprints = {
	{
		label = "Low Gravity",
		base = "base_low_gravity",
		icon = "pointshop2/crime1.png",
		creator = "DLowGravityCreator",
		tooltip = "Create low-gravity items."
	}
}

Pointshop2.RegisterModule( MODULE )