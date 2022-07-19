import 'package:flutter/material.dart';
import 'package:news_app/common/apis/apis.dart';
import 'package:news_app/common/entitys/entitys.dart';
import 'package:news_app/common/utils/utils.dart';
import 'package:news_app/common/values/values.dart';
import 'package:news_app/common/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // email 的控制组件
  final TextEditingController _emailController = TextEditingController();

  // 密码 的控制器
  final TextEditingController _passController = TextEditingController();

  // 跳转 注册页面
  _handleNavSignUp() {
    Navigator.pushNamed(
      context,
      "/sign-up",
    );
  }

  // 执行登录操作
  _handleSignIn() async {
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请正确输入邮件');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }

    UserRequestEntity params = UserRequestEntity(
      email: _emailController.value.text,
      password: duSHA256(_passController.value.text),
    );

    UserResponseEntity res = await UserAPI.login(params: params);

    // 写本地 access_token , 不写全局，业务：离线登录
    // 全局数据 gUser
  }

  // ------------------------------------------------------------

  // Logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(40 + 44.0)), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: duSetWidth(76),
            width: duSetWidth(76),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: duSetWidth(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: const [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(
                          Radius.circular(duSetWidth(76 * 0.5))), // 父容器的50%
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: duSetWidth(13),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      // height: 204,
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: IntrinsicHeight(
        child: Column(
          children: [
            // email input
            inputTextEdit(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              marginTop: 0,
            ),
            // password input
            inputTextEdit(
              controller: _passController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Password",
              isPassword: true,
            ),

            // 注册、登录 横向布局
            Container(
              height: duSetHeight(44),
              margin: EdgeInsets.only(top: duSetHeight(15)),
              child: Row(
                children: [
                  // 注册
                  btnFlatButtonWidget(
                    onPressed: _handleNavSignUp,
                    gbColor: AppColors.thirdElement,
                    title: "Sign up",
                  ),
                  const Spacer(),
                  // 登录
                  btnFlatButtonWidget(
                    onPressed:() => _handleSignIn(),
                    gbColor: AppColors.primaryElement,
                    title: "Sign in",
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Forgot password
            Container(
              height: duSetHeight(22),
              margin: EdgeInsets.only(top: duSetHeight(20)),
              child: FlatButton(
                onPressed: () => {},
                child: Text(
                  "Forgot password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.secondaryElementText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                    fontSize: duSetFontSize(16),
                    height: 1, // 设置下行高，否则字体下沉
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignUpButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleNavSignUp,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(),
            const Spacer(),
            _buildThirdPartyLogin(),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }
}
