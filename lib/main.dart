
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,

      ),
      home: const MyHomePage(title: 'Outgram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.black87,
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 900.0,
                height: 600.0,
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 600.0,
                          padding: const EdgeInsets.all(16.0),
                          decoration:
                            const BoxDecoration(

                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.purple, Colors.deepPurpleAccent],

                              ),

                            ),
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 30.00,
                                      spreadRadius: 0.00,
                                      offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.blue, Colors.blueAccent],
                                  ),
                                ),
                                child:
                                  Container(
                                    width: 300.0,
                                    height: 300.0,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/1.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const ButtonLike(isLiked: false),
                                  CustomInkButton(
                                    onTap: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Agregado a favoritos'),
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    color: Colors.blue,
                                    icon: Icons.star,
                                    borderRadius_: 20,
                                    child: const Center(child: Text('Favoritos')),
                                  ),
                                  CustomInkButton(
                                    onTap: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Compartido'),
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    color: Colors.blue,
                                    icon: Icons.share,
                                    borderRadius_: 20,
                                    child: const Center(child: Text('Compartir')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                     Column(

                      children: [
                        Container(
                          alignment: Alignment.topCenter ,
                          width: 418.0,
                          height: 200.0,
                          padding: const EdgeInsets.all(16.0),
                          child:const Text(
                            'Editar publicación',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                           CustomInkButton(onTap:
                           (){
                             ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(
                                 content: Text('Eliminado'),
                                 duration: Duration(seconds: 1),
                               ),
                             );
                           }
                               , color:Colors.red
                               , icon:
                               Icons.delete
                               , borderRadius_: 20
                               , child: const Center(child: Text('Eliminar')),
                           ),
                            const SizedBox(height:50),
                            CustomInkButton(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Editado'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              color: Colors.blue,
                              icon: Icons.edit,
                              borderRadius_: 20,
                              child: const Center(child: Text('Editar')),
                            ),

                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CustomInkButton extends StatelessWidget {
  const CustomInkButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.icon,
    required this.borderRadius_,
    required this.child,
  });

  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final double borderRadius_;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 150.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius_)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            child,
          ],
        ),
      ),
    );
  }
}
class ButtonLike extends StatefulWidget {
  const ButtonLike({super.key, this.isLiked = false});

  final bool isLiked;

  @override
  State<ButtonLike> createState() => _ButtonLikeState();
}

class _ButtonLikeState extends State<ButtonLike> {
  late bool _isLiked;
  late String _initialText;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
    _initialText = _isLiked ? "Unlike" : "Like";
  }

  @override
  Widget build(BuildContext context) {
    return CustomInkButton(
      onTap: () {
        setState(() {
          _isLiked = !_isLiked;
          _initialText = _isLiked ? "Unlike" : "Like";
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isLiked ? "Te ah gustado" : "No te ah gustado"),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      color: Colors.blue,
      icon: _isLiked ? Icons.favorite : Icons.favorite_border,
      borderRadius_: 20.0,
      child: Text(_initialText),
    );
  }
}
