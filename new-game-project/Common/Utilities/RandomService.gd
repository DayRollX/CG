extends Node

# Central random service using a 7-character seed string

var _seed_string: String = ""
var _seed_numeric: int = 0
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

const ALPHABET := "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
const DEFAULT_LENGTH := 7

func _ready():
    # Ensure RNG has some non-zero seed on editor/test runs if not initialized
    if _seed_string == "":
        _apply_numeric_seed(Time.get_ticks_msec())

func generate_seed_string(len: int = DEFAULT_LENGTH) -> String:
    # Use an unseeded RNG for generation prior to game start
    var tmp := RandomNumberGenerator.new()
    tmp.randomize()
    var s := ""
    for i in len:
        s += ALPHABET[tmp.randi_range(0, ALPHABET.length() - 1)]
    return s

func sanitize_seed_string(s: String) -> String:
    # Uppercase and filter allowed chars only
    var up := s.to_upper()
    var out := ""
    for ch in up:
        if ALPHABET.find(ch) != -1:
            out += ch
    return out

func normalize_seed_string(s: String, len: int = DEFAULT_LENGTH) -> String:
    var clean := sanitize_seed_string(s)
    if clean.length() == len:
        return clean
    # If too short or invalid, generate fresh seed
    return generate_seed_string(len)

func _seed_from_string(str_seed: String) -> int:
    # Convert base-36 style (A-Z=10..35) to numeric deterministically
    var value: int = 0
    for ch in str_seed:
        var idx := ALPHABET.find(ch)
        if idx == -1:
            continue
        value = value * ALPHABET.length() + idx
        # Clamp to 64-bit range implicitly
    return value

func _apply_numeric_seed(n: int) -> void:
    _seed_numeric = n
    rng.seed = n
    seed(n) # Also seed Godot global RNG for APIs like Array.shuffle()
    print_debug("[RandomService] Seed numeric set: " + str(n))

func init_with_seed_string(str_seed: String) -> void:
    _seed_string = normalize_seed_string(str_seed)
    var n := _seed_from_string(_seed_string)
    _apply_numeric_seed(n)
    print_debug("[RandomService] Seed string set: " + _seed_string)

func init_with_numeric_seed(n: int) -> void:
    _seed_string = "" # unknown string
    _apply_numeric_seed(n)

func get_seed_string() -> String:
    return _seed_string

func get_seed_numeric() -> int:
    return _seed_numeric

# Helper random APIs (prefer using these for determinism)
func randi_range(a: int, b: int) -> int:
    return rng.randi_range(a, b)

func randf() -> float:
    return rng.randf()

func shuffle_array(arr: Array) -> void:
    # Fisher–Yates using the seeded rng
    var n := arr.size()
    for i in range(n - 1, 0, -1):
        var j: int = rng.randi_range(0, i)
        if j != i:
            var tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp

func pick_index(count: int) -> int:
    if count <= 0:
        return 0
    return rng.randi_range(0, count - 1)

func pick_from_array(arr: Array):
    if arr.is_empty():
        return null
    return arr[pick_index(arr.size())]
