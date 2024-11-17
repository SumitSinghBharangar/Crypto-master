import 'package:binance/common/app_colors.dart';
import 'package:binance/common/app_images.dart';
import 'package:binance/common/models/coin_model.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: Colors.blue,
        backgroundColor: Colors.white,
        child: Stack(
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
              bottom: isTradeOpen ? 0 : -350,
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
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 30),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () {
                        // setState(() {
                        //   isTradeOpen = false;
                        // });

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => const FormScreen(),
                        //   ),
                        // );
                      },
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
                toolbarHeight: 161,
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
        body: Column(
          children: [
            Expanded(
              child: Consumer<HomeProvider>(
                builder: (context, value, child) {
                  if (value.coins == null) {
                    return const SizedBox.shrink();
                  } else {
                    return ListView.separated(
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
                            // Container(
                            //   width: 32,
                            //   height: 32,
                            //   decoration: const BoxDecoration(
                            //     shape: BoxShape.circle,
                            //   ),
                            //   child: coin.iconUrl
                            //           .split('.')
                            //           .last
                            //           .toLowerCase()
                            //           .contains('svg')
                            //       ? Center(
                            //           child: SvgPicture.network(
                            //             coin.iconUrl,
                            //             height: 32,
                            //           ),
                            //         )
                            //       : Center(
                            //           child: Image.network(
                            //             coin.iconUrl,
                            //             height: 32,
                            //           ),
                            //         ),
                            // ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name ?? "",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Text(
                                  //   coin.symbol,
                                  //   style: const TextStyle(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
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
                                  // coin.change.contains('-')
                                  //     ? coin.change
                                  //     : ("+${coin.change}"),
                                  style: TextStyle(
                                    color: item.movement == "Up"
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text("\$ ${item.price}"),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
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
              color: selected == index
                  ? AppColors.onSurface
                  : Colors.grey.shade500,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Row(
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
                        width: 28,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppSvg.search,
                      color: AppColors.onSurface,
                      width: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      AppImages.qr,
                      width: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      AppImages.pen,
                      width: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
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
                              color: Colors.grey,
                            )
                          ],
                        ),
                        BalanceTextWidget(),
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
                          child: const Text("Add Funds"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 1,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
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
                    fontSize: 18,
                    color: Colors.black.withOpacity(.4),
                    fontWeight: FontWeight.bold,
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
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
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
        const SizedBox(height: 10),
      ],
    );
  }

  Container _chip({
    required String text,
    bool? selected,
    bool? hasArrow,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 2,
        bottom: 2,
      ),
      decoration: BoxDecoration(
        color: (selected ?? false) ? Colors.grey.withOpacity(.2) : null,
        borderRadius: BorderRadius.circular(10),
      ),
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
    );
  }
}
