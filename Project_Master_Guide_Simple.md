# 🧸 DevOps for Beginners: The "Keep It Simple" Master Guide

Hello! This is a super simple guide to building your DevOps project. Think of it like a recipe for a giant cake made of code!

---

## 🏗️ The 4 Robots (Servers) You Need
First, you need 4 computers (we call them EC2 instances). Give them these names:
1.  **Robot 1 (Jenkins)**: He is the "Boss." He tells everyone what to do.
2.  **Robot 2 (Tomcat)**: He is the "Waiter." He shows your website to the world.
3.  **Robot 3 (Ansible)**: He is the "Truck Driver." He moves the code from the Boss to the other computers.
4.  **Robot 4 (Docker)**: He is the "Container." He keeps the code safe in a neat little box.

---

## 🛠️ Step 1: Put the Tools in the Robots
Go to the `nodes/` folder on your computer. Inside, you will see 4 files:
- Open `Jenkins_Node.md` and copy the commands into **Robot 1**.
- Open `Tomcat_Node.md` and copy the commands into **Robot 2**.
- Open `Ansible_Node.md` and copy the commands into **Robot 3**.
- Open `Docker_Node.md` and copy the commands into **Robot 4**.

---

## 🗺️ Step 2: The Secret Handshake
The Boss (Jenkins) needs to talk to the Truck Driver (Ansible).
1. Go to **Robot 3** (Ansible).
2. Type `ssh-keygen` and press Enter until it finishes.
3. Copy the secret key to **Robot 4** using: `ssh-copy-id ansadmin@<Robot-4-IP>`.
Now they can talk without passwords!

---

## 🚀 Step 3: Run the Code!
Once your robots are ready:
1. Go to the `code/` folder.
2. Send the `deploy_app.yml` file to **Robot 3**.
3. Run this magic command:
   ```bash
   ansible-playbook -i hosts deploy_app.yml
   ```
Poof! Your website is now running inside a box (Docker) on **Robot 4**!

---

## 🌟 How to know it worked?
Open your web browser and type the IP address of **Robot 4** followed by `:8080`.
Example: `http://13.233.xx.xx:8080`
If you see your website, you are a DevOps Master!

---

> [!TIP]
> **Remember**: 
> 1. Start the servers. 
> 2. Install the tools. 
> 3. Run the playbook. 
> 4. Check the website!

---
*DevOps is just like building with Legos. Have fun!*
