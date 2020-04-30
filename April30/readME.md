**Creative Image**

**Description:**
For this project I used PImage, image.get(), and pixels to create a UAE flag both tinted and fully colored over the NYUAD entrance sign. For the tint part, I identified the color I wanted to tint the image and used the imaage.get() function to select the part of the image I wanted tinted. I did this for all 4 colors of the flag and had an if condition for when the user preses the 'ENTER' key so that this tinted flag could be seen over the NYUAD picture. For the full color flag I accessed the pixels of the image to color different sections different colors to match the UAE flag. This full color flag is seen when the mouse is pressed and is gone when the mouse is released.

[Here]() is a video of my creative image!

**Original Photo:**


**Tinted Flag:**


**Full Color Flag:**


**Problems Faced:**
• While working on the proeject I faced issues with using pixels and tint(). I could not figure out how to tint different pixels so instead opted to fully color them over the original image.
• I also tried to figure out a way to remove the tint after the 'ENTER' key was clicked. Originally, I was trying to use the keyReleased() void function to specify instructions (go back to normal/the original image) for what the program should do after the 'ENTER' key was released. However, I accidentally clicked the 'DELETE' key and released that it removed the tint as well. I'm not sure why it did but that solved the problem.
• Finally, a final problem I struggled with was getting the program to display different images depending on how many times the mouse was pressed. My original idea for the project was that different flags would show up over the NYUAD image, both tinted and full color, depending on how many time the mouse was pressed. This proved quite difficult as I tried to use a variable to keep track of the clicks but I think the mouse was too sensitive (especially if you hold it). I couldn't figure out how to fix this issue so I instead opted to keep my project simple and only do one flag in tinted and full color.

**Sources:**
• https://processing.org/tutorials/pixels/
• https://processing.org/reference/tint_.html
• https://forum.processing.org/one/topic/how-to-change-the-color-of-each-pixel-in-an-image.html
