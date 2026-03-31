# Compressive Guide: Hosting Flutter App on GitHub Pages

This document outlines each step taken to convert your local Flutter Desktop kiosk application into a live web application hosted on GitHub Pages. It serves as a permanent reference guide should you ever need to recreate this process for other projects or re-deploy this one from scratch.

---

## 🏗️ Phase 1: Preparing the Codebase for the Web

By default, your application was configured for `windows` only. To run it on the internet, we needed to instruct Flutter to generate the necessary files to run in a web browser.

### Step 1. Enable Web Platform
We ran the following command in the terminal to scaffold the Flutter Web directory structure.
```bash
flutter create --platforms=web .
```
**What it did:** This created the `web/` folder in your project root, containing the initial HTML shell (`index.html`), favicons, and metadata required by browsers.

### Step 2. Add SQLite Web Engine
Your app uses `drift_flutter` to store laminates and saved room designs locally in a database. While normal `sqflite` doesn't work well on browsers, `drift_flutter` utilizes the browser's "IndexedDB" along with a WebAssembly engine (`sqlite3.wasm`) to make everything run perfectly.

To make the database work, we downloaded the core WebAssembly SQLite execution engine directly into your `web` folder.
* **Downloaded:** `sqlite3.wasm` from the official drift GitHub repository.
* **Moved to:** `web/sqlite3.wasm`
* **What it did:** Allows the local database to initialize on anyone's Chrome/Edge browser without needing a backend server like Firebase.

---

## 🚀 Phase 2: Automating Deployment (GitHub Actions)

We could manually build the app every time you make a change, but it is vastly superior to use **GitHub Actions**. This tells GitHub's servers to build and publish your app for you every single time you push new code to your repository.

### Step 3. Create the Workflow File
We created a hidden folder structure: `.github/workflows/gh-pages.yaml`. 
This file acts as a robot worker that receives your updated code, installs Flutter, builds the web app, and copies the final files over to GitHub Pages.

**The configuration inside `gh-pages.yaml`:**
- Connects to the `main` branch.
- Sets up standard Flutter configuration (`flutter pub get`).
- Executes `flutter build web --base-href "/laminator/" --release`. 
*(Note: The `--base-href` flag is crucial. Because your app lives at `github.io/laminator/`, this flag ensures all image assets load correctly).*
- Deploys the completed build to the GitHub Pages server automatically.

---

## 🌐 Phase 3: Pushing Your Code Live (User Steps)

Once the code is prepared, it needs securely transported from your local computer to GitHub. Since Git requires personal authentication, these are the steps you must execute:

### Step 4. Setting up Git Identity (One-Time Only)
If you have never pushed code from this specific account before, you tell Git who you are. Run these inside your project terminal:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 5. Create the Initial Commit
We bundle everything (the new web folder, the GitHub Action, and all your Dart code) into a snapshot.
```bash
git add .
git commit -m "Initial commit: Ready for GitHub Pages deployment"
```

### Step 6. Connect to GitHub and Publish
We link your local folder to your remote empty repository and push the snapshot.
```bash
git branch -M main
git remote add origin https://github.com/bhargavavnaik2003-creator/laminator.git
git push -u origin main
```
*(GitHub may pop up a browser window asking you to authorize the sign-in).*

---

## ✅ Phase 4: Finalizing the Live Website

After successfully pushing your code:

1. Open your repository URL (https://github.com/bhargavavnaik2003-creator/laminator) in your browser.
2. Click on the **Actions** tab at the top. You will see a workflow running with a yellow circle. Wait ~2-3 minutes for it to turn into a green checkmark indicating a successful build.
3. Click on the **Settings** tab.
4. On the left sidebar, scroll down to **Pages**.
5. Under **Build and deployment**, ensure the Source dropdown says **GitHub Actions**. 
6. Within a minute, a link will appear at the top of the Pages tab. Your application is officially live to the public at:
   **https://bhargavavnaik2003-creator.github.io/laminator/**

Whenever you modify your Dart code and want to push the update to your users, simply run:
```bash
git add .
git commit -m "Added a new feature"
git push
```
GitHub Actions will automatically update your public site within 3 minutes!
