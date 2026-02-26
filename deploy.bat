@echo off
chcp 65001 >nul
echo ========================================
echo  推送到 GitHub 仓库 longchen970503-cyber/alvocab
echo ========================================
echo.

cd /d "%~dp0"
set "PATH=D:\Git\cmd;%PATH%"

git --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到 Git。请先安装 Git: https://git-scm.com/
    pause
    exit /b 1
)

if not exist ".git" (
    echo 正在初始化 Git 仓库...
    git init
    git branch -M main
)

echo 正在添加所有文件...
git add .

echo 正在提交...
git commit -m "Deploy IGCSE A-Level vocabulary site" 2>nul || git commit -m "Update vocabulary site" 2>nul
if errorlevel 1 (
    echo 没有新更改需要提交，或已提交过。将尝试推送...
) else (
    echo 提交完成。
)

echo.
echo 正在添加远程仓库（若已存在会更新）...
git remote remove origin 2>nul
git remote add origin https://github.com/longchen970503-cyber/alvocab.git

echo 正在推送到 GitHub...
git push -u origin main
if errorlevel 1 (
    echo.
    echo [提示] 若推送失败，请检查：
    echo   1. 已登录 GitHub 或在浏览器中完成认证
    echo   2. 仓库 https://github.com/longchen970503-cyber/alvocab 已创建
    echo   3. 使用 HTTPS 时可能需要个人访问令牌（Token）
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo  推送成功！
echo  下一步：在浏览器打开
echo  https://github.com/longchen970503-cyber/alvocab
echo  点击 Settings - Pages - Source 选 "Deploy from a branch"
echo  Branch 选 main，文件夹选 / (root)，保存。
echo  几分钟后网站地址：
echo  https://longchen970503-cyber.github.io/alvocab/
echo ========================================
pause
