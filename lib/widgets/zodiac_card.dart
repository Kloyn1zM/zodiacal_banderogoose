import 'package:flutter/material.dart';
import '../models/zodiac_sign.dart';

class ZodiacCard extends StatelessWidget {
  final ZodiacSign sign;

  const ZodiacCard({Key? key, required this.sign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              sign.imageAsset,
              fit: BoxFit.contain,
              width: 112,
              height: 112,
            ),
          ),
          SizedBox(height: 4),
          Text(
            sign.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            sign.dateRange,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
