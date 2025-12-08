import 'package:flutter/material.dart';
import 'home_screen.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Status'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order #12345',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Estimated Delivery: 25 mins',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            _buildStatusStep(context, 'Order Placed', true, true),
            _buildStatusStep(context, 'Preparing', true, true),
            _buildStatusStep(context, 'On the way', true, false),
            _buildStatusStep(context, 'Delivered', false, false),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false,
                  );
                },
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStep(
    BuildContext context,
    String title,
    bool isActive,
    bool isCompleted,
  ) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Row(
          children: [
            Column(
              children: [
                Transform.scale(
                  scale: isActive ? value : 1.0,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCompleted
                          ? Theme.of(context).primaryColor
                          : (isActive
                                ? Theme.of(
                                    context,
                                  ).primaryColor.withValues(alpha: 0.5)
                                : Colors.grey[300]),
                      border: Border.all(
                        color: isActive
                            ? Theme.of(context).primaryColor
                            : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: isCompleted
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                  ),
                ),
                if (title != 'Delivered')
                  Container(
                    width: 2,
                    height: 40,
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 2,
                      height: 40 * (isCompleted ? value : 0.0),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Opacity(
                opacity: isActive ? value : 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isActive ? Colors.black : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 40), // Match the line height
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
