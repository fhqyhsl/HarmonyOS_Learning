@Entry
@Component
struct  ExplictAnimationPage{
  @State isMoved:boolean=false
  @State filledColor:string="#FF2F5D99"
  @State antColor:string="#FF2F5D99"
  @State Angle:number=0
  @State scaleValue: number = 1.0;
  build() {
    Navigation(){
      Column({space:16}){
        Text('显式动画演示')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
        Button('改变位置').onClick(()=>{
          this.isMoved=!this.isMoved
          this.filledColor = '#ff0000';
        })
        Circle({width:60,height:60})
          .fill("#ffa24f4f")
          .translate({x:this.isMoved?200:0,y:0})

          .animation({
            duration:1000,
          curve:Curve.Smooth
          })
        Rect({width:100,height:60})
          .fill(this.isMoved?this.filledColor:this.antColor)
          .translate({x:this.isMoved?100:0,y:0})
          .animation({
            duration:1000,
            curve:Curve.Smooth
          })
        Button('角度变化')
          .onClick(()=>{
            this.Angle=180
          })
          .margin(50)
          .rotate({angle:this.Angle})
          .animation({
            duration:1200,//动画时长
            curve:Curve.Friction,//阻尼动画
            delay:500,//延时
            iterations:-1,//-1表示无限循环
            playMode:PlayMode.Alternate,//播放方式，循环播放
            expectedFrameRateRange:{
              min:20,
              max:120,
              expected:90
            }
          })
        Text('呼吸灯效果')
        Text('❤')
          .fontSize(80)
          .scale({ x: this.scaleValue, y: this.scaleValue })
          .animation({ // 可选：用于初始过渡
            duration: 300,
            curve: Curve.EaseInOut,
            iterations:-1,//-1表示无限循环
            playMode:PlayMode.Alternate,//播放方式，循环播放
          })
      }
      .padding(16)
    }
    .title('显式动画')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(false)
    .navBarWidth('100%')
    .navBarPosition(NavBarPosition.Start)
    .onAppear(() => {
      this.startHeartbeat();
    })
  }
  private startHeartbeat() {
    animateTo({
      duration: 600,
      curve: Curve.EaseInOut,
      iterations: -1, // 无限循环
      playMode: PlayMode.Alternate, // 正反向交替
      onFinish: () => {
        this.scaleValue = this.scaleValue === 1.0 ? 1.2 : 1.0;
      }
    }, () => {
      this.scaleValue = 1.2;
    });
  }
}
