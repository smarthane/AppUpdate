/**
 * @Author smarthane
 * @Date 2024/4/26
 * @Desc AppUpdateModel.ets
 */

/**
 * 弹窗样式
 */
export class AppUpdateDialogStyleModel {
  topBackgroundImage: ResourceStr = $r("app.media.ic_update_app_top_bg_default");
  confirmBackgroundColor: ResourceColor = '#E94339';
  confirmFontColor: ResourceColor = Color.White;
  confirmFontSize: Length = '18fp';
}

/**
 * 弹窗样式枚举
 */
export enum DialogStyleEnum {
  STYLE_DEFAULT = "style_default",
  STYLE_RED = "style_red",
  STYLE_BLUE = "style_blue",
  STYLE_DRAGON = "style_dragon",
  STYLE_LAMP = "style_lamp",
  STYLE_CANVAS = "style_canvas",
  // 自定义 替换元素图标样式
  STYLE_CUSTOM_NORMAL = "style_custom_normal",
  // 自定义 替换布局组件
  STYLE_CUSTOM_ALL = "style_custom_all",
}

/**
 * 自带弹窗样式
 */
export const DEFAULT_DIALOG_STYLE: Map<DialogStyleEnum, AppUpdateDialogStyleModel> = new Map<DialogStyleEnum, AppUpdateDialogStyleModel>([
  [DialogStyleEnum.STYLE_DEFAULT, {
    topBackgroundImage: $r("app.media.ic_update_app_top_bg_default"),
    confirmBackgroundColor: '#E94339',
    confirmFontColor: Color.White,
    confirmFontSize: '18fp'
  }],
  [DialogStyleEnum.STYLE_RED, {
    topBackgroundImage: $r("app.media.ic_update_app_top_bg_red"),
    confirmBackgroundColor: '#E939DC',
    confirmFontColor: Color.White,
    confirmFontSize: '18fp'
  }],
  [DialogStyleEnum.STYLE_BLUE, {
    topBackgroundImage: $r("app.media.ic_update_app_top_bg_blue"),
    confirmBackgroundColor: '#39C1E9',
    confirmFontColor: Color.White,
    confirmFontSize: '18fp'
  }],
  [DialogStyleEnum.STYLE_DRAGON, {
    topBackgroundImage: $r("app.media.ic_update_app_top_bg_dragon"),
    confirmBackgroundColor: '#505050',
    confirmFontColor: Color.White,
    confirmFontSize: '18fp'
  }],
  [DialogStyleEnum.STYLE_LAMP, {
    topBackgroundImage: $r("app.media.ic_update_app_top_bg_lamp"),
    confirmBackgroundColor: '#0756A5',
    confirmFontColor: Color.White,
    confirmFontSize: '18fp'
  }],
  [DialogStyleEnum.STYLE_CANVAS, {
    topBackgroundImage: $r("app.media.ic_update_app_top_bg_canvas"),
    confirmBackgroundColor: '#D6CE87',
    confirmFontColor: Color.White,
    confirmFontSize: '18fp'
  }],
]);

/**
 * 弹窗 Model
 */
export class AppUpdateDialogModel {
  // 标题
  title?: string | Resource = '';
  // 副标题
  subTitle?: string;
  // 升级内容
  content?: string | Resource = '';
  // 是否强制升级
  isForce?: boolean = false;
  // 跳转到应用市场的包名
  bundleName?: string = '';
  // 取消按钮回调
  cancel?: () => void;
  // 升级按钮回调
  confirm?: () => void;
  // 自定义View
  customView?: () => void;
  // 升级按钮名称
  confirmName?: string | Resource;
  // Dialog 样式
  dialogStyleEnum?: DialogStyleEnum;
  // 自定义样式
  customDialogStyle?: AppUpdateDialogStyleModel;
  // Dialog 位置
  alignment?: DialogAlignment;
  // 点击遮罩层是否关闭弹窗
  autoCancel?: boolean;
  // 是否显示文本内容过多时滚动条
  showScrollBar?: boolean;
  // 升级内容最大高度
  contentMaxHeight?: Length;
  // 升级内容每行高度
  contentLineHeight?: Length;
  // 升级内容文字大小
  contentFontSize?: Length;
  // 升级内容文字颜色
  contentFontColor?: ResourceColor;
  // 标题文字大小
  titleFontSize?: Length;
  // 标题文字颜色
  titleFontColor?: ResourceColor;
  // 副标题文字大小
  subTitleFontSize?: Length;
  // 副标题文字颜色
  subTitleFontColor?: ResourceColor;
}