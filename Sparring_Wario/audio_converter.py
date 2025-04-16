import numpy as np

# Configuration
input_file = "E:\Projects\FPGA\Sparring_Wario_Game\Sparring_Wario\sound.raw"
output_file = "E:\Projects\FPGA\Sparring_Wario_Game\Sparring_Wario\sound.coe"
max_rom_samples = 120000  # audio_playback ROM limit

# Read the raw 8-bit unsigned audio file
try:
    with open(input_file, "rb") as f:
        raw_data = np.fromfile(f, dtype=np.uint8)  # 8-bit unsigned
except FileNotFoundError:
    print(f"Error: {input_file} not found")
    exit(1)
except Exception as e:
    print(f"Error reading {input_file}: {e}")
    exit(1)

# Validate sample count
num_samples = len(raw_data)
if num_samples == 0:
    print(f"Error: {input_file} is empty")
    exit(1)
if num_samples > max_rom_samples:
    print(f"Warning: {num_samples} samples exceed ROM limit of {max_rom_samples}, may be truncated")

# Validate data range (ensure unsigned 8-bit)
if np.any(raw_data > 255) or np.any(raw_data < 0):
    print("Error: Raw data contains values outside 0–255, check PCM format")
    exit(1)

# Sample reader: Analyze and print statistics
print("\nSample Reader Statistics:")
print(f"Total samples: {num_samples}")
print(f"Min value: {np.min(raw_data)}")
print(f"Max value: {np.max(raw_data)}")
print(f"Mean value: {np.mean(raw_data):.2f} (expected ~128 for audio)")
# Display first and last 5 samples
print("First 5 samples:", raw_data[:5].tolist())
if num_samples > 10:
    print("Last 5 samples:", raw_data[-5:].tolist())
else:
    print("Last 5 samples:", raw_data[-min(5, num_samples):].tolist())

# Write to .coe file
try:
    with open(output_file, "w") as coe_file:
        coe_file.write("MEMORY_INITIALIZATION_RADIX=16;\n")
        coe_file.write("MEMORY_INITIALIZATION_VECTOR=\n")
        # Convert each sample to 2-digit hex
        hex_values = [f"{int(x):02X}" for x in raw_data]
        # Join values with commas and end with semicolon
        coe_file.write(",\n".join(hex_values) + ";")
except PermissionError:
    print(f"Error: Cannot write to {output_file}, check permissions")
    exit(1)
except Exception as e:
    print(f"Error writing {output_file}: {e}")
    exit(1)

print(f"\nConverted {num_samples} samples to {output_file}")