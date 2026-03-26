#!/bin/bash
# Legal-AI-Collaboration-Framework 快速发布脚本
# 使用方法: ./release.sh YOUR_GITHUB_USERNAME

set -e  # 遇到错误立即退出

# 检查参数
if [ $# -eq 0 ]; then
    echo "❌ 错误: 请提供GitHub用户名"
    echo "使用方法: ./release.sh YOUR_GITHUB_USERNAME"
    exit 1
fi

GITHUB_USERNAME=$1
REPO_NAME="legal-ai-collaboration-framework"
GITHUB_URL="https://github.com/${GITHUB_USERNAME}/${REPO_NAME}"

echo "==================================================================="
echo "🚀 Legal-AI-Collaboration-Framework 发布脚本"
echo "==================================================================="
echo ""
echo "GitHub用户名: $GITHUB_USERNAME"
echo "仓库名称: $REPO_NAME"
echo "仓库URL: $GITHUB_URL"
echo ""
read -p "确认继续吗？(y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "❌ 取消发布"
    exit 0
fi

# 1. 检查Git仓库状态
echo ""
echo "📋 步骤1: 检查Git仓库状态..."
git status

# 2. 拉取最新更改（如果有）
echo ""
echo "📥 步骤2: 检查是否有远程仓库..."
if git remote | grep -q "origin"; then
    echo "检测到远程仓库，拉取最新更改..."
    git fetch origin
else
    echo "未检测到远程仓库"
fi

# 3. 添加所有文件
echo ""
echo "➕ 步骤3: 添加所有文件到Git..."
git add -A

# 4. 检查是否有更改
echo ""
echo "🔍 步骤4: 检查更改..."
if git diff --cached --quiet; then
    echo "没有新的更改需要提交"
else
    echo "以下文件将被提交:"
    git diff --cached --name-only
    git commit -m "chore: Update for release v1.0.0"
fi

# 5. 创建标签
echo ""
echo "🏷️  步骤5: 创建v1.0.0标签..."
if git rev-parse v1.0.0 >/dev/null 2>&1; then
    echo "标签v1.0.0已存在，跳过"
else
    git tag -a v1.0.0 -m "Release v1.0.0: Initial release of Legal-AI-Collaboration-Framework

Features:
- LegalAgentBase framework with self-evolution capability
- Toolbox management system
- Knowledge retrieval system
- Experiment tracking with wandb integration
- Performance statistics

Documentation:
- Complete API documentation
- Architecture documentation
- Tutorial (Chinese & English)
- Contribution guide

Examples:
- MyLawyerAgent example
- SimpleTool example

License: Apache 2.0"
    echo "✅ 标签v1.0.0创建成功"
fi

# 6. 添加远程仓库（如果还没有）
echo ""
echo "🔗 步骤6: 配置远程仓库..."
if git remote | grep -q "origin"; then
    echo "远程仓库已存在: $(git remote get-url origin)"
    read -p "是否更新远程仓库URL？(y/n): " update_remote
    if [ "$update_remote" = "y" ]; then
        git remote set-url origin ${GITHUB_URL}.git
        echo "✅ 远程仓库URL已更新"
    fi
else
    git remote add origin ${GITHUB_URL}.git
    echo "✅ 远程仓库已添加"
fi

# 7. 推送到GitHub
echo ""
echo "📤 步骤7: 推送到GitHub..."
echo "正在推送代码和标签..."
git branch -M main
git push -u origin main
git push origin v1.0.0

# 8. 完成
echo ""
echo "==================================================================="
echo "✅ 发布完成！"
echo "==================================================================="
echo ""
echo "📦 仓库地址: $GITHUB_URL"
echo "📝 Release页面: ${GITHUB_URL}/releases/tag/v1.0.0"
echo ""
echo "🎉 下一步操作:"
echo "1. 访问 $GITHUB_URL 确认代码已上传"
echo "2. 访问 ${GITHUB_URL}/releases/new 创建GitHub Release"
echo "3. 添加Repository Topics（标签）"
echo "4. 发布到社区（Hacker News, Reddit, Twitter等）"
echo ""
echo "💡 详细说明请查看 RELEASE_GUIDE.md"
echo ""
echo "🚀 Legal-AI-Collaboration-Framework - 让法律AI协作变得简单！"
echo ""
