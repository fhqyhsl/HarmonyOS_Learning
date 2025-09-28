import { BottomBar } from '../pages/BottomBar'

@Entry
@Component
struct DiscoveryPage {
  build() {
    Column() {
      // 顶部标题栏
      Text('发现')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .width('100%')
        .textAlign(TextAlign.Center)

      // 搜索框
      TextInput({ placeholder: '搜索内容...' })
        .width('90%')
        .height(40)
        .backgroundColor(Color.White)
        .borderRadius(20)
        .padding({ left: 15, right: 15 })
        .margin({ bottom: 20 })

      // 分类导航
      Row() {
        Text('推荐').margin({ right: 20 })
        Text('热门').margin({ right: 20 })
        Text('最新').margin({ right: 20 })
        Text('分类')
      }
      .width('100%')
      .padding({ left: 20, right: 20 })
      .margin({ bottom: 20 })

      // 内容列表
      List({ space: 10 }) {
        ForEach([1,2,3,4,5], (item:number) => {
          ListItem() {
            Column() {
              // 内容占位图
              Flex()
                .width('100%')
                .height($r("app.float.page_flex_height"))
                .backgroundColor($r("app.color.BackGround_color"))
                .borderRadius(8)

              // 标题占位
              Text($r("app.string.Title_area"))
                .fontSize(16)
                .margin({ top: 8 })
                .width('100%')

              // 副标题占位
              Text($r("app.string.AnoTitle_area"))
                .fontSize(12)
                .opacity(0.8)
                .margin({ top: 4 })
                .width('100%')
            }
            .padding(10)
          }
        })
      }
      .width('100%')
      .layoutWeight(1)

    }
    .backgroundColor('#FFFFFF')
    .width('100%')
    .height('100%')

  }
}