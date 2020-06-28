class SliderModel {
  SliderModel({this.text, this.imagePath});

  String text;
  String imagePath;

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  void setText(String t) {
    text = t;
  }

  String getText() {
    return text;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = List<SliderModel>();

  SliderModel sliderModel = SliderModel();

  //page1
  sliderModel.setText('Page 1');
  sliderModel.setImageAssetPath('assets/images/ob_1.png');
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //page2
  sliderModel.setText('Page 2');
  sliderModel.setImageAssetPath('assets/images/ob_2.png');
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //page3
  sliderModel.setText('Page 3');
  sliderModel.setImageAssetPath('assets/images/ob_3.png');
  slides.add(sliderModel);

  sliderModel = SliderModel();

  return slides;
}
