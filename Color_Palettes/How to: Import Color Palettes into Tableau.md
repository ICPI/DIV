# How to import ICPI Color Palettes into Tableau
## Instructions

### 1. Edit the preferences file

The Preferences.tps file is located in your My Tableau Repository. The file is a basic XML file that you can open in a text editor to modify. An unedited preferences file looks like this:

![image](https://user-images.githubusercontent.com/5234106/52356205-d053d680-2a01-11e9-8f65-b8e002ed7760.png)

### 2. To edit your preferences file

Go to the **My Tableau Repository** folder in your Documents directory, and open the **Preferences.tps** file with any Text Editor like Notepad, Notepad ++, Sublime, etc. 

### 3. Copy and paste the following code in the **Preferences.tps** file.

```
<?xml version='1.0'?>

<workbook>
  <preferences>
	<color-palette name="Autumn Woods" type="regular" > 
	<color>#335b8e</color> 
	<color>#6ca18f</color> 
	<color>#b5b867</color> 
	<color>#cc5234</color> 
	<color>#d9812c</color> 
	<color>#948d79</color> 
	</color-palette>
	
	<color-palette name="Coast of Bohemia" type="regular" > 
	<color>#2166ac</color> 
	<color>#67a9cf</color> 
	<color>#d1e5f0</color> 
	<color>#b2182b</color> 
	<color>#ef8a62</color> 
	<color>#fddbc7</color> 
	</color-palette>
	
	<color-palette name="Tidepools" type="regular" > 
	<color>#ceb966</color> 
	<color>#9cb084</color> 
	<color>#6bb1c9</color> 
	<color>#6585cf</color> 
	<color>#7e6bc9</color> 
	<color>#a379bb</color> 
	</color-palette>

	<color-palette name="By the Power of Grayscale" type="regular" > 
	<color>#dddddd</color> 
	<color>#b2b2b2</color> 
	<color>#969696</color> 
	<color>#808080</color> 
	<color>#5f5f5f</color> 
	<color>#4d4d4d</color> 
	</color-palette>	

	<color-palette name="Panorama" type="regular" > 
	<color>#ff6600</color> 
	<color>#ffcc00</color> 
	<color>#70ad47</color> 
	<color>#6699ff</color> 
	</color-palette>	
	</preferences>
  
  </workbook>

  ```


### 4. Save the **Preferences.tps** file and restart Tableau. You'll see the new color palettes in Tableau.
![image](https://user-images.githubusercontent.com/5234106/52356559-756eaf00-2a02-11e9-87ff-c6f67270d417.png)

More info: https://onlinehelp.tableau.com/current/pro/desktop/en-us/formatting_create_custom_colors.htm 
