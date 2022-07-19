import 'package:flutter/material.dart';
import 'package:news_app/common/utils/utils.dart';
import 'package:news_app/common/values/values.dart';
import 'package:news_app/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // full name控制器
  final TextEditingController _fullNameController = TextEditingController();

  // Email 控制器
  final TextEditingController _emailController = TextEditingController();

  // password 控制
  final TextEditingController _passController = TextEditingController();

  // 返回上一页
  _handleNavPop() {
    Navigator.pop(context);
  }

  // 执行注册操作
  _handleSignUp() {
    if (!duCheckStringLength(_fullNameController.value.text, 5)) {
      toastInfo(msg: '用户名不能小于5位');
      return;
    }
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请正确输入邮件');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
  }

  // loge
  Widget _buildLoge() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: Text(
        'Sign up',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
          fontFamily: "Montserrat",
          fontSize: duSetFontSize(24.0),
          height: 1,
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49.0)),
      child: IntrinsicHeight(
        child: Column(
          children: [
            // FullName Input
            inputTextEdit(
              controller: _fullNameController,
              keyboardType: TextInputType.text,
              hintText: "Full name",
              marginTop: 0,
            ),
            // Email Input
            inputTextEdit(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
            ),
            // password Input
            inputTextEdit(
              controller: _passController,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'Password',
              isPassword: true,
            ),
            // 创建
            Container(
              height: duSetHeight(44),
              margin: EdgeInsets.only(top: duSetHeight(15)),
              child: btnFlatButtonWidget(
                onPressed: _handleSignUp,
                width: 295,
                fontWeight: FontWeight.w600,
                title: "Create an account",
              ),
            ),

            // forget password
            Container(
              height: duSetHeight(44.0),
              margin: EdgeInsets.only(top: duSetHeight(20.0)),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "By signing up you agree to our Terms and Conditions of Use",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryElementText,
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

  // 第三方
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetHeight(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          // title
          Text(
            'Or sign in with social networks',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),

          // 按钮button
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconFileName: "twitter",
                  width: 88,
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconFileName: "google",
                  width: 88,
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconFileName: "facebook",
                  width: 88,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleNavPop,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "I have an account",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 防止软键盘把下面挡住
      appBar: transparentAppBar(
        context: context,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '这是注册界面');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Divider(
              height: 1,
            ),
            _buildLoge(),
            _buildInputForm(),
            const Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
