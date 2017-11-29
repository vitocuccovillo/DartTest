import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'model.dart';

CanvasElement cntx = document.querySelector("#canvas");
CanvasRenderingContext2D cnvs = cntx.getContext('2d');
List fileNames = new List();
String directory_JSON = "data/";
var url = directory_JSON + "listMonthsJSON.json";
List<Giornata> giornate = new List<Giornata>();

void main() {
  querySelector('#output').text = 'Your Dart app is running.';

  loadData();
  // x y width height linewidth maxheight



  /*BarraIstogramma br1 = new BarraIstogramma(10, 100, 100, 50, 100, 20);
  br1.color = "blue";
  disegnaBarraIstogramma(cnvs, br1);

  BarraIstogramma br2 = new BarraIstogramma(115, 100, 30, 30, 100, 20);
  br2.color = "red";
  disegnaBarraIstogramma(cnvs, br2);

  BarraIstogramma br3 = new BarraIstogramma(220, 100, 30, 80, 100, 20);
  br3.color = "green";
  disegnaBarraIstogramma(cnvs, br3);

  disegnaScritta("normal italic 30px arial","Istogrammi", 130, 120, "black");*/
  cntx.onClick.listen((e) {
      print("cliccato");
  });
}

void disegnaBarraIstogramma(CanvasRenderingContext2D context, BarraIstogramma barra) {

  int displ = barra.y + (barra.maxAltezza - barra.height) - barra.maxAltezza; // disegna la barra allineata in basso
  context
    ..beginPath()
    ..strokeStyle = barra.color
    ..fillStyle = barra.color
    ..rect(barra.x, displ, barra.lineWidth, barra.height)
    ..closePath()
    ..fill();
}

void disegnaScritta(String font, String text, int from, int to, String color) {

  cnvs
    ..font = font
    ..fillStyle = color
    ..lineWidth = 20
    ..strokeStyle = color
    ..fillText(text, from, to);
}

void loadData() {
  HttpRequest.getString(url).then(getFileNames_Dropdown);
}

void getFileNames_Dropdown(String jsonString) {

    Map fileData = JSON.decode(jsonString);
    fileNames = fileData['files'];

    int itemSelected = 1;
    if (itemSelected == 0) {
      // tutti i mesi
      fileNames = new List();
      giornate = new List<Giornata>();
      var request = HttpRequest.getString(url).then(onDataLoaded_allMonths);
    }
    var request = HttpRequest
        .getString(directory_JSON + fileNames[itemSelected - 1]['name'])
        .then(onDataLoaded);
    var request1 = HttpRequest.getString(url).then(onDataLoaded_allMonths);
}

// molto specifico, potrebbe comportare problemi per dati che non hanno fascia oraria
// cercare un'altra soluzione
FasceOrarie associaFascia(String valore) {
  switch (valore) {
    case "0-5":
      return FasceOrarie.notte;
    case "6-11":
      return FasceOrarie.mattina;
    case "12-17":
      return FasceOrarie.pranzo;
    case "18-23":
      return FasceOrarie.pomeriggio;
  }
}

onDataLoaded_allMonths(String jsonString) async {
  Map fileData = JSON.decode(jsonString);
  fileNames = fileData['files'];

  ///Variabile num_mesi, numemo di mesi caricati e da stampare in "disegnaTratte"
  int numMesi = fileNames.length;
  //cntx.height = canvHeight * numMesi;

  // ciclo sui mesi
  for (int counter = 0; counter < fileNames.length; counter++) {
    var JSONdirMonth = directory_JSON + fileNames[counter]['name'];
    String JSONfile = await getString(JSONdirMonth);
    Map dataFile = JSON.decode(JSONfile);
    List giorniFile = dataFile['autostrada'];
    // ciclo sui giorni
    for (int i = 0; i < giorniFile.length; i++) {
      List fasceFile = giorniFile[i]['hours'];
      List<Fascia> fasceGiornata = new List<Fascia>();

      // ciclo su singole fasce orarie
      fasceFile.forEach((fascia) {
        List edgesFascia = fascia['edges'];
        FasceOrarie fasciaGiorno = associaFascia(fascia['hour']);

        List<Edge> edgesInHour = new List<Edge>();
        edgesFascia.forEach((edge) {
          edgesInHour.add(new Edge(
              int.parse(edge['from'].toString()),
              int.parse(edge['to'].toString()),
              int.parse(edge['plates'].toString())));
        });
        fasceGiornata.add(new Fascia(edgesInHour, fasciaGiorno));
      });

      //aggiungo data
      List<String> datedata = giorniFile[i]['day'].split("-");
      Giornata giornata = new Giornata(
          fasceGiornata,
          new DateTime(int.parse(datedata[2]), int.parse(datedata[1]),
              int.parse(datedata[0])));
      giornate.add(giornata);
    }
  }
  print("Giornate caricate: " + giornate.length.toString());
  var passaggi = 0;
  giornate.forEach((giorno) {
    giorno.fasce.forEach((fascia) {
      passaggi += fascia.edges.length;
    });
  });
  print("numero passaggi totali: $passaggi");

}

