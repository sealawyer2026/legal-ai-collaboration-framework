# 贡献指南

欢迎贡献代码、文档、问题报告！

感谢您对Legal-AI-Collaboration-Framework的关注！

---

## 🤝 如何贡献

### 1. 报告Bug

发现问题？请在GitHub Issues提交Issue，包含：
- Bug描述
- 复现步骤
- 预期行为
- 环境信息

### 2. 提交代码

**流程：**

1. Fork本仓库
2. 创建特性分支：`git checkout -b feature/your-feature`
3. 提交代码
4. 创建Pull Request

**代码规范：**
- 遵循PEP 8代码风格
- 添加适当的测试
- 更新相关文档
- 保持代码简洁清晰

### 3. 提交文档

- 翻译文档：支持中英文
- 格式规范：Markdown
- 内容完整准确
- 包含示例代码

### 4. 提交Issue

- 使用Issue模板
- 提供足够的信息
- 搜索现有Issue避免重复

---

## 📋 代码规范

### Python代码风格

```python
class MyAgent(LegalAgentBase):
    """智能体类文档字符串"""

    def __init__(self, name: str, role: str, toolbox_path: Optional[str] = None):
        """
        初始化智能体

        Args:
            name: 智能体名称
            role: 智能体角色
            toolbox_path: 工具库文件路径
        """
        super().__init__(name, role, toolbox_path)

    def execute(self, task: Dict[str, Any]) -> Dict[str, Any]:
        """
        执行任务

        Args:
            task: 任务字典，包含：
                - task_type: 任务类型（必需）
                - 其他参数根据任务类型而定

        Returns:
            任务结果字典，包含：
                - status: 执行状态
                - 其他字段根据任务类型而定
        """
        pass
```

### 命名规范

```python
# ✅ 推荐
class CivilLawyerAgent(LegalAgentBase):
    pass

# ❌ 不推荐
class civil_lawyer_agent(LegalAgentBase):
    pass

# ✅ 推荐
def get_tool(self, tool_name: str) -> Optional[Dict]:
    """获取工具信息"""
    pass

# ❌ 不推荐
def getTool(self, toolName):
    pass
```

### 注释规范

```python
# ✅ 推荐
def calculate_compensation(
    damages: Dict[str, Any]
) -> Dict[str, Any]:
    """
    计算赔偿金额

    Args:
        damages: 损害数据字典

    Returns:
        赔偿计算结果
    """
    pass

# ❌ 不推荐
def calc(d):
    pass
```

---

## 🧪 测试规范

### 测试文件命名

```
tests/test_*.py
```

### 测试类命名

```python
# ✅ 推荐
class TestCivilLawyerAgent(unittest.TestCase):
    pass

# ❌ 不推荐
class test_civil_lawyer(unittest.TestCase):
    pass
```

### 测试方法命名

```python
# ✅ 推荐
def test_tort_analysis_success():
    pass

# ❌ 不推荐
def test_tort_analysis_success():
    pass
```

### 测试结构

```python
import unittest

class TestCivilLawyerAgent(unittest.TestCase):
    """测试民事律师智能体"""

    def setUp(self):
        """每个测试前执行"""
        self.agent = CivilLawyerAgent()

    def test_execute_tort_analysis(self):
        """测试侵权分析"""
        task = {
            'task_type': '侵权分析',
            'case_description': '测试案件',
            'behavior_facts': ['事实1', '事实2']
        }
        result = self.agent.execute(task)

        self.assertEqual(result['status'], 'success')
        self.assertGreaterEqual(result['confidence'], 0.8)

if __name__ == '__main__':
    unittest.main()
```

---

## 📝 提交Pull Request

### PR模板

**标题格式：** `[Feature] 简短描述`

**正文模板：**

```markdown
## 类型
- [Feature] 新功能
- [Bugfix] Bug修复
- [Docs] 文档更新
- [Refactor] 代码重构
- [Chore] 代码优化

## 变更说明

简要描述这个PR做了什么，为什么这么做。

## 测试情况

- [ ] 已测试所有现有测试
- [ ] 添加了新的测试
- [ ] 所有测试通过

## 检查清单

- [ ] 代码符合PEP 8规范
- [ ] 添加了单元测试
- [ ] 更新了相关文档
- [ ] 更新了CHANGELOG
- [ ] 不影响现有功能

## 其他

- [ ] 不破坏现有功能
- [ ] 遵循代码规范
- [ ] 编写测试
- [ ] 更新文档
- [ ] 提交前运行 `black` 和 `flake8`
```

---

## 🎯 贡献类型

### 新增功能

- ✅ 新增工具
- ✅ 新增智能体类型
- ✅ 优化现有功能
- ✅ 新增教程和文档

### Bug修复

- ✅ 修复已知Bug
- ✅ 性能优化
- ✅ 兼容性修复

### 文档改进

- ✅ 文档内容补充
- ✅ 错误修复
- ✅ 格式优化
- ✅ 示例更新

---

## 🚫 发布流程

1. 提交PR到主分支
2. 代码审查
3. 合并到主分支
4. 发布新版本
5. 更新CHANGELOG

---

## 📞 联系方式

- **Issues**: https://github.com/legal-ai-collaboration-framework/issues
- **Discussions**: https://github.com/legal-ai-collaboration-framework/discussions
- **Pull Requests**: https://github.com/legal-ai-collabor-framework/pulls

---

## 🙏 行为准则

- ✅ 尊重尊重其他贡献者
- ✅ 建设性讨论
- ✅ 代码审查及时响应
- ✅ 遵循代码规范
- ✅ 测试驱动开发
- ✅ 文档与代码同步更新

---

## 📚 参考资源

- [Python PEP 8规范](https://peps.python.org/pep-8/)
- [Google代码风格指南](https://google.github.io/styleguide/)
- [开源贡献指南](https://opensource.guide/)
- [How to Write Great Git Commit Messages](https://chris.beams.com/articles/git-commit-message/)

---

## 🎉 欢迎您的贡献！

感谢您为Legal-AI-Collaboration-Framework做出贡献！

让法律AI协作变得更简单！🚀
