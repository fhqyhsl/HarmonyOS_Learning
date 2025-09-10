import { UserInfo } from "../model/UserInfo"

@Component

export struct UserProfile{
  @Prop userInfo:UserInfo
  build() {
    Column(){
      Image(this.userInfo.avatar)
        .width(80).height(80).borderRadius(40)
      Text(`姓名:${this.userInfo.name}`).fontSize(28)
      Text(`年龄:${this.userInfo.age}`).fontSize(26)
      if(this.userInfo.email){
        Text(`年龄:${this.userInfo.name}`).fontSize(26)
      }
      Button(this.userInfo.active?'禁用用户':'启用用户')
        .backgroundColor(this.userInfo.active ? '#f53f3f' : '#00b42a')
        .onClick(()=>{
          this.userInfo.active=!this.userInfo.active

        })
    }
  }
}