void onDataLoaded(String jsonString) {
  //caricamento dati da JSON
  //cntx.height = canvHeight;

  Map dataFile = JSON.decode(jsonString);
  List giorni = dataFile['autostrada'];

  List<Giornata> giornate = new List<Giornata>();

  //ciclo sui giorni
  for (int i = 0; i < giorni.length; i++) {
    List fasce = giorni[i]['hours'];
    List<Fascia> fasceGiornata = new List<Fascia>();

    // ciclo su singole fasce orarie
    fasce.forEach((fascia) {
      List edgesFascia = fascia['edges'];
      FasceOrarie fasciaGiorno = associaFascia(fascia['hour']);
      List<Edge> edgesInHour = new List<Edge>();
      edgesFascia.forEach((edge) {
        edgesInHour.add(new Edge(
            int.parse(edge['from'].toString()),
            int.parse(edge['to'].toString()),
            int.parse(edge['plates'].toString())));
      });
      fasceGiornata.add(new Fascia(edgesInHour, fasciaGiorno));
    });

    //aggiungo data
    List<String> datedata = giorni[i]['day'].split("-");
    Giornata giornata = new Giornata(
        fasceGiornata,
        new DateTime(int.parse(datedata[2]), int.parse(datedata[1]),
            int.parse(datedata[0])));
    giornate.add(giornata);
  }

  int offset = 12;

  for (int i = 0; i<giornate.length;i++) {

    BarraIstogramma br1 = new BarraIstogramma(offset + 10, 100, 50, giornate[i].numEdges(), 70, 20);
    br1.color = "blue";
    disegnaBarraIstogramma(cnvs, br1);
    disegnaScritta("normal italic 10px arial",giornate[i].day.toString().substring(0,10), offset + 10 , 110, "black");
    offset += 100;
  }

  print("Giornate caricate: " + giornate.length.toString());
  var passaggi = 0;
  giornate.forEach((giorno) {
    giorno.fasce.forEach((fascia) {
      passaggi += fascia.edges.length;
    });
  });
  print("numero passaggi totali: $passaggi");

}


Future<String> getString(String stringJSON) async {
  HttpRequest request = new HttpRequest();
  request
    ..open('Get', stringJSON)
    ..setRequestHeader('String', 'json')
    ..send('');
  await request.onLoadEnd.first;
  return request.responseText;
}

class BarraIstogramma {
  String color;
  int x;
  int y;
  int width;
  int height;
  int lineWidth;
  int maxAltezza;

  BarraIstogramma(int moveTo_from, int moveTo_to, int lineTo_from,
      int lineTo_to, int lineWidth, int maxAltezza) {
    this.x = moveTo_from;
    this.y = moveTo_to;
    this.width = lineTo_from;
    this.height = lineTo_to;
    this.lineWidth = lineWidth;
    this.maxAltezza = maxAltezza;
  }

  setColor(String c) {
    this.color = c;
  }

  toString() {
    return "x: " + x.toString() + " y: " + y.toString() + " width: " +
        width.toString() + " height: " + height.toString() + " lineWidth: " +
        lineWidth.toString();
  }
}