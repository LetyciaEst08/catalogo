import 'package:flutter/material.dart';


class Catalogo03 extends StatefulWidget{
  const Catalogo03({super.key});



  @override
  State<StatefulWidget> createState() {
   return Estrutura();

}

}

class Estrutura extends State {
List<int> hoveredIndices = List<int>.generate(imagensComDescricoes.length, (index) => -1);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(280.0),
        child: Column(
            children: List.generate(imagensComDescricoes.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    buildImageRow(imagensComDescricoes[index], descricoes[index], index),
                    const SizedBox(height: 16.0),
                    ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }




  Widget buildImageRow(List<String> imagens, List<String> descricoes, int rowIndex) {
    assert(imagens.length == descricoes.length);

    double maxImageSize = 320.0;
    double horizontalSpacing = 16.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(imagens.length, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
          child: Container(
              width: maxImageSize,
              height: maxImageSize + 100,
              decoration: BoxDecoration(
                border: Border.all(color: hoveredIndices[rowIndex] == index ? Colors.black : Colors.transparent),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
               MouseRegion(
                  onEnter: (_) => setState(() => hoveredIndices[rowIndex] = index),
                  onExit: (_) => setState(() => hoveredIndices[rowIndex] = -1),
                  child: Image.asset(
                imagens[index],
                fit: BoxFit.contain, // Ajuste proporcional da imagem
                width: maxImageSize,
                height: maxImageSize,
                ),
               ),
              const SizedBox(height: 10),
              Text(
                descricoes[index],
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
        ),
      ),
     );
  }),
  ); 
}
}


List<List<String>> imagensComDescricoes = [
  ['imagens/mikrotik.jpeg', 'imagens/mikrotik01.jpeg', 'imagens/mikrotik02.jpeg'],
  ['imagens/mini.jpeg', 'imagens/mini01.jpeg', 'imagens/mini02.jpeg'],
  ['imagens/repetidor.jpeg', 'imagens/repetidor01.jpeg', 'imagens/repetidor02.jpeg'],
  ['imagens/switch.jpeg', 'imagens/switch01.jpeg', 'imagens/switch02.jpeg'],
  ['imagens/usb.jpeg', 'imagens/usb01.jpeg', 'imagens/usb02.jpeg'],
];

List<List<String>> descricoes = [
  ['Roteador Mikrotik Hex Router Board com Case RB750GR3 R\$439,00', 'Mikrotik Rb450g Routerboard R\$696,00', 'Access Point - Mikrotik RB941-2n R\$209,21'],
  ['Mini Adaptador Wifi Nano 2.4 Ghz R\$24,90', 'Adaptador USB wireless dual band R\$149,48', 'Adaptador Wireless 300MBPS R\$68,90'],
  ['D-Link Repetidor Wireless EXO MESH AC 1300Mbps Dualband R\$149,81', 'Homesen Amplif sinal WiFi 300M R\$62,00', 'Repetidor TP-Link Wire 300Mbps R\$ 123,41'],
  ['TP-Link TL-SG108 Switch Ggbit 8 P R\$360,28', 'Switch TP-Link 5 Portas TL-SF1005D Cor Branco disponivel R\$85,41', 'Switch TP-Link 8 Portas, Gigabit, 2 SFP, Gerenciável - TL-SG3210 R\$768,90'],
  ['Extensões Mini Hub USB, Expansor USB 3.0 de 4 portas, Hub USB 2.0 R\$28,00', 'Hub Usb 7 Portas 2.0 Hd Extensor Pen Drive Hd Tomate. Cores R\$29,90', 'Bright HUB USB 4 PORTAS 3.0 R\$55,30'],
];


