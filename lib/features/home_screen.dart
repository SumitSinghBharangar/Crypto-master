import 'dart:developer';

import 'package:binance/common/app_colors.dart';
import 'package:binance/common/app_images.dart';
import 'package:binance/common/models/coin_model.dart';
import 'package:binance/features/choose_crypto_screen.dart';
import 'package:binance/features/portfolio.dart';
import 'package:binance/features/services/home_provider.dart';
import 'package:binance/features/usermenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'balance.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTradeOpen = false;

  int selected = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).fetchCoins();
      Provider.of<HomeProvider>(context, listen: false).fetchApiData();
    });
  }

  Future<void> _onRefresh() async {
    // Call fetchData to refresh the data when pulled
    Provider.of<HomeProvider>(context, listen: false).fetchCoins();
    Provider.of<HomeProvider>(context, listen: false).fetchApiData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: AppColors.primaryColor,
      backgroundColor: Colors.white,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: selected == 0 ? _homeBody() : const PortFolio(),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(.2),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _item("Markets", AppImages.metrix, 0),
                        _item("Square", AppImages.square, 1),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 38),
                              Text(
                                "Trade",
                                style: TextStyle(
                                  fontFamily: "BinancePlex",
                                  fontSize: 10,
                                  height: 1,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _item("Discover", AppImages.discover, 2),
                        _item("Portfolio", AppImages.portfolio, 3),
                      ],
                    ),
                    SizedBox(height: MediaQuery.paddingOf(context).bottom),
                  ],
                ),
              ),
            ),
            if (isTradeOpen)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(.3),
                ),
              ),
            AnimatedPositioned(
              curve: Curves.fastEaseInToSlowEaseOut,
              bottom: isTradeOpen ? 0 : -400,
              left: 0,
              right: 0,
              duration: const Duration(milliseconds: 400),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/buy.png',
                            height: 45,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Buy",
                                style: TextStyle(
                                  color: AppColors.onSurface,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "BinancePlex",
                                ),
                              ),
                              const Text(
                                "Buy crypto with INR",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "BinancePlex",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () {
                        setState(() {
                          isTradeOpen = false;
                        });

                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const ChooseCryptoScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/sell.jpg',
                            height: 40,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sell",
                                style: TextStyle(
                                  color: AppColors.onSurface,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "BinancePlex",
                                ),
                              ),
                              const Text(
                                "Sell crypto with INR",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "BinancePlex",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () {
                        setState(() {
                          isTradeOpen = false;
                        });

                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const ChooseCryptoScreen()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/convert.png',
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Convert",
                                style: TextStyle(
                                  color: AppColors.onSurface,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "BinancePlex",
                                ),
                              ),
                              const Text(
                                "Trade with convert instantly",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "BinancePlex",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/download.png',
                            height: 45,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deposit",
                                style: TextStyle(
                                  color: AppColors.onSurface,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "BinancePlex",
                                ),
                              ),
                              const Text(
                                "Deposit with faith and crypto currency",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: "BinancePlex",
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.paddingOf(context).bottom + 100),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.paddingOf(context).bottom + 23),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isTradeOpen = !isTradeOpen;
                    });
                  },
                  child: AnimatedRotation(
                    turns: isTradeOpen ? 1 : 1.15,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.onSurface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isTradeOpen = !isTradeOpen;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.paddingOf(context).bottom + 23,
                  ),
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(12),
                  child: AnimatedCrossFade(
                    firstChild: Image.asset('assets/swap.png'),
                    secondChild: Image.asset('assets/cross.png'),
                    crossFadeState: !isTradeOpen
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _homeBody() {
    final apiProvider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: SliverAppBar(
                shadowColor: Colors.white,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 0,
                scrolledUnderElevation: 0,
                title: _appBar(),
                toolbarHeight: 120,
                leadingWidth: 0,
                leading: const SizedBox.shrink(),
              ),
            ),
            MediaQuery.removePadding(
              context: context,
              removeLeft: true,
              removeTop: true,
              child: SliverAppBar(
                shadowColor: Colors.white,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 0,
                scrolledUnderElevation: 0,
                pinned: true,
                title: _bottomAppBar(),
                toolbarHeight: 97,
                leadingWidth: 0,
                leading: const SizedBox.shrink(),
              ),
            )
          ];
        },
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          color: AppColors.primaryColor,
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: apiProvider.data.isEmpty
                    ? Center(
                        child: Image.asset(
                          "assets/loading.gif",
                          height: 50,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                          bottom: MediaQuery.paddingOf(context).bottom + 100,
                        ),
                        itemCount: apiProvider.data.length,
                        itemBuilder: (context, index) {
                          final item = apiProvider.data[index];

                          // CoinModel coin = value.coins![index];

                          return Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child:
                                      Image.asset("assets/icons/${item.image}"),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name ?? "",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    item.movement == "Up"
                                        ? "+${item.percentage}"
                                        : "-${item.percentage}",
                                    style: TextStyle(
                                      color: item.movement == "Up"
                                          ? Colors.green
                                          : Colors.red,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "\$${item.price}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _item(String title, String image, int index) {
    return Expanded(
      child: MaterialButton(
        highlightColor: Colors.white,
        splashColor: Colors.white,
        onPressed: () {
          setState(() {
            selected = index;
          });
        },
        child: Column(
          children: [
            Image.asset(
              image,
              width: 38,
              color:
                  selected == index ? AppColors.onSurface : Color(0xFF848E9C),
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: "BinancePlex",
                fontSize: 10,
                height: 1,
                color: selected == index
                    ? AppColors.onSurface
                    : Colors.grey.shade700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Column _appBar() {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const UserMenu(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      AppImages.brand,
                      color: AppColors.onSurface,
                      width: 18,
                    ),
                  ),
                ),
                const Spacer(),
                const Spacer(),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppSvg.search,
                      color: AppColors.onSurface,
                      width: 17,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AppImages.qr,
                    width: 15,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AppImages.pen,
                    width: 14,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                              color: AppColors.onSurface,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.visibility,
                            size: 14,
                            color: Color(0xFF848E9C),
                          )
                        ],
                      ),
                      const BalanceTextWidget(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.onSurface,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Add Funds",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 1.5,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.7),
          ),
        ),
      ],
    );
  }

  Column _bottomAppBar() {
    return Column(
      children: [
        Row(
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Text(
                "Watchlist",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: "BinancePlex"),
              ),
            ),
            const SizedBox(width: 10),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: const Text(
                "Coin",
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: "BinancePlex"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              _chip(text: "Hot", selected: true),
              _chip(text: "Market Cap"),
              _chip(text: "Price", hasArrow: true),
              _chip(text: "24H Change", hasArrow: true),
            ],
          ),
        ),
        // const SizedBox(height: 10),
      ],
    );
  }

  Container _chip({
    required String text,
    bool? selected,
    bool? hasArrow,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: (selected ?? false) ? Colors.grey.withOpacity(.2) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: (selected ?? false)
                    ? AppColors.onSurface
                    : Colors.grey.shade700.withOpacity(1),
                fontSize: 14,
              ),
            ),
            if (hasArrow ?? false) const SizedBox(width: 4),
            if (hasArrow ?? false)
              Image.asset(
                'assets/arrows.png',
                height: 12,
                color: Colors.grey.shade500,
              ),
          ],
        ),
      ),
    );
  }
}
