@Component
export struct BasicTextInput {
  // 用于存储输入框内容的状态变量
  @State inputValue: string = ''
  // 用于显示输入提示信息
  @State inputHint: string = '请输入内容...'
  // 记录输入长度
  @State inputLength: number = 0
  // 输入框是否获取焦点
  @State isFocused: boolean = false

  build() {
    Column({ space: 16 }) {
      // 基础输入框
      TextInput({
        placeholder: this.inputHint,  // 提示文本
        text: this.inputValue          // 绑定输入内容
      })
        // 输入框样式设置
        .width('90%')
        .height(48)
        .padding({ left: 16, right: 16 })
        .backgroundColor(this.isFocused ? '#F5F5F5' : '#FFFFFF')
        .border({ width: 1, radius: 8, color: this.isFocused ? '#007DFF' : '#DDDDDD' })
        .fontSize(16)

          // 输入事件：当输入内容变化时触发
        .onChange((value: string) => {
          this.inputValue = value
          this.inputLength = value.length
        })

          // 焦点事件：获取焦点时触发
        .onFocus(() => {
          this.isFocused = true
        })

          // 焦点事件：失去焦点时触发
        .onBlur(() => {
          this.isFocused = false
        })

      // 显示当前输入内容
      Text(`输入内容: ${this.inputValue || '无'}`)
        .fontSize(14)
        .fontColor('#666666')

      // 显示输入长度
      Text(`输入长度: ${this.inputLength}`)
        .fontSize(14)
        .fontColor('#666666')

      // 清除输入内容按钮
      Button('清空输入')
        .width(120)
        .height(40)
        .fontSize(14)
        .backgroundColor('#007DFF')
        .borderRadius(20)
        .onClick(() => {
          this.inputValue = ''
          this.inputLength = 0
        })
    }
    .width('100%')
    .padding(20)
    .backgroundColor('#F9F9F9')
  }
}
