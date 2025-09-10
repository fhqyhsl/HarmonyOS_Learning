// 个人信息卡片组件
@Component
@Entry
@Preview
export struct MyInfo {
  // 个人信息属性定义，均设置默认值以便预览
  @Prop name: string = "杨帆1111"


  @Prop avatar: string = "https://public-cdn-oss.mosoteach.cn/avatar/2022/A0/28865c793f80fdfa5e327960961d20c8.jpg?v=1725255800&x-oss-process=style/s300x300" // 头像默认图片


  build() {
    Column() {
      // 卡片容器
      Column() {
        // 头像区域
        Row() {
          Image(this.avatar)
            .width(100)
            .height(100)
            .borderRadius(50)
            .objectFit(ImageFit.Cover)
            .border({ width: 3, color: '#f0f0f0' })
        }
        .padding(20)

        // 基本信息区域
        Column({ space: 8 }) {
          Text(this.name)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333')


        }
        .padding({ bottom: 15 })


        // 详细信息区域
        Column({ space: 6 }) {




        }

      }
      .backgroundColor('#fff')
      .borderRadius(12)
      .shadow({ radius: 10, color: '#00000010', offsetX: 0, offsetY: 2 })
      .width('90%')

    }
    .backgroundColor('#f5f5f5')
    .width('100%')
    .height('100%')
    .padding(15)
    .justifyContent(FlexAlign.Center)
  }

  // 封装信息行组件，复用代码
  @Builder
  createInfoRow(icon: string, content: string) {
    Row({ space: 10 }) {
      Text(icon)
        .fontSize(16)
        .width(20)

      Text(content)
        .fontSize(14)
        .fontColor('#555')
        .flexGrow(1)
    }
    .padding({ left: 5 })
    .height(24)
  }
}
