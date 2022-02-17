import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
        screen: DraggableScrollableSheet(
          initialChildSize: 0.9,
          builder: (_, controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
            ),
            child: ListView(
              controller: controller,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 24.h,
                    left: 8.w,
                    right: 8.w,
                  ),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Icon(Icons.close),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Text(
                  '11 Oct 2021',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'The Nostalgia And Beauty Of Vintage Camper Van Cafes',
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ),
                  child: Image.asset(
                    Assets.coffeeCars,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  """lose your eyes and picture the gentle metallic curves of an Airstream trailer or the classic rectangular outline of a VW bus. Now turn it into a cafe.If only vintage camper build-outs were that simple.Vintage campers—a phrase with a hotly debated definition—aren’t admired solely for their build or design. Instead, they’re tied to a lifestyle that harkens to a mid-century Americana dream of open, dirt roads and obligation-free travels. “From the cars and trailers to the music and culture, they call them the good old days for a reason,” writes the Vintage Camper Trailers Magazine event page.“The thing about the vintage campers—the nostalgia involved in them and the appearance, the look, brings back a lot of memories for people, then it draws them to what you"re doing,” says Terry Ziniewicz, founder of Caffewerks, a company that designs parts for and consults with mobile coffee setups. “It inspires people to become customers of that stand because it's got this unique look.”""",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 25.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ),
                  child: Image.asset(
                    Assets.coffeeCars,
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Text(
                  'Extension Note',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "Nostalgia is a powerful marketing tool. Sounds, smells, and visuals from childhood elicit immediate emotions and memories. At one of my first cupping sessions, I was told not to talk about memory-induced flavors. Yes, that coffee might taste like your grandmother’s bone broth but no one else will know what you’re talking about.Psychology research divides nostalgia into two kinds: personal and historical. Personal nostalgia is the kind where you remember how you were and historical is the type that references a time before you were born. While the vintage camper community was kept alive by personal nostalgia, the branching of the campers into retail fronts is maintained by historical nostalgia.As someone who did not grow up hearing about their grandparents’ hippie travels or have any restored furniture inside the home, I am either the best or worst person to write this piece. Recognizing my limitations, I am not going to attempt to describe the historical intricacies of various models or fake an understanding of van life.",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
        ));
  }
}
