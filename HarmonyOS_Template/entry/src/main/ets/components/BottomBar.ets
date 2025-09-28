// entry/src/main/ets/components/BottomBar.ets
@Component
export struct BottomBar {
  @Prop currentIndex: number;
  /* ✅ 给回调一个运行时无关的默认值 */
  onTabSelected: (index: number) => void = () => {};

  private readonly tabs: string[] = ['首页', '发现', '我的'];

  build() {
    // BottomBar.ets 临时调试
    Row() {
      ForEach(this.tabs, (title: string, idx: number) => {
        Column() {
          Text(title)
            .fontSize(this.currentIndex === idx ? 18 : 16)
            .fontColor(this.currentIndex === idx ? '#007DFF' : '#666')
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        .height(56)
        .backgroundColor(idx === 0 ? '#FFFF00' : '#FF00FF') // ← 高亮
        .onClick(() => {
          console.info(`BottomBar click idx=${idx}`);        // ← 日志
          this.onTabSelected(idx);
        })
      })
    }
    .height(56)          // 必须显式高度
    .width('100%')
    .backgroundColor('#FFFFFF')
  }
}