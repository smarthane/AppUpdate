/**
 * @Author smarthane
 * @Date 2024/4/26
 * @Desc AppUpdateDialog.ets
 */
import type { common } from '@kit.AbilityKit';
import {
  AppUpdateDialogModel,
  AppUpdateDialogStyleModel,
  DEFAULT_DIALOG_STYLE,
  DialogStyleEnum
} from './AppUpdateModel';
import { AppUpdateHelper } from './AppUpdateHelper';

let dialogController: CustomDialogController | null
let isForce: boolean = false;
const uiContext = getContext(this) as common.UIAbilityContext

@Component
export struct AppUpdateComponent {

  show(model: AppUpdateDialogModel) {
    this.hide();
    dialogController = new CustomDialogController({
      builder: CustomAppUpdateDialog({
        options: model
      }),
      alignment: model.alignment || DialogAlignment.Center,
      customStyle: true,
      autoCancel: model.autoCancel || false
    });
    dialogController?.open();
    if (model.isForce !== undefined) {
      isForce = model.isForce;
    }
  }

  hide() {
    if (dialogController) {
      dialogController?.close();
      dialogController = null;
    }
  }

  onBackPress(): boolean | void {
    if (isForce) {
      return true;
    }
    return false;
  }

  build() {
  }
}

@Preview
@CustomDialog
struct CustomAppUpdateDialog {
  controller: CustomDialogController;
  dialogStyleModel: AppUpdateDialogStyleModel = DEFAULT_DIALOG_STYLE.get(DialogStyleEnum.STYLE_DEFAULT)!!;
  @Prop options: AppUpdateDialogModel;
  @BuilderParam customView?: CustomBuilder;

  aboutToAppear(): void {
    this.initDefaultParams();
  }

  initDefaultParams(): void {
    // 初始化相关参数
    if (this.options.dialogStyleEnum) {
      this.dialogStyleModel = DEFAULT_DIALOG_STYLE.get(this.options.dialogStyleEnum)!!;
    }
    // 自定义头部和按钮样式
    if (this.options.dialogStyleEnum == DialogStyleEnum.STYLE_CUSTOM_NORMAL
      && this.options.customDialogStyle !== undefined) {
      this.dialogStyleModel = this.options.customDialogStyle;
    }
    // 自定所有布局元素
    if (this.options.dialogStyleEnum == DialogStyleEnum.STYLE_CUSTOM_ALL
      && this.options.customView !== undefined) {
      this.customView = this.options.customView;
    }
    if (this.options.isForce === undefined) {
      this.options.isForce = false;
    }
    if (this.options.confirmName === undefined) {
      this.options.confirmName = $r('app.string.default_confirm_name');
    }
    if (this.options.showScrollBar === undefined) {
      this.options.showScrollBar = true;
    }
    if (this.options.titleFontSize === undefined) {
      this.options.titleFontSize = '17fp';
    }
    if (this.options.titleFontColor === undefined) {
      this.options.titleFontColor = Color.Black;
    }
    if (this.options.subTitleFontSize === undefined) {
      this.options.subTitleFontSize = '16fp';
    }
    if (this.options.subTitleFontColor === undefined) {
      this.options.subTitleFontColor = Color.Black;
    }
    if (this.options.contentFontSize === undefined) {
      this.options.contentFontSize = '15fp';
    }
    if (this.options.contentFontColor === undefined) {
      this.options.contentFontColor = Color.Black;
    }
    if (this.options.contentMaxHeight === undefined) {
      this.options.contentMaxHeight = '150vp';
    }
    if (this.options.contentLineHeight === undefined) {
      this.options.contentLineHeight = '20vp';
    }
  }

  build() {
    Column() {
      if (this.customView) {
        this.customView()
      } else {
        // 头部图片背景
        Image(this.dialogStyleModel.topBackgroundImage)
          .width('100%')
          .objectFit(ImageFit.Fill)

        // 中间文字内容
        Column({ space: '10vp' }) {
          Text(this.options.title)
            .fontSize(this.options.titleFontSize)
            .fontColor(this.options.titleFontColor)
            .textAlign(TextAlign.Start)
            .fontWeight(FontWeight.Bold)

          if (this.options.subTitle) {
            Text(this.options.subTitle)
              .fontSize(this.options.subTitleFontSize)
              .fontColor(this.options.subTitleFontColor)
              .textAlign(TextAlign.Start)
              .fontWeight(FontWeight.Regular)
          }

          Column() {
            Scroll() {
              Flex() {
                Text(this.options.content)
                  .fontSize(this.options.contentFontSize)
                  .fontColor(this.options.contentFontColor)
                  .textAlign(TextAlign.Start)
                  .lineHeight(this.options.contentLineHeight)
              }.width("100%")
            }.scrollBar(this.options.showScrollBar ? BarState.Auto : BarState.Off)
          }
          .width("100%")
          .constraintSize({
            maxHeight: this.options.contentMaxHeight
          })

          Button(this.options.confirmName, { type: ButtonType.Normal, stateEffect: true })
            .onClick(() => {
              AppUpdateHelper.jumpToStore(uiContext, this.options.bundleName);
              if (this.options.confirm) {
                this.options.confirm();
              }
              this.controller.close();
            })
            .backgroundColor(this.dialogStyleModel.confirmBackgroundColor)
            .fontColor(this.dialogStyleModel.confirmFontColor)
            .fontSize(this.dialogStyleModel.confirmFontSize)
            .width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .width('100%')
        .padding('18vp')
        .backgroundColor(Color.White)
        .margin({
          top: -5
        })
        .borderRadius('5vp')

        // 底部取消按钮
        if (!this.options.isForce) {
          Row()
            .width('2vp')
            .height('30vp')
            .backgroundColor(Color.White)

          Image($r("app.media.ic_update_app_close"))
            .width('35vp')
            .objectFit(ImageFit.Fill)
            .margin({
              top: -2
            })
            .onClick(() => {
              if (this.options.cancel) {
                this.options.cancel();
              }
              this.controller.close();
            })
        }
      }
    }
    .clip(true)
    .width('280vp')
    .borderRadius('5vp')
    .justifyContent(FlexAlign.Center)
  }
}