import { UserInfo } from "../model/UserInfo"

@Component
export struct MyCounter{
  @State count:number=0
  @State isLoading:boolean=false
  @State userInfo:UserInfo= {
    name: '张三',
    age: 18,
    id: 0,
    avatar:$r('app.media.startIcon'),
    active: false
  }
  build() {
  }
}