extends CharacterBody2D

var deaths1 = 0
var health = 100
const SPEED = 380.0
const JUMP_VELOCITY = -500.0
var inflight  = false
var allow_jump = false
const GRAVITY = 20
const BOOST = -250
const MaxFall = 500
const Boost_time = 1.5
var checkStatus = 1



var is_boost = false
var fuel = Boost_time


func _is_on_ground() -> bool:
	return is_on_floor()



@onready var boostBar: ProgressBar = $Boost
@onready var waitbeforejump: Timer = $waitbeforejump
@onready var exit_flight: Timer = $exitFlight
@onready var enter_flight: Timer = $enterFlight
@onready var healthbar: ProgressBar = $Health

func _ready():
		healthbar.max_value = health
		healthbar.value = health
		boostBar.max_value = Boost_time
		boostBar.value = Boost_time

func _physics_process(delta: float) -> void:
	
	look_at(get_global_mouse_position())
	healthbar.value = health
	boostBar.value = fuel
	
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if fuel < Boost_time and _is_on_ground():
		fuel += delta / 2
	if fuel < Boost_time and not _is_on_ground():
		fuel += delta / 5
	if _is_on_ground():
		is_boost = false
		checkStatus = 1
		if Input.is_action_just_pressed("space"):
			velocity.y = JUMP_VELOCITY
	elif Input.is_action_pressed("space") and fuel >= 0.0 and checkStatus == 1:
		is_boost = true
		velocity.y = BOOST
		fuel -= delta
		if fuel < 0.001:
			checkStatus = 0
			print(checkStatus)
	elif Input.is_action_pressed("space") and fuel > 0.2 and checkStatus == 0:
		is_boost = true
		velocity.y = BOOST
		fuel -= delta
		checkStatus = 1
	else:
		is_boost = false
		
	if not is_boost:
		velocity.y += GRAVITY
	if velocity .y > MaxFall:
		velocity.y = MaxFall
	
	if fuel == 0:
		checkStatus = 0
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_f"):
		shoot()
		
const BULLET = preload("res://Scenes/bullet.tscn")

func _on_waitbeforejump_timeout() -> void:
	allow_jump = true
	



func _on_enter_flight_timeout() -> void:
	inflight = true
func shoot():
	
	var bullet = BULLET.instantiate()
	
	bullet.bullet_direction = (position - get_global_mouse_position()).normalized()
	bullet.position = position - bullet.bullet_direction * 50
	
	get_parent().add_child(bullet)
	#var mouse_pos = InputEventMouseButton.position
	#var vector = mouse_pos - shooting_point.position
	#angle = vector.angle()
	#var bullet = BULLET.instantiate()
	#bullet.directionshoot = Vector2.RIGHT.rotated(angle)
	#
	#shooting_point.add_child(bullet)
func take_damage():
	if health > 10:
		health -= 10
		print(health)
	elif health <= 10:
		Global.deathsp1 = Global.deathsp1 + 1
		queue_free()

func heal_boost():
	health = 100

func fire_boost():
	fuel = 7.0

func _on_exit_flight_timeout() -> void:
	inflight = false


	
