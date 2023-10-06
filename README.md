## SpeedTest Automation Setup Guide

Hello! This guide will assist you in setting up an automated job on your Mac that will run a speed test every hour and save the results. Don't worry, we'll guide you through each step!

### Prerequisites

- **Ensure** you have Homebrew installed on your Mac. If not, visit [brew.sh](https://brew.sh/) and follow the installation instructions.

### Step-by-Step Guide

### Step 1: Move the Folder

- **Move** the folder named `speedtest_automation` (or as provided) to a location on your computer where it won’t be accidentally deleted (e.g., your Documents folder).

### Step 2: Grant Full Disk Access (if necessary)

- **Depending** on your macOS settings, you might need to grant full disk access to `bash` and `sh`:
    - Go to **System Preferences** > **Security & Privacy** > **Privacy** tab.
    - Scroll down and select **Full Disk Access**.
    - Click the lock icon in the bottom-left corner and enter your password to make changes.
    - Click the `+` button to add an application.
    - Navigate to `/bin/bash` and `/bin/sh` and add them to the list.
    - Ensure they are checked and then lock the settings again.

### Step 3: Open Terminal

- **Navigate** to the **Applications** folder, then to the **Utilities** folder, and double-click on **Terminal**.

### Step 4: Navigate to the Folder in Terminal

- **In** the Terminal, navigate to the `speedtest_automation` folder using:
    ```sh
    cd path_to_folder/speedtest_automation
    ```
    **Note**: Replace `path_to_folder` with the actual path. If unsure:
    - Open Finder and navigate to the `speedtest_automation` folder.
    - While holding the **Option** key, right-click on the `speedtest_automation` folder and select “Copy `speedtest_automation` as Pathname”.
    - Go back to Terminal, type `cd ` (with a space), then paste the path and press `Enter`.

### Step 5: Run the Setup Script

- **Run** the setup script using:
    ```sh
    bash setup_speedtest.sh
    ```
    You might be asked to enter your computer password. This is normal, as the script needs permissions to set up the automated job and install `speedtest-cli`.

### Step 6: Verify the Setup

- **Ensure** everything is set up correctly:
    ```sh
    sudo launchctl list | grep com.harrisonward.speedtest
    ```
    You should see some output with `com.harrisonward.speedtest` indicating that the job is loaded.
    
    If you notice the script is not working as expected, run the following for detailed diagnostic information:
    ```sh
    sudo launchctl print system/com.harrisonward.speedtest
    ```

🎉 **Congratulations!** The speed test should now automatically run every hour and save the results. If you encounter any issues or have questions, feel free to reach out!
