extends VBoxContainer

const CARD_BACK_IMAGE = preload("res://pixel/card-back.png")
const NO_CARD_FOUND_IMAGE = preload("res://pixel/card-none.png")

@export var card_index : int = -1

#func _ready() -> void:
	#draw_random_card()
	#update_bits()

func _on_button_pressed() -> void:
	draw_random_card()
	update_bits()

func draw_random_card() -> void:
	card_index = randi() % 78

func update_bits() -> void:
	$Label.text = CardData.get_card_printname(card_index)
	var card_image = load("res://pixel/%s.png" % CardData.get_card_filename(card_index))
	if card_image:
		$MarginContainer/TextureRect.texture = card_image
	else:
		$MarginContainer/TextureRect.texture = NO_CARD_FOUND_IMAGE
