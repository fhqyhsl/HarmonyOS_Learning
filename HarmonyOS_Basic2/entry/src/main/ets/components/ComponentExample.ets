@Component  // 类似Vue的组件定义
export struct UserCard {
  @Prop username: string = '' // 类似Vue的props
  @State isOnline: boolean = false // 类似Vue的data

  build() {
    // 类似Vue的template
    Row() {
      Image('https://public-cdn-oss.mosoteach.cn/avatar/2022/A0/28865c793f80fdfa5e327960961d20c8.jpg?v=1725255800&x-oss-process=style/s300x300')
        .width(50)
        .height(50)

      Column() {
        Text(this.username)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        Text(this.isOnline ? '在线' : '离线')
          .fontSize(12)
          .fontColor(this.isOnline ? Color.Green : Color.Gray)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 10 })
    }
    .padding(15)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }
}