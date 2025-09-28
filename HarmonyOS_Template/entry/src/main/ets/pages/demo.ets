// entry/src/main/ets/pages/DiscoverPage.ets
import router from '@ohos.router';
import { BottomBar } from '../components/BottomBar';

@Entry
@Component
struct DiscoverPage {
  /* 生命周期预留 */
  onPageShow(): void {
    console.info('DiscoverPage onPageShow');
  }

  build() {
    Column() {
      Column() {                 // ① 主体区
        this.TitleBar()
        this.SearchInput()
        this.CategoryRow()
        this.ContentList()
      }
      .layoutWeight(1)          // 占剩余全部高度
      .width('100%')
      .backgroundColor('#FFFFFF')

      BottomBar({               // ② 底部栏
        currentIndex: 1,
        onTabSelected: (idx: number): void => this.switchTab(idx)
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  /* ---------------- 以下为拆分组件，方便维护 ---------------- */
  @Builder
  TitleBar() {
    Text('发现')
      .fontSize(24)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .textAlign(TextAlign.Center)
      .padding({ top: 16, bottom: 12 })
  }

  @Builder
  SearchInput() {
    TextInput({ placeholder: '搜索内容...' })
      .width('90%')
      .height(40)
      .backgroundColor('#F5F5F5')
      .borderRadius(20)
      .padding({ left: 15, right: 15 })
      .margin({ bottom: 16 })
  }

  @Builder
  CategoryRow() {
    Row() {
      ForEach(['推荐', '热门', '最新', '分类'], (txt: string) => {
        Text(txt)
          .fontSize(14)
          .fontColor('#007DFF')
          .margin({ right: 20 })
      })
    }
    .width('100%')
    .padding({ left: 20 })
    .margin({ bottom: 16 })
  }

  @Builder
  ContentList() {
    List({ space: 10 }) {
      ForEach([1, 2, 3, 4, 5], (item: number) => {
        ListItem() {
          Column() {
            // 占位图
            Stack()
              .width('100%')
              .height(120)
              .backgroundColor('#F5F5F5')
              .borderRadius(8)

            // 标题
            Text(`标题占位 ${item}`)
              .fontSize(16)
              .width('100%')
              .margin({ top: 8 })

            // 副标题
            Text('副标题占位')
              .fontSize(12)
              .opacity(0.6)
              .width('100%')
              .margin({ top: 4 })
          }
          .padding(10)
        }
      })
    }
    .layoutWeight(1) // 占剩余全部高度
    .width('100%')
  }

  /* ---------------- 路由切换 ---------------- */
  private switchTab(idx: number) {
    const pages = ['pages/IndexPage', 'pages/DiscoverPage', 'pages/ProfilePage'];
    const target = pages[idx];
    // 防止重复跳当前页
    if (router.getState().path !== `/${target}`) {
      router.replaceUrl({ url: target });
    }
  }
}