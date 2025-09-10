@Component
@Entry
@Preview
export  struct MyButton{
  @Prop buttonText: string="主要按钮"
  MainColor: string = '#e63946'  // 红色
  build() {
    Row({space:10}){
      Button(this.buttonText)
        .type(ButtonType.Normal)
        .backgroundColor(this.MainColor)


    }
  }
}