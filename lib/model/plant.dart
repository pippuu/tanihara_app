class PlantsData {
  String tools;
  String name;
  String eui;
  String id;
  String address;
  PlantsData(this.tools, this.name, this.eui, this.id, this.address);
}

List<PlantsData> datas = [PlantsData("NPK P201", "Cabai", "xxx", "xxx", "xxx")];

List<String> datasNames = [datas[0].name];
