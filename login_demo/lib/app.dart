import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'product_list_tab.dart';   // NEW
import 'search_tab.dart';         // NEW
import 'shopping_cart_tab.dart';  // NEW
import 'auth.dart';
import 'home_page.dart';

class CupertinoStoreApp extends StatefulWidget {
  CupertinoStoreApp({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState()=> new _CupertinoStoreHomePage();
  
 
}
enum AuthStatus {
  notSignedIn,
  signedIn
}

class _CupertinoStoreHomePage extends  State<CupertinoStoreApp> {
     AuthStatus authStatus = AuthStatus.notSignedIn;
   void _signedout(){
        setState(() {
         authStatus = AuthStatus.notSignedIn;
          });
    }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clear_circled),
            title: Text('Logout'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ProductListTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SearchTab(),
              );
            });
            break;
        
               case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ShoppingCartTab(),
              );
            });
            break;
              case 3:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomePage(auth:widget.auth,onSignedOut: _signedout,),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}