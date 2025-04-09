import numpy as np

# Read the raw 8-bit unsigned audio file
with open("audio_wario.raw", "rb") as f:
    raw_data = np.fromfile(f, dtype=np.uint8)  # 8-bit unsigned

# Write to .coe file
with open("output.coe", "w") as coe_file:
    coe_file.write("MEMORY_INITIALIZATION_RADIX=16;\n")
    coe_file.write("MEMORY_INITIALIZATION_VECTOR=\n")
    # Convert each sample to 2-digit hex (e.g., 255 -> FF)
    hex_values = [f"{int(x):02X}" for x in raw_data]
    # Join values with commas and end with a semicolon
    coe_file.write(",\n".join(hex_values) + ";")

print(f"Converted {len(raw_data)} samples to output.coe")