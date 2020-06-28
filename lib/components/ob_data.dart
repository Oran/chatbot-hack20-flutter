class SliderModel {
  SliderModel({this.text, this.description, this.descriptionTwo});

  String text;
  String description;
  String descriptionTwo;

  void setText(String t) {
    text = t;
  }

  String getText() {
    return text;
  }

  void setDesc(String desc) {
    description = desc;
  }

  String getDesc() {
    return description;
  }

  void setDesc2(String desc2) {
    descriptionTwo = desc2;
  }

  String getDesc2() {
    return descriptionTwo;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = List<SliderModel>();

  SliderModel sliderModel = SliderModel();

  //page1
  sliderModel.setText('Ai');
  sliderModel.setDesc('ADD SOME DATA HERE'); //TODO: ADD DATA HERE
  sliderModel.setDesc2(''); 
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //page2
  sliderModel.setText('Made by');
  sliderModel.setDesc('Oran - @ItsOran');
  sliderModel.setDesc2('Stefan - @ExitTrance');
  slides.add(sliderModel);

  return slides;
}
