"""
" @file     image_converter.py
" @brief    Convert an image with alpha channel to a VHDL array in 16-bit A4R4G4B4 format.
" @note     Usage: python image_converter.py <input_image> <output_vhdl>
"
" @author   Aeron Lahoylahoy
" @date     March 3, 2025
"""
from PIL import Image
import numpy as np
import argparse

"""
" @brief Convert an RGBA tuple to A4R4G4B4 format.
" @param rgba A tuple of (R, G, B, A) values, each
"             in the range 0-255.
" @return A 16-bit integer in A4R4G4B4 format.
"""
def rgba_to_a4r4g4b4(rgba):
    # Convert an 8-bit per channel RGBA color to 16-bit A4R4G4B4 format
    r, g, b, a = rgba
    
    # Scale 8-bit (0-255) to 4-bit (0-15)
    r4 = round((r / 255) * 15)
    g4 = round((g / 255) * 15)
    b4 = round((b / 255) * 15)
    a4 = round((a / 255) * 15)

    # Pack into A4R4G4B4 format
    return (a4 << 12) | (r4 << 8) | (g4 << 4) | b4

"""
" @brief Convert an image to a VHDL array in A4R4G4B4 format.
" @param image_path Path to the input image file.
" @param output_path Path to save the output VHDL file.
"""
def convert_to_vhdl_array(image_path, output_path):
    # Load the image and ensure it has an alpha channel
    image = Image.open(image_path).convert("RGBA")
    width, height = image.size  # Get image dimensions

    # Extract pixel data and convert to A4R4G4B4 format
    pixels = list(image.getdata())
    a4r4g4b4_data = [rgba_to_a4r4g4b4(rgba) for rgba in pixels]
    
    # Flatten array
    a4r4g4b4_flat = np.array(a4r4g4b4_data, dtype=np.uint16)

    # VHDL package layout
    vhdl_code = f"""
    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.NUMERIC_STD.ALL;

    package ImageData is
        constant IMAGE_WIDTH  : integer := {width};
        constant IMAGE_HEIGHT : integer := {height};
        type image_array is array (0 to {len(a4r4g4b4_flat) - 1}) of std_logic_vector(15 downto 0);
        constant IMAGE_BITMAP : image_array := (
    """
    
    # Convert values to 16-bit binary and format into VHDL array
    for i, value in enumerate(a4r4g4b4_flat):
        binary_value = f'"{value:016b}"'  # Convert to 16-bit binary string
        vhdl_code += f"        {binary_value}"
        if i < len(a4r4g4b4_flat) - 1:
            vhdl_code += ",\n"

    vhdl_code += "\n    );\nend package ImageData;"

    # Save VHDL package to file
    with open(output_path, "w") as f:
        f.write(vhdl_code)

    # Program has finished generating the VHDL file
    print(f"VHDL array is saved to {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert an image to a VHDL 16-bit A4R4G4B4 array.")
    parser.add_argument("input", help="Path to input image file")
    parser.add_argument("output", help="Path to output VHDL file")

    args = parser.parse_args()
    convert_to_vhdl_array(args.input, args.output)
