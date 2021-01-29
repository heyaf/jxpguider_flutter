class HYFHomeBannerModel {
  int id;
  String bannerUrl;
  bool isEnable;
  String createTime;
  String updateTime;

  HYFHomeBannerModel(
      {this.id,
      this.bannerUrl,
      this.isEnable,
      this.createTime,
      this.updateTime});

  HYFHomeBannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerUrl = json['bannerUrl'];
    isEnable = json['isEnable'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bannerUrl'] = this.bannerUrl;
    data['isEnable'] = this.isEnable;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
