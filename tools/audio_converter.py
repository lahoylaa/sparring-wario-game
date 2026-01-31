"""
" @file     audio_converter.py
" @brief    Convert raw 8-bit unsigned PCM audio to .coe format for FPGA ROM
" @note     Usage: python audio_converter.py
"
" @author   Aeron Lahoylahoy
" @date     March 3, 2025
"""
import numpy as np

# Input and output files
input_file = "E:\Projects\FPGA\Sparring_Wario_Game\Sparring_Wario\sound.raw"
output_file = "E:\Projects\FPGA\Sparring_Wario_Game\Sparring_Wario\sound.coe"

# audio_playback ROM limit limit to how much storage is left on the board
max_rom_samples = 120000 

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
    print(f"Error: File is empty")
    exit(1)
if num_samples > max_rom_samples:
    print(f"Warning: Samples exceed ROM limit of {max_rom_samples}")

# Validate data range (ensure unsigned 8-bit)
if np.any(raw_data > 255) or np.any(raw_data < 0):
    print("Error: Raw data contains values outside 0–255.")
    exit(1)

# Write to .coe file
try:
    with open(output_file, "w") as coe_file:
        coe_file.write("MEMORY_INITIALIZATION_RADIX=16;\n")
        coe_file.write("MEMORY_INITIALIZATION_VECTOR=\n")
        # Convert each sample to 2-digit hex
        hex_values = [f"{int(x):02X}" for x in raw_data]
        # Join values with commas and end with semicolon
        coe_file.write(",\n".join(hex_values) + ";")
except Exception as e:
    print(f"Error writing output file: {e}")
    exit(1)

print(f"\nConverted samples to {output_file}")
