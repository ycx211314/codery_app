# codery

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```bash
mkdir -p ./lib/{api,common/{constants,utils,widgets},data/{models,providers,repositories},routes,screens/{home,details},services}
```

## 对象 json 序列化

1. 引入 json_annotation 包，json_serializable 包

2. 创建一个类，添加@JsonSerializable()注解，然后使用 json_serializable 生成序列化代码
3. 添加@JsonKey(name: 'xxx')注解，指定 json 字段名
4. 使用 json_serializable 生成序列化代码
