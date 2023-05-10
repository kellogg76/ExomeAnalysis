from PIL import Image, ImageDraw, ImageFont
import os
from datetime import date

# Set the directory containing the images
image_dir = '/mnt/d/Bioanalyzer/'

# Loop through all files in the directory to rename them
for filename in os.listdir(image_dir):
    # Check if the file name contains the string "2100 expert_High Sensitivity DNA Assay_"
    if "2100 expert_High Sensitivity DNA Assay_" in filename:
        # Replace the string with "HS DNA-"
        new_filename = filename.replace("2100 expert_High Sensitivity DNA Assay_", "HS DNA-")
        # Rename the file
        os.rename(os.path.join(image_dir, filename), os.path.join(image_dir, new_filename))

# Set the size of each image in the PDF
image_size = (388, 237)

# Set the number of images per row and column in the PDF
images_per_row = 3
images_per_col = 2

# Set the font and size for the filenames
font = ImageFont.truetype("arial.ttf", 12)

# Get a list of all image files in the directory
image_files = [os.path.join(image_dir, f) for f in os.listdir(image_dir) if os.path.isfile(os.path.join(image_dir, f)) and f.endswith('.jpg')]

# Calculate the number of pages needed to fit all the images
num_pages = (len(image_files) + images_per_row * images_per_col - 1) // (images_per_row * images_per_col)

# Loop over the images and add them to the PDF
for page in range(num_pages):
    # Create a new PDF file for each page
    pdf_filename = f'{image_dir}/BioA_{date.today().strftime("%Y-%m-%d")}_page{page+1}.pdf'
    pdf = Image.new('RGB', (images_per_row * image_size[0] +40, images_per_col * image_size[1] + 60), color='white')

    # Create a draw object for the filenames
    draw = ImageDraw.Draw(pdf)

    for i, image_file in enumerate(image_files[page*images_per_row*images_per_col:(page+1)*images_per_row*images_per_col]):
        # Open the image file
        img = Image.open(image_file)

        # Resize the image
        img.thumbnail(image_size, Image.ANTIALIAS)

        # Calculate the coordinates of the image in the PDF
        x = (i % images_per_row) * image_size[0] + 25
        y = (i // images_per_row) * (image_size[1] + 30)

        # Add the image to the PDF
        pdf.paste(img, (x, y))

        # Add the filename beneath the image
        filename = os.path.basename(image_file)
        draw.text((x, y + image_size[1]), filename, font=font, fill='black')

    # Save the page
    pdf.save(pdf_filename, "PDF", resolution=100.0)

print(f"PDF files saved in {image_dir}.")
