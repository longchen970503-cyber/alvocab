# 部署到 GitHub Pages

## 一、安装 Git（若尚未安装）

1. 打开 https://git-scm.com/ 下载 Windows 版并安装。
2. 安装时可按默认选项；安装完成后**关闭并重新打开** Cursor 或终端。

## 二、一键推送（推荐）

1. 双击运行项目里的 **`deploy.bat`**。
2. 若首次使用 Git 推送到 GitHub，可能会弹出浏览器让你登录 GitHub 或输入**个人访问令牌（Token）**：
   - 在 GitHub 网页：右上角头像 → **Settings** → **Developer settings** → **Personal access tokens** → 生成一个有 `repo` 权限的 token，复制后粘贴到终端“密码”处。

推送成功后继续第三步。

## 三、开启 GitHub Pages

1. 浏览器打开：**https://github.com/longchen970503-cyber/alvocab**
2. 点击 **Settings** → 左侧 **Pages**。
3. 在 **Build and deployment** 下：
   - **Source** 选 **Deploy from a branch**
   - **Branch** 选 **main**，文件夹选 **/ (root)**，点 **Save**。
4. 等待 1～2 分钟，页面上会显示：
   - **Your site is live at https://longchen970503-cyber.github.io/alvocab/**
5. 把该链接发给别人即可（手机、微信里打开也行）。

## 四、若不用脚本，可手动执行

在项目文件夹 `词汇` 内打开终端（或 Cursor 终端，先 `cd` 到该项目目录），执行：

```bash
git init
git branch -M main
git add .
git commit -m "Deploy vocabulary site"
git remote add origin https://github.com/longchen970503-cyber/alvocab.git
git push -u origin main
```

然后按上面 **三** 在 GitHub 里开启 Pages。

---

**常见问题**

- **推送时要求登录**：用 GitHub 用户名 + 个人访问令牌（Token）作为密码，不要用账号密码。
- **仓库已存在 README 导致冲突**：若你在 GitHub 上建仓库时勾选了 “Add a README”，需先 `git pull origin main --rebase` 再 `git push`，或删除仓库里的 README 后再推送。
