// 动画练习3：滑动提示卡片
// 实现：点击底部卡片 -> 滑动到屏幕中间并展开任务列表；再次点击 -> 滑回底部并收起。

@Entry
@Component
export struct TodoCard {
  // 是否展开
  @State isExpanded: boolean = false;

  // 卡片当前 translateY 偏移（单位 vp）
  // 收起状态：停留在底部；展开状态：滑动到屏幕中间
  @State translateY: number = 0;

  // 任务列表透明度，用于展开时淡入、收起时淡出
  @State tasksOpacity: number = 0;

  build() {
    Column() {
      // 空白占位，让卡片初始时位于底部
      Blank()

      // 卡片容器
      Column() {
        // 标题行
        Row() {
          Text('今日待办')
            .fontSize(18)
            .fontColor('#FFFFFF')
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .padding({ top: 16, bottom: 12, left: 20, right: 20 })

        // 任务列表（展开时才可见）
        Column() {
          this.TaskItem('完成 ArkTS 动画练习')
          this.TaskItem('阅读 HarmonyOS 官方文档')
          this.TaskItem('提交代码到 Gitee')
        }
        .opacity(this.tasksOpacity)
        .animation({
          duration: 400, // 淡入淡出比滑动稍快
          curve: Curve.EaseInOut
        })
        .padding({ left: 20, right: 20, bottom: 20 })
      }
      .width('90%')
      .backgroundColor('#4A4A4A')
      .borderRadius(16)
      .translate({ y: this.translateY })
      .animation({
        duration: 800,
        curve: Curve.EaseInOut
      })
      .onClick(() => this.toggleCard())
      .margin({ bottom: 24 }) // 距离底部固定间距
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  // 任务项组件
  @Builder
  TaskItem(content: string) {
    Row() {
      Text('• ' + content)
        .fontSize(16)
        .fontColor('#FFFFFF')
        .padding({ top: 6, bottom: 6 })
    }
    .width('100%')
  }

  // 切换展开/收起
  private toggleCard() {
    if (this.isExpanded) {
      // 收起：滑回底部，任务淡出
      this.translateY = 0;
      this.tasksOpacity = 0;
    } else {
      // 展开：滑到中间，任务淡入
      // 计算中间偏移：屏幕高度一半 - 卡片自身高度一半 - 底部 margin
      // 这里用粗略估算 260 vp，可根据实际微调
      this.translateY = -260;
      this.tasksOpacity = 1;
    }
    this.isExpanded = !this.isExpanded;
  }
}