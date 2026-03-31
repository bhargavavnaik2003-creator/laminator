# Merino Laminate Kiosk - Complete Project Overview

This document explains exactly how the Kiosk application functions, what technologies power it, the types of imagery required, and how the underlying database handles the scale.

---

## 1. Project Goal: What are we trying to achieve? 
The objective was to build a commercial-grade, blazing-fast interactive **Digital Laminate Visualizer**. 
Customers browsing physical laminate catalogues often struggle to imagine what a small 2x2 inch piece of material looks like when applied to a huge surface (like an entire Kitchen or a Bedroom Wardrobe). This software allows the customer to instantly tap a laminate finish and see it realistically mapped onto a full high-definition room photograph in real-time, greatly improving the purchasing experience.

---

## 2. Technology Stack & Coding Languages
The application is built leveraging modern cross-platform development frameworks:

- **Coding Language:** **Dart** (v3.0+). Dart is a fast, object-oriented, C-style language heavily optimized for building rapid user interfaces.
- **App Framework:** **Flutter**. Flutter allows us to build the app once and compile it natively to **Windows Desktop** (specifically targeted as high-performance `.exe` kiosks), while retaining the ability to export it to iPads/Tablets in the future.
- **State Management:** **Riverpod** (`hooks_riverpod`). An extremely stable and modern reactive state engine. Riverpod guarantees the app never suffers from lag or "junk" when users rapidly tap different colours.
- **Database Engine:** **SQLite** via **Drift** (`drift_flutter`). This provides a completely offline, ultra-fast relational database natively embedded inside the application.

---

## 3. The 2D Stencil Rendering System (Images Required)
To achieve the photorealistic visualizer effect *without* relying on expensive, sluggish 3D gaming engines, we built a **2D Stencil Rendering Stack**. 

The application utilizes a clever blending mode natively built into Flutter called `BlendMode.srcATop`. This mode magically "soaks" the exact color and texture of a laminate swatch only into the non-transparent parts of a mask image, completely preserving original photograph shadows and grain.

### For every room scene, TWO kinds of pictures are required:
1. **The Base Photo (.jpg)**:
   - A single, high-definition (1920x1080) realistic rendering or photograph of a room, completely static.
2. **The Surface Masks (.png)**:
   - These are transparent cutout images matching the exact size (1920x1080) of the Base Photo.
   - For a "TV Unit", you open the Base Photo in Photoshop, carefully cut out only the doors of the TV unit, color them purely white (or grey, retaining their shadows), and delete EVERYTHING else so the rest of the image is 100% transparent.
   - When the user selects a room, the app lays the transparent `.png` mask directly on top of the `.jpg`. When they pick a wood color, it digitally tints *only* the white cutout portion of the mask with the wood texture!

---

## 4. Understanding the Database & Architecture
The problem with most mock-up applications is that the developers "hard-code" the buttons and room images directly into the source code. If the company shoots a new room photo, the developer must rewrite and recompile the software to add a button for it.

We solved this by **separating the logic from the data**.
Our SQLite database acts as the single source of truth. When the Kiosk launches, the software reads a single text file (`assets/data/initial_data.json`) and inserts the data into three major SQL tables:
- **Laminates**: Contains all swatch colors, textures, and categories (Wood, Stone, Plain).
- **Rooms**: Contains the Base Photo (.jpg) paths and Category (Living, Bedroom).
- **Surfaces**: A single Room can have *many* Surfaces. For example, the Living Room photograph holds a "TV Unit" `.png` mask and a "Feature Wall" `.png` mask.

Because the UI dynamically reads this database, the system will **automatically generate** new buttons, new category filter tabs, and new surface sliders the moment you add a new room photo to the `assets` folder and type its name into the JSON file. **No developer required.**

4. **Offline Kiosk Mode:** Because the entire SQLite database is generated and lives locally on the Windows machine, the app runs lightning-fast with zero internet dependency.

---

## 5. Step-by-Step: How to Add New Pictures and Laminate Colors!

To add a completely new room and entirely new laminate colors to your application, you do **not** need to touch the complex Flutter code. You only interact with the `assets` folder and the Database Seed file.

### Step A. Prepare your Photography
1. **Base Room (.jpg):** Save your new high-definition room photograph (e.g., `bathroom_01.jpg`) into `assets/rooms/`.
2. **Transparent Surface Masks (.png):** Open that base photo in Photoshop. Select the exact surface you want to tint (e.g., a Mirror Frame or a Wall). Delete the entire rest of the photograph so it is 100% transparent. Color the selected area pure white (retaining the shadows behind it). Export it exactly the same 1920x1080 size as your base photo.
3. Save the mask (e.g., `bathroom_01_wall_mask.png`) into `assets/rooms/masks/`.
4. **New Laminate Textures (.png):** Save any new seamless, repeating laminate textures into `assets/textures/`. 

### Step B. Register them in the Database Configuration
1. Open the file **`assets/data/initial_data.json`**.
2. To add your new **Laminate**, copy an existing line in the `"laminates"` array (at the top of the file) and paste it below. 
   - Give it a unique `"id"` (e.g., 21).
   - Point the `"texturePath"` to your new file in the `assets/textures/` folder.
   - Enter the name, color code, and category (`"wood"`, `"stone"`, `"plain"`, `"fabric"`).
3. To add your new **Room**, copy an existing block in the `"rooms"` array (at the bottom of the file).
   - Give it a unique `"id"` (e.g., 4).
   - Change the `"imagePath"` to your new `bathroom_01.jpg`.
   - Inside its `"surfaces"` list, link the actual `.png` mask you made. You can add as many surfaces to one room as you want!

### Step C. Trigger the Database Rebuild
Because your app currently uses an offline built database, it only reads your `.json` file **once** during installation. If you make edits, you must tell the app to generate a fresh database!
1. Open **`lib/core/database/app_database.dart`**.
2. Scroll to Line 37. You will see: `driftDatabase(name: 'app_database_v5');`.
3. Simply increase that number by 1! Change it to `app_database_v6`. This tricks the app into starting fresh!
4. Save the file.
5. In your terminal, run `flutter run -d windows`.

As soon as the app boots, it will scan your updated JSON, insert the brand new records into the SQLite File, and instantly create the menus, tabs, and buttons for your new Bathroom on the front screen!
