//导入 MyButton 组件
import { MyButton } from '../components/MyButton'
import { MyInfo } from '../components/MyInfo'
import {UserProfile}from '../components/UserProfile'
import {UserProfileList} from '../components/UserProfileList'
import {BasicTextInput} from '../components/BasicTextInput'
import {UserCard} from '../components/ComponentExample'
import {ButtonPreview} from '../components/PreviewExample'

import router from '@ohos.router';

@Entry
@Component
struct Index {
  @Prop isOnline: boolean=true;
  // @Prop customMainText: string = "自定义主要按钮"
  // customSecondaryColor: string = '#fb8500'  // 橙色
  @Prop newName: string = "杨凡1111"
  build() {
    Column({space:20}){
      // BasicTextInput()
      // UserCard()
      // ButtonPreview()
      // Text(this.isOnline?"在线":"离线")
      // MyButton({buttonText:this.customMainText,MainColor:this.customSecondaryColor})
      // 传入自定义信息的卡片
      // MyInfo({
      //   name: this.newName,
      //
      //   avatar: "https://public-cdn-oss.mosoteach.cn/avatar/2022/A0/28865c793f80fdfa5e327960961d20c8.jpg?v=1725255800&x-oss-process=style/s300x300",
      //
      // })
      // UserProfile()
      // UserProfileList()
      // BasicTextInput()
      // 内容区域

      Flex({ justifyContent: FlexAlign.SpaceAround }) {

        Button('设置页').onClick(() => router.pushUrl({ url: 'pages/SettingsPage' }))
        Button('用户列表').onClick(() => router.pushUrl({ url: 'components/UserProfileList' }))
        Button('个人信息').onClick(() => router.pushUrl({ url: 'components/MyInfo' }))
        Button('按钮例子').onClick(() => router.pushUrl({ url: 'components/MyButton' }))
      }.width('100%').padding(5)
    }
  }
}
