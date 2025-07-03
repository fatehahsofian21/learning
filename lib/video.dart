import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'process.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  Timer? _loadTimeoutTimer;

  @override
  void initState() {
    super.initState();

    // Set a 30-second timeout
    _loadTimeoutTimer = Timer(const Duration(seconds: 30), () {
      if (!_isInitialized) {
        _showFallbackDialog();
      }
    });

    // Debug: Check if asset exists
    rootBundle.load('assets/video.mp4').then((_) {
      debugPrint('✅ video.mp4 found in assets');
    }).catchError((e) {
      debugPrint('❌ Error loading video.mp4: $e');
    });

    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then((_) {
        debugPrint('✅ Video initialized');
        _loadTimeoutTimer?.cancel();
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
        _controller.setLooping(true);
      }).catchError((e) {
        debugPrint('❌ Failed to initialize video: $e');
        _showFallbackDialog();
      });
  }

  void _showFallbackDialog() {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Video Failed to Load'),
          content: const Text(
              'It’s taking too long to load the video. You can watch it directly on Google Drive.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _openDriveLink();
              },
              child: const Text('Open Link'),
            ),
          ],
        ),
      );
    }
  }

  void _openDriveLink() async {
    const driveUrl =
        'https://drive.google.com/drive/folders/1SqkSWoenYUpRd-_Omz5NAThS1xazYnZo?usp=sharing';
    if (await canLaunchUrl(Uri.parse(driveUrl))) {
      await launchUrl(Uri.parse(driveUrl), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the Google Drive link.')),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _loadTimeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Tutorial'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(color: Colors.indigo),
                        SizedBox(height: 12),
                        Text("Loading video..."),
                      ],
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  _controller.pause(); // Stop video
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProcessScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _isInitialized
          ? FloatingActionButton(
              backgroundColor: Colors.indigo,
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
    );
  }
}
