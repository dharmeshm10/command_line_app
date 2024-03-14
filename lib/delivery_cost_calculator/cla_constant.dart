/// Offer name [ Extensible & scalable ]
const String emptyString = '';
const String offer1 = 'OFR001';
const String offer2 = 'OFR002';
const String offer3 = 'OFR003';
const String notApplicable = 'NA';

/// Use below format for discountTable::
/*
  offer_name: {
    'distance_range_in_km': {
      'weight_range_in_kg': [first_parameter, last_parameter],
      },
   }

   :::For Example:::
   Example 1 ==>
   offer6: {
    '50-250': {
      '10-150': [10, 150],
      },
    }

    Example 2 ==>
    offer5: {
    '< 200': {
      '70-200': [70, 200],
      },
    }
  * */
const Map<String, Map<String, Map<String, List<int>>>> discountTable = {
  offer1: {
    '< 200': {
      '70-200': [70, 200], // 10% Discount
    },
  },
  offer2: {
    '50-150': {
      '100-250': [100, 250], // 7% Discount
    },
  },
  offer3: {
    '50-250': {
      '10-150': [10, 150], // 5% Discount
    },
  },
};

///  Set discount percentage as per given table
double getDiscountPercentage(String offerCode) {
  switch (offerCode) {
    case offer1:
      return 0.10;
    case offer2:
      return 0.07;
    case offer3:
      return 0.05;
    case notApplicable:
      return 0.0;
    default:
      return 0.0;
  }
}
