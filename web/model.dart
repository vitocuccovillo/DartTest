library autostrada;

enum WeekDays{
  Lunedi,
  Martedi,
  Mercoledi,
  Givoedi,
  Venerdi,
  Sabato,
  Domenica
}
enum FasceOrarie{
  notte,       // 0-5
  mattina,    // 6-11
  pranzo,     // 12-17
  pomeriggio // 18-23
}

class Fascia {
  FasceOrarie fascia;
  List<Edge> edges;

  Fascia (List<Edge> nuoviEdge, FasceOrarie nuovaFascia){
    edges = nuoviEdge;
    fascia = nuovaFascia;
  }
}

class Edge {
  int from;
  int to;
  int plates;

  // visual info
  bool highlighted = false;
  bool selected = false;
//  bool filtered = false;
//  bool visible = true;

  Edge(int fr, int t, int pl) {
    from = fr; to = t; plates = pl;
  }

  String getInfo() {
    return "Edge: $from $to ($plates)";
  }
}

class Giornata {
  DateTime day;
  List<Fascia> fasce;

  Giornata(List<Fascia> nuoveFasce, DateTime date) {
    fasce = nuoveFasce;
    day = date;
  }

  int numPlates(int from, int to){
    int numPlates=0;
    fasce.forEach((fasciaOraria) {
      fasciaOraria.edges.forEach((edge) {
        if(edge.from==from && edge.to==to)
          numPlates+=edge.plates;
      });
    });
    return numPlates;
  }

  /*int maxPassaggi(){
    int maxPassaggi=0;
    fasce.forEach((fasciaOraria) {
      fasciaOraria.edges.forEach((edge) {
        int numPlate=numPlates(edge.from, edge.to);
        if (maxPassaggi < numPlate) maxPassaggi = numPlate;
      });
    });
    return maxPassaggi;
  }*/

  //operazione per il test della barra dei plates totali giornalieri
  String plates(int from, int to){
    String plates='';
    fasce.forEach((fasciaOraria) {
      plates+=fasciaOraria.fascia.toString()+":";
      fasciaOraria.edges.forEach((edge) {
        if(edge.from==from && edge.to==to)
          plates+=edge.plates.toString()+"\t";
      });
    });
    return plates;
  }

  int numEdges(){
    int nArchi = 0;
    fasce.forEach((fascia){
      nArchi += fascia.edges.length;
    });
    return nArchi;
  }

  bool is_month_6_weeks(int firstWeekDayOfMonth){
    if(firstWeekDayOfMonth>5)
      return true;
    else return false;
  }

  String getInfo() {
    return "Day: $day, number of edges: " + numEdges().toString();
  }
}

class Autostrada {
  List<Giornata> giornate;
  int numGates;
  List<int> gates_from;
  List <int> gate_num=[22,1,12,25,20,2,16,4,28,21,27,9,26,10,18,23,15,5,8,3,13,
      7,6,14,24,17,11,19]; //TODO: riempire dinamicamente la lista

  Autostrada(List<Giornata> giornate, int numGates) {
    this.giornate = giornate;
    this.numGates = numGates;
    this.gates_from = new List<int>();
    gates_disgiunti();
  }

  int maxPassaggi(){
    int maxPassaggi=0;
    giornate.forEach((giornata){
      giornata.fasce.forEach((fascia) {
        fascia.edges.forEach((edge) {
          if (maxPassaggi < edge.plates) maxPassaggi = edge.plates;
        });
      });
    });
    return maxPassaggi;
  }

  int maxPassaggiGiornata(){
    int maxPassaggi=0;
    giornate.forEach((giornata){
      giornata.fasce.forEach((fascia){
        fascia.edges.forEach((edge) {
          //numPlate=operazione che calcola la somma giornaliera di plates in un passaggio
          int numPlate=giornata.numPlates(edge.from, edge.to);
          if (maxPassaggi < numPlate) maxPassaggi = numPlate;
        });
      });
    });
    return maxPassaggi;
  }

  void gates_disgiunti(){
    for(int n = 1; n <=numGates; n++) {
      for (int i = 0; i < giornate.length; i++) {
        for (int h = 0; h < giornate[i].fasce.length; h++){
          for (int j = 0; j < giornate[i].fasce[h].edges.length; j++) {
            if (giornate[i].fasce[h].edges[j].from == n && !gates_from.contains(n)) {
              gates_from.add(n);
            }
          }
        }
      }
    }
  }

  int num_righe(){
    int num_righe=0;
    bool bisestile=anno_bisestile(giornate[0].day);
    //int mese=giornate[0].day.month;
    giornate.forEach((giornata){
      if(giornata.day.day == 1) {
        //mese=giornata.day.month;
        bisestile = anno_bisestile(giornata.day);
        num_righe += 5;

        //se il mese è febbraio da 28 non aggiunge 1 riga, altrimenti +1 riga
        //num_righe += (giornata.day.month == 2 && !bisestile) ? 0 : 1;

        //se il primo giorno è sabato o domenica aggiungi un rigo
        num_righe += (giornata.day.weekday > 5) ? 1 : 0;
      }
    });
    return num_righe;
  }

  bool anno_bisestile(DateTime day){
    if(day.year~/4 == 0) {
      if (day.year ~/ 100 == 0) {
        if (day.year ~/ 400 == 0)
          return true;
        else return false;
      }
      else return false;
    }
    else return false;
  }

  bool is_disgiunto(int n) => !gates_from.contains(gate_num[n]);

  int get_gate(int i) => this.gate_num[i];

}

class BarraIstogramma{
  String color;
  int x;
  int y;
  int width;
  int height;
  int lineWidth;
  int maxAltezza;

  BarraIstogramma(int moveTo_from,  int moveTo_to,  int lineTo_from,  int lineTo_to,  int lineWidth, int maxAltezza){
    this.x = moveTo_from;
    this.y = moveTo_to;
    this.width = lineTo_from;
    this.height = lineTo_to;
    this.lineWidth = lineWidth;
    this.maxAltezza = maxAltezza;
  }

  setColor(String c){
    this.color = c;
  }

  toString(){
    return "x: " + x.toString() + " y: " + y.toString() + " width: " + width.toString() + " height: " + height.toString() + " lineWidth: " + lineWidth.toString();
  }

}