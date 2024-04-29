import { AppUpdateDialogModel, AppUpdateHelper, DialogStyleEnum } from '@smarthane/appupdate'
import promptAction from '@ohos.promptAction'
import { TitleBar } from '@smarthane/titlebar'
import { common } from '@kit.AbilityKit'

const uiContext = getContext(this) as common.UIAbilityContext

@Entry
@Component
struct Index {
  private mDefaultTitle: string = "是否升级到1.0.5版本";
  private mDefaultSubTitle: string = "新版本大小：6M";
  private mDefaultUpdateContent: string = "1.全新升级，让您的体验更上一层楼，尽在本次产品升级中。\n2.超越旧版，全新升级，为您带来更出色的体验。\n3.鸿蒙来了！“鸿”鹄志远，一举千里。承“蒙”厚爱，不负期待。\n4.每一次升级，都是对完美的追求。本次全新升级，更是如此。";
  private mModelList: Array<DialogItem> = [
    {
      /**************************简单调用方法**************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie'
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_2'),
      desc: '简单调用方法'
    },
    {
      /***************************强制升级*************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: true,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie'
      },
      /**********************************************************/
      image: $r('app.media.ic_screenshot_1'),
      desc: '强制升级'
    },
    {
      /***************************有副标题*************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 副标题
        subTitle: this.mDefaultSubTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: true,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie'
      },
      /**********************************************************/
      image: $r('app.media.ic_screenshot_3'),
      desc: '有副标题'
    },
    {
      /***************************点击取消、升级按钮回调*************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 副标题
        subTitle: this.mDefaultSubTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie',
        // 点击取消按钮回调
        cancel: () => {
          promptAction.showToast({
            message: "点击了取消按钮",
            duration: 2000
          })
        },
        // 点击升级按钮回调
        confirm: () => {
          promptAction.showToast({
            message: "点击了升级按钮",
            duration: 2000
          })
        }
      },
      /**********************************************************/
      image: $r('app.media.ic_screenshot_1'),
      desc: '取消升级回调方法'
    },
    {
      /***************************设置文本大小颜色*************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 副标题
        subTitle: this.mDefaultSubTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie',
        // 点击取消按钮回调
        cancel: () => {
          promptAction.showToast({
            message: "点击了取消按钮",
            duration: 2000
          })
        },
        // 点击升级按钮回调
        confirm: () => {
          promptAction.showToast({
            message: "点击了升级按钮",
            duration: 2000
          })
        },
        // 设置文本内容大小和颜色
        titleFontSize: '18fp',
        titleFontColor: Color.Green,
        subTitleFontSize: '10fp',
        subTitleFontColor: Color.Orange,
        contentFontSize: '20fp',
        contentFontColor: Color.Brown,
        // 替换升级按钮文字内容
        confirmName: '立即升级'
      },
      /**********************************************************/
      image: $r('app.media.ic_screenshot_5'),
      desc: '设置文本大小颜色'
    },
    {
      /***************************设置文本最大高度*************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 副标题
        subTitle: this.mDefaultSubTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie',
        // 点击取消按钮回调
        cancel: () => {
          promptAction.showToast({
            message: "点击了取消按钮",
            duration: 2000
          })
        },
        // 点击升级按钮回调
        confirm: () => {
          promptAction.showToast({
            message: "点击了升级按钮",
            duration: 2000
          })
        },
        // 设置文本内容大小和颜色
        titleFontSize: '18fp',
        titleFontColor: Color.Green,
        subTitleFontSize: '10fp',
        subTitleFontColor: Color.Orange,
        contentFontSize: '20fp',
        contentFontColor: Color.Brown,
        // 设置文本最大高度
        contentMaxHeight: '300vp'
      },
      /**********************************************************/
      image: $r('app.media.ic_screenshot_6'),
      desc: '设置文本最大高度'
    },
    {
      /**************************样式：STYLE_RED**************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie',
        dialogStyleEnum: DialogStyleEnum.STYLE_RED,
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_8'),
      desc: '样式:STYLE_RED'
    },
    {
      /**************************样式：STYLE_BLUE**************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie',
        dialogStyleEnum: DialogStyleEnum.STYLE_BLUE,
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_9'),
      desc: '样式:STYLE_BLUE'
    },
    {
      /**************************样式：STYLE_DRAGON**************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie',
        dialogStyleEnum: DialogStyleEnum.STYLE_DRAGON,
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_10'),
      desc: '样式:STYLE_DRAGON'
    },
    {
      /**************************样式：STYLE_LAMP**************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie',
        dialogStyleEnum: DialogStyleEnum.STYLE_LAMP,
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_11'),
      desc: '样式:STYLE_LAMP'
    },
    {
      /**************************样式：STYLE_CANVAS**************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie',
        dialogStyleEnum: DialogStyleEnum.STYLE_CANVAS,
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_12'),
      desc: '样式:STYLE_CANVAS'
    },
    {
      /**************************自定义样式**************************/
      // 升级弹窗模型
      model: {
        // 升级标题栏
        title: this.mDefaultTitle,
        // 副标题
        subTitle: this.mDefaultSubTitle,
        // 升级文案内容
        content: this.mDefaultUpdateContent,
        // 是否强制升级
        isForce: false,
        // 跳转到华为应用市场的包名，此处测试为华为视频的包名
        bundleName: 'com.huawei.hmsapp.himovie',
        dialogStyleEnum: DialogStyleEnum.STYLE_CUSTOM_NORMAL,
        customDialogStyle: {
          topBackgroundImage: $r("app.media.ic_update_app_top_bg_custom"),
          confirmBackgroundColor: '#ABABAB',
          confirmFontColor: Color.Blue,
          confirmFontSize: '20vp'
        }
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_13'),
      desc: '自定义样式'
    },
    {
      /**************************自定义布局组件**************************/
      // 升级弹窗模型
      model: {
        dialogStyleEnum: DialogStyleEnum.STYLE_CUSTOM_ALL,
        customView: () => {
          this.builderCustomUpdateView();
        }
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_14'),
      desc: '自定义布局组件'
    },
    {
      /**************************自定布局提示弹窗**************************/
      model: {
        dialogStyleEnum: DialogStyleEnum.STYLE_CUSTOM_ALL,
        customView: () => {
          this.builderCustomDialogTipView();
        }
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_15'),
      desc: '自定布局提示弹窗'
    },
    {
      /**************************自定布局输入弹窗**************************/
      model: {
        dialogStyleEnum: DialogStyleEnum.STYLE_CUSTOM_ALL,
        customView: () => {
          this.builderCustomDialogInputView();
        }
      },
      /***************************************************************/
      image: $r('app.media.ic_screenshot_16'),
      desc: '自定布局输入弹窗'
    }
  ];
  @State mTitleModel: TitleBar.Model = new TitleBar.Model()
    .setOnLeftClickListener(async () => {
      let a = await AppUpdateHelper.getVersionName();
      let b = await AppUpdateHelper.getVersionCode();
      promptAction.showToast({
        message: `点击了左边返回按钮${a}-${b}`,
        duration: 2000
      })
    })
    .setTitleName("应用版本升级弹窗")

  /**
   * 自定布局版本升级页面
   */
  @Builder
  builderCustomUpdateView() {
    Column() {
      Column({ space: '10vp' }) {
        Text(this.mDefaultTitle)
          .fontSize('15fp')
          .fontColor(Color.Black)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)

        Text(this.mDefaultSubTitle)
          .fontSize('15fp')
          .fontColor(Color.Black)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Regular)

        Column() {
          Scroll() {
            Flex() {
              Text(this.mDefaultUpdateContent)
                .fontSize('15fp')
                .fontColor(Color.Black)
                .textAlign(TextAlign.Start)
                .lineHeight('15vp')
            }.width("100%")
          }.scrollBar(BarState.Auto)
        }
        .width("100%")
        .constraintSize({
          maxHeight: '260vp'
        })

        Row() {
          Button('暂不升级', { type: ButtonType.Normal, stateEffect: true })
            .fontColor(Color.White)
            .fontSize('15fp')
            .backgroundColor('#dcdcdc')
            .width('50%')
            .onClick(() => {
              AppUpdateHelper.hideDialog();
            })
          Button('马上升级', { type: ButtonType.Normal, stateEffect: true })
            .fontColor(Color.White)
            .fontSize('15fp')
            .backgroundColor('#fff13737')
            .width('50%')
            .onClick(() => {
              AppUpdateHelper.jumpToStore(uiContext, 'com.huawei.hmsapp.himovie')
              AppUpdateHelper.hideDialog();
            })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width("100%")
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
      .padding('18vp')
      .backgroundColor(Color.White)
      .margin({
        top: -5
      })
      .borderRadius('5vp')
    }
    .width('100%')
    .backgroundColor(Color.White)
  }

  /**
   * 自定布局提示弹窗
   */
  @Builder
  builderCustomDialogTipView() {
    Column() {
      Column({ space: '10vp' }) {
        Text('这是提示标题')
          .fontSize('15fp')
          .fontColor(Color.Black)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)

        Text('这是提示的内容')
          .fontSize('15fp')
          .fontColor(Color.Black)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Regular)

        Row() {
          Button('取消', { type: ButtonType.Normal, stateEffect: true })
            .fontColor(Color.White)
            .fontSize('13fp')
            .width('50%')
            .backgroundColor('#dcdcdc')
            .onClick(() => {
              AppUpdateHelper.hideDialog();
            })
            .borderRadius({
              bottomLeft: '5vp',
            })
          Button('确定', { type: ButtonType.Normal, stateEffect: true })
            .fontColor(Color.White)
            .fontSize('13fp')
            .width('50%')
            .backgroundColor('#fff13737')
            .onClick(() => {
              AppUpdateHelper.hideDialog();
            })
            .borderRadius({
              bottomRight: '5vp'
            })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width("100%")
        .borderRadius({
          bottomLeft: '5vp',
          bottomRight: '5vp'
        })
      }
      .alignItems(HorizontalAlign.Center)
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius('5vp')
      .margin({
        top: '15vp'
      })
    }
    .width('80%')
    .borderRadius('5vp')
    .backgroundColor(Color.White)
  }

  /**
   * 自定布局输入弹窗
   */
  @Builder
  builderCustomDialogInputView() {
    Column() {
      Column({ space: '10vp' }) {
        Text('这是提示输入的标题')
          .fontSize('15fp')
          .fontColor(Color.Black)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)

        TextInput({ placeholder: '这是提示文本' })
          .fontSize('12fp')
          .fontColor(Color.Black)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Regular)
          .placeholderFont({
            size: '12fp'
          })
          .height('40vp')
          .margin({
            left: '5vp',
            right: '5vp'
          })
          .onChange((value: string) => {
            console.info(value);
          })
          .onFocus(() => {
            console.info('获取焦点');
          })

        Row() {
          Button('取消', { type: ButtonType.Normal, stateEffect: true })
            .fontColor(Color.White)
            .fontSize('13fp')
            .width('50%')
            .backgroundColor('#dcdcdc')
            .onClick(() => {
              AppUpdateHelper.hideDialog();
            })
            .borderRadius({
              bottomLeft: '5vp',
            })
          Button('确定', { type: ButtonType.Normal, stateEffect: true })
            .fontColor(Color.White)
            .fontSize('13fp')
            .width('50%')
            .backgroundColor('#fff13737')
            .onClick(() => {
              AppUpdateHelper.hideDialog();
            })
            .borderRadius({
              bottomRight: '5vp'
            })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width("100%")
        .borderRadius({
          bottomLeft: '5vp',
          bottomRight: '5vp'
        })
      }
      .alignItems(HorizontalAlign.Center)
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius('5vp')
      .margin({
        top: '15vp'
      })
    }
    .width('80%')
    .borderRadius('5vp')
    .backgroundColor(Color.White)
  }

  build() {
    Column() {
      TitleBar({ model: this.mTitleModel })
      List({ space: 12 }) {
        ForEach(this.mModelList, (item: DialogItem) => {
          ListItem() {
            Column({ space: 6 }) {
              Image(item.image)
                .objectFit(ImageFit.Fill)
                .height(260)
                .borderRadius({
                  topLeft: 5,
                  topRight: 5
                })
              Text(item.desc)
                .fontSize('10fp')
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.Black)
            }
            .backgroundColor('#CCCCCC')
            .borderRadius(5)
            .padding({
              bottom: 5
            })
            .margin(5)
          }
          .onClick(() => {
            AppUpdateHelper.showDialog(item.model!!)
          })
        })
      }
      .lanes(3)
      .layoutWeight(1)
      .margin({
        left: 15,
      })
      .scrollBar(BarState.Off)
      .height('100%')

      // Column() {
      //   Text("测试弹窗").onClick(() => {
      //     AppUpdateHelper.showDialog({
      //       dialogStyleEnum: DialogStyleEnum.STYLE_CUSTOM_ALL,
      //       customView: () => {
      //         this.builderCustomDialogInputView();
      //       }
      //     })
      //   })
      // }
      // .justifyContent(FlexAlign.Center)
      // .width('100%')
      // .height('100%')
    }
    .height('100%')
  }
}

class DialogItem {
  model?: AppUpdateDialogModel;
  image?: ResourceStr;
  desc?: string;
}