# Description
Allows survivors mark item when use Vocalize

* <details><summary>How does it work?</summary>

    * User press Vocalize button to mark item for others
</details>

* <details><summary>ConVar</summary>

  ```
  // Marker's alpha transparency.
  // Note: Some models don't allow to change the alpha.
  // 0 = Invisible, 255 = Fully Visible
  // -
  // Default: "255"
  // Minimum: "0.000000"
  // Maximum: "255.000000"
  l4d2_item_marker_alpha "255"
  
  // Color of the beam ring and glow
  // Use three values between 0-255 separated by spaces ("<0-255> <0-255> <0-255>").
  // -
  // Default: "255 255 0"
  l4d2_item_marker_beam_color "255 255 0"
  
  // This value determine how long the beam will reach its max radius from min radius (in seconds)
  // -
  // Default: "1.0"
  // Minimum: "0.000000"
  l4d2_item_marker_beam_duration "1.0"
  
  // The end radius of the beam
  // -
  // Default: "100.0"
  // Minimum: "0.000000"
  l4d2_item_marker_beam_end_radius "100.0"
  
  // Model name of beam, some model name is "wall-through", this is depends on which *.vmt file you choose
  // -
  // Default: "vgui/white_additive.vmt"
  l4d2_item_marker_beam_model "vgui/white_additive.vmt"
  
  // The start radius of the beam
  // -
  // Default: "75.0"
  // Minimum: "0.000000"
  l4d2_item_marker_beam_start_radius "75.0"
  
  // Duration of the marker (in seconds)
  // -
  // Default: "15.0"
  // Minimum: "0.000000"
  l4d2_item_marker_duration "15.0"
  
  // Color of the sprite
  // Use three values between 0-255 separated by spaces ("<0-255> <0-255> <0-255>").
  // -
  // Default: "255 0 0"
  l4d2_item_marker_sprite_color "255 0 0"
  
  // Model name of sprite, some model name is "wall-through", this is depends on which *.vmt file you choose
  // -
  // Default: "vgui/icon_arrow_down.vmt"
  l4d2_item_marker_sprite_model "vgui/icon_arrow_down.vmt"
  
  // The moving range for the sprite
  // -
  // Default: "6.0"
  // Minimum: "0.000000"
  l4d2_item_marker_sprite_move_range "6.0"
  
  // How fast the sprite will move. (determine which value use for changing sprite's z axis)
  // -
  // Default: "1.0"
  // Minimum: "0.000000"
  l4d2_item_marker_sprite_speed "2.0"
  
  // Additional Z axis to the sprite.
  // -
  // Default: "20.0"
  // Minimum: "0.000000"
  l4d2_item_marker_sprite_z_axis "20.0"
  ```
</details>

* Require
    1. [[INC] Colors](https://forums.alliedmods.net/showthread.php?t=96831)

* <details><summary>Changelogs</summary>

  ```
  1.0.4 (04-02-2024)
	- Fixed odly behavior problem for sprite when parent moving
	- Add feature showing message about item name and translations file
	- TODO:
		+ Feature letting survivors customized their marker's color (and saving cookies).
  1.0.3 (04-02-2024)
  	- Added Cvars
  	- Sprite now static staying at their spawn place instead of moving with their parent to prevent some odd behavior
  	- TODO:
  		+ Feature letting survivors customized their marker's color
  		+ Attemp on feature letting other survivors to turn off marker on their side.
  1.0.2 (03-02-2024)
      - Removed instructor hint
  	- Now using sprite and TE_SetupBeamPoints for markers
  	- TODO:
  		+ Adding cvar
  		+ Feature letting other survivors to turn off marker on their side (need more test)
  1.0.1 (02-02-2024)
      - Rewrite entire plugin, use enum struct to store marker's information instead of arrays
  	- Added feature unmark item
  	- Plugin not required L4DHookDirect anymore
  1.0.0 (31-01-2024)
      - Initial release.
  		+ Thanks Mart for his https://forums.alliedmods.net/showthread.php?t=331347 borrowed a lot idea for sprites and about organizing the project
  		+ Thanks BHaType for his https://forums.alliedmods.net/showpost.php?p=2753773&postcount=2 learnt how to use SDKCall. Which also gave me idea about using enum struct
  		+ Thanks Harry for his https://github.com/fbef0102/L4D2-Plugins/tree/master/l4d2_item_hint learnt a lot about entites from reading this plugin
  ```
</details>

- - - -
# Mô tả (Tiếng việt)
Cho phép survivor đánh dấu một item nào đó

* <details><summary>Cách hoạt động?</summary>

    * Player bấm phím Vocalize (mặc định là Z) để đánh dấu một item trên bản đồ
</details>

* <details><summary>ConVar</summary>

  ```
  // Độ trong suốt của điểm đánh dấu
  // Lưu ý là một vài model không thể chỉnh độ trong suốt
  // 0 = Invisible, 255 = Fully Visible
  // -
  // Default: "255"
  // Minimum: "0.000000"
  // Maximum: "255.000000"
  l4d2_item_marker_alpha "255"
  
  // Màu của vòng và glow
  // Sử dụng các giá trị trong khoảng <0 - 255>
  // -
  // Default: "255 255 0"
  l4d2_item_marker_beam_color "255 255 0"
  
  // Giá trị này xác định thời gian mà vòng sẽ đạt đến bán kính tối đa (tính theo giây)
  // -
  // Default: "1.0"
  // Minimum: "0.000000"
  l4d2_item_marker_beam_duration "1.0"
  
  // Bán kính kết thúc của vòng
  // -
  // Default: "100.0"
  // Minimum: "0.000000"
  l4d2_item_marker_beam_end_radius "100.0"
  
  // Model của vòng, lưu ý là một số model sẽ mặc định "xuyên tường", tùy thuộc vào file *.vmt
  // -
  // Default: "vgui/white_additive.vmt"
  l4d2_item_marker_beam_model "vgui/white_additive.vmt"
  
  // Bán kính bắt đầu của vòng
  // -
  // Default: "75.0"
  // Minimum: "0.000000"
  l4d2_item_marker_beam_start_radius "75.0"
  
  // Thời gian tồn tại của một điểm đánh dấu
  // -
  // Default: "15.0"
  // Minimum: "0.000000"
  l4d2_item_marker_duration "15.0"
  
  // Màu của sprite (dấu mũi tên trên vòng)
  // Sử dụng các giá trị trong khoảng <0 - 255>
  // -
  // Default: "255 0 0"
  l4d2_item_marker_sprite_color "255 0 0"
  
  // Model của sprite, lưu ý là một số model sẽ mặc định "xuyên tường", tùy thuộc vào file *.vmt
  // -
  // Default: "vgui/icon_arrow_down.vmt"
  l4d2_item_marker_sprite_model "vgui/icon_arrow_down.vmt"
  
  // Phạm vi di chuyển của sprite
  // -
  // Default: "6.0"
  // Minimum: "0.000000"
  l4d2_item_marker_sprite_move_range "6.0"
  
  // Tốc độ di chuyển của sprite
  // -
  // Default: "1.0"
  // Minimum: "0.000000"
  l4d2_item_marker_sprite_speed "2.0"
  
  // Độ cao của trục z của sprite so với vật thể gốc.
  // -
  // Default: "20.0"
  // Minimum: "0.000000"
  l4d2_item_marker_sprite_z_axis "20.0"
  ```
</details>

* Yêu cầu
    1. [[INC] Colors](https://forums.alliedmods.net/showthread.php?t=96831)
