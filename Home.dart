import 'package:flutter/material.dart';
import 'package:tab_bar/PrimeiraPagina.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin { // utilizar o singleticker para poder usar o vsync das tabs

  // aula de dart intermediário fala sobre o single ticker provider

  TabController _tabController; // cria o controlador das tabs

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3, // tamanho das tabs
      initialIndex: 0,
      vsync: this // gerencia o efeito de mudança da tela
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose(); // descarta o controlador quando não precisar mais usar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abas'),
        bottom: TabBar(
            controller: _tabController, // controlador das tabs
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
//                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.equalizer),
//                text: 'Conta',
              )
            ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            // ordem de execução do tabviewr

            // ao invés de passar o texto, pode instanciar as páginas através de outros arquivos dart
            PrimeiraPagina(),
            //Text('Primeira página'),
            Text('Segunda página'),
            Text('Terceira página')
          ],
      ),
    );
  }
}
