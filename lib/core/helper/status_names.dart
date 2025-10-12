import 'package:food_delivery_front_end/core/constant/image.dart';

String getStatusName(int id) {
  switch (id) {
    case 1:
      return 'pending';
    case 2:
      return 'accepted';
    case 3:
      return 'rejected';
    case 4:
      return 'cancelled';
    case 5:
      return 'shipped';
    case 6:
      return 'delivered';
    case 7:
      return 'returned';
    case 8:
      return 'deleted';
    default:
      return 'unknown';
  }
}

String getStatusIcon(int id) {
  switch (id) {
    case 1:
      return AppIcons.time;
    case 2:
      return AppIcons.approved;
    case 3:
      return AppIcons.canscelOrderIcon;
    case 4:
      return AppIcons.canscelOrderIcon;
    case 5:
      return AppIcons.loadingTrolley;
    case 6:
      return AppIcons.delivered;
    case 7:
      return AppIcons.approved;
    case 8:
      return AppIcons.canscelOrderIcon;
    default:
      return AppIcons.time;
  }
}
