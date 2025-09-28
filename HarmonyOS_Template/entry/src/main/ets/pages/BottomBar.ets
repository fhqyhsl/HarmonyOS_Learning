// BottomBar.ets
@Component
export struct BottomBar {
  @Prop currentIndex: number   // 当前高亮索引
  @Prop onTabSelected: (index: number) => void  // 显式声明函数类型

  build() {
    Row() {
      ForEach(['首页', '发现', '我的'], (title: string, idx: number) => { // 显式参数类型
        Column() {
          Text(title)
            .fontSize(this.currentIndex === idx ? 18 : 16)
            .fontColor(this.currentIndex === idx ? '#007DFF' : '#666')
        }
        .layoutWeight(1)
        .onClick(() => this.onTabSelected(idx))
      })
    }
    .width('100%')
    .height(56)
    .backgroundColor('#FFF')
    .shadow({ radius: 6, color: '#20000000' })
  }
}