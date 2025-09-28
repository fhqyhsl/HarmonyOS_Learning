@Entry
@Component
struct BottomTabsExample {
  @State currentIndex: number = 0  // 当前选中索引

  build() {
    Tabs({ barPosition: BarPosition.End }) {  // 设置导航栏位置为底部
      TabContent() {
        Column() {
          // 轮播图区域
          Swiper() {
            ForEach([1, 2, 3, 4], (index: number) => {
              Image($r(`app.media.pic${index}`)) // 假设你有 banner1~4 的图片资源
                .width('100%')
                .height(200)
                .borderRadius(12)
                .objectFit(ImageFit.Cover)
            })
          }
          .height(200)
          .autoPlay(true) // 自动播放
          .interval(3000) // 每3秒切换
          .indicator(true) // 显示指示器
          .loop(true) // 循环播放
          .padding({ left: 16, right: 16, top: 16 })

          // 其他首页内容
          // Text('首页内容')
          //   .fontSize(30)
          //   .margin({ top: 20 })
          Column() {
            // 顶部标题栏
            // Text('发现')
            //   .fontSize(24)
            //   .fontWeight(FontWeight.Bold)
            //   .margin({ top: 20, bottom: 20 })
            //   .width('100%')
            //   .textAlign(TextAlign.Center)

            // 分类导航
            Row() {
              Text('推荐').margin({ right: 20 })
              Text('热门').margin({ right: 20 })
              Text('最新').margin({ right: 20 })
              Text('分类')
            }
            .width('100%')
            .padding({ left: 20, right: 20 })
            .margin({ top:20,bottom: 20 })

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
        .width('100%')
        .height('100%')
      }
      .tabBar('首页')

      TabContent() {
        Column() {
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
        .width('100%')
        .height('100%')
      }
      .tabBar('发现')

      TabContent() {
        Column() {
          Text('我的页内容')
            .fontSize(30)
        }
        .width('100%')
        .height('100%')
      }
      .tabBar('我的')
    }
    .barMode(BarMode.Fixed)  // 固定式导航栏
    .scrollable(false)       // 禁用滑动切换
    .onChange((index: number) => {
      this.currentIndex = index  // 监听页签切换
    })
  }
}