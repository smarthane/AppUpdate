/**
 * @Author smarthane
 * @Date 2024/4/26
 * @Desc AppUpdate.ets
 */
import bundleManager from '@ohos.bundle.bundleManager';
import { productViewManager } from '@kit.StoreKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import type { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AppUpdateComponent } from './AppUpdateDialog';
import { AppUpdateDialogModel } from './AppUpdateModel';

export class AppUpdateHelper {

  private static readonly TAG: string = 'AppUpdateHelper';
  private static mAppUpdateComponent?: AppUpdateComponent;

  /**
   * 显示升级弹窗
   * @param mModel
   */
  public static showDialog(mModel: AppUpdateDialogModel) {
    AppUpdateHelper.mAppUpdateComponent = new AppUpdateComponent();
    AppUpdateHelper.mAppUpdateComponent.show(mModel);
  }

  /**
   * 隐藏升级弹窗
   * @param mModel
   */
  public static hideDialog() {
    if (AppUpdateHelper.mAppUpdateComponent) {
      AppUpdateHelper.mAppUpdateComponent.hide();
    }
  }

  /**
   * 跳转到应用市场
   * @param uiContext
   * @param mBundleName 应用包名
   */
  public static jumpToStore(uiContext: common.UIAbilityContext, mBundleName?: string): void {
    if (mBundleName == undefined) {
      return;
    }
    const wantParam: Want = {
      parameters: {
        // 此处填入要加载的应用包名，例如： bundleName: "com.huawei.hmsapp.appgallery"
        bundleName: mBundleName
      }
    }
    const callback: productViewManager.ProductViewCallback = {
      onError: (error: BusinessError) => {
        hilog.error(0x0001, AppUpdateHelper.TAG, `jumpToAppStore loadService onError.  code is ${error.code}, message is ${error.message}`)
      }
    }
    productViewManager.loadProduct(uiContext, wantParam, callback);
  }

  /**
   * 获取 versionName
   * 标识向用户展示的应用版本号。取值为长度不超过127字节的字符串，仅由数字和点构成，推荐采用“A.B.C.D”四段式的形式。四段式推荐的含义如下所示。第一段：主版本号/Major，范围0~99，重大修改的版本，如实现新的大功能或重大变化。第二段：次版本号/Minor，范围0~99，表示实现较突出的特点，如新功能添加或大问题修复。第三段：特性版本号/Feature，范围0~99，标识规划的新版本特性。第四段：修订版本号/Patch，范围0~999，表示维护版本，如修复bug。
   * @returns
   */
  public static async getVersionName(): Promise<string> {
    try {
      let bundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      return bundleInfo.versionName;
    } catch (error) {
      hilog.error(0x0001, AppUpdateHelper.TAG, `getVersionName onError.  error is ${JSON.stringify(error)}`)
    }
    return "";
  }

  /**
   * 获取 versionCode
   * 标识应用的版本号，取值为小于2^31次方的正整数。此数字仅用于确定某个版本是否比另一个版本更新，数值越大表示版本越高。 开发者可以将该值设置为任何正整数，但是必须确保应用的新版本都使用比旧版本更大的值。
   */
  public static async getVersionCode(): Promise<string> {
    try {
      let bundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      return bundleInfo.versionCode.toString();
    } catch (error) {
      hilog.error(0x0001, AppUpdateHelper.TAG, `getVersionCode onError.  error is ${JSON.stringify(error)}`)
    }
    return "";
  }

}
