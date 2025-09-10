import { UserInfo } from "../model/UserInfo"
import { UserProfile } from "./UserProfile"
@Entry
@Component
export struct UserProfileList{
  @State userList:UserInfo[]=[
    {
      id:1,
      name:'张三111',
      age:18,
      avatar:$r('app.media.yf'),
      active:true
    },
    {
      id:2,
      name:'李四',
      age:20,
      avatar:$r('app.media.yf'),
      active:true
    },
    {
      id:3,
      name:'王五',
      age:32,
      avatar:$r('app.media.yf'),
      active:true
    },
  ]
  build() {
    Column(){
      List(){
        ForEach(this.userList,(user:UserInfo)=>{
          ListItem(){
            UserProfile({userInfo:user})
          }
          .padding(10)
        },(user:UserInfo)=>user.id.toString())
      }

    }
  }
}